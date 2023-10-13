import asyncio
from datetime import datetime

from aiohttp import ClientSession
from more_itertools import chunked

from model import Session, PersonModel, engine, Base
CHUNK_SIZE = 10
PEOPLE_COUNT = 83


async def chunked_async(iter, size):
    trans = []
    while True:
        try:
            item = await iter.__anext__()
        except StopAsyncIteration:
            break
        trans.append(item)
        if len(trans) == size:
            return trans
        trans = []


async def get_deep_url(url, key, session):
    async with session.get(f'{url}') as response:
        data = await response.json()
        return data[key]


async def get_deep_urls(urls, key, session):
    tasks = (asyncio.create_task(get_deep_url(url, key, session)) for url in urls)
    for task in tasks:
        return await task


async def get_deep_data(urls, key, session):
    tasks = [get_deep_url(url, key, session) for url in urls]
    deep_data = await asyncio.gather(*tasks)
    return ', '.join(deep_data)


async def insert_person(person_chunk):
    async with Session() as session:
        async with ClientSession() as session_deep:
            for person_json in person_chunk:
                if person_json.get('status') == 404:
                    break
                homeworld_data = await get_deep_data([person_json['homeworld']], 'name', session_deep)
                films_data = await get_deep_data(person_json['films'], 'title', session_deep)
                species_data = await get_deep_data(person_json['species'], 'name', session_deep)
                starships_data = await get_deep_data(person_json['starships'], 'name', session_deep)
                vehicles_data = await get_deep_data(person_json['vehicles'], 'name', session_deep)
                newperson = PersonModel(
                    birth_year=person_json['birth_year'],
                    eye_color=person_json['eye_color'],
                    gender=person_json['gender'],
                    hair_color=person_json['hair_color'],
                    height=person_json['height'],
                    mass=person_json['mass'],
                    name=person_json['name'],
                    skin_color=person_json['skin_color'],
                    homeworld=homeworld_data,
                    films=films_data,
                    species=species_data,
                    starships=starships_data,
                    vehicles=vehicles_data,
                )
                session.add(newperson)
                await session.commit()


async def get_person(person_id: int, session: ClientSession):
    print(f'begin {person_id}')
    async with session.get(f'https://swapi.dev/api/people/{person_id}') as response:
        if response.status == 404:
            return {'status': 404}
        person = await response.json()
        print(f'end {person_id}')
        return person


async def get_people():
    async with ClientSession() as session:
        people = []
        for id_chunk in chunked(range(1, PEOPLE_COUNT), CHUNK_SIZE):
            coroutines = [get_person(i, session=session) for i in id_chunk]
            chunk_results = await asyncio.gather(*coroutines)
            people.extend(chunk_results)
        return people


async def main():
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)
        await conn.run_sync(Base.metadata.create_all)
        await conn.commit()

    people = await get_people()
    for chunk in chunked(people, CHUNK_SIZE):
        asyncio.create_task(insert_person(chunk))

    tasks = set(asyncio.all_tasks()) - {asyncio.current_task()}

    for task in tasks:
        await task


if __name__ == '__main__':
    start = datetime.now()
    asyncio.run(main())
    print(datetime.now() - start)

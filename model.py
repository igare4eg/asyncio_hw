from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Text

PG_DSN = f'postgresql+asyncpg://postgres:1234@127.0.0.1:5431/asyncio_hw'
engine = create_async_engine(PG_DSN, echo=True)
Base = declarative_base()
Session = sessionmaker(bind=engine, class_=AsyncSession, expire_on_commit=False)


class PersonModel(Base):
    __tablename__ = 'persons'

    id = Column(Integer, primary_key=True)
    birth_year = Column(String)
    eye_color = Column(String)
    films = Column(Text)
    gender = Column(String)
    hair_color = Column(String)
    height = Column(String)
    homeworld = Column(String)
    mass = Column(String)
    name = Column(String)
    skin_color = Column(String)
    species = Column(Text)
    starships = Column(Text)
    vehicles = Column(Text)


def migrate_database():
    Base.metadata.create_all(engine)


if __name__ == "__main__":
    migrate_database()

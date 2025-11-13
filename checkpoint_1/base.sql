CREATE DATABASE realms_of_valoria;

-- Realms - Realms of the world
CREATE TABLE realms (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  region VARCHAR(50),
  founded_year INT,
  is_magical BOOLEAN DEFAULT FALSE,
  population BIGINT CHECK (population >= 0)
);

-- Races - Races or species of the world
CREATE TABLE races (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  average_lifespan INT CHECK (average_lifespan > 0),
  is_humanoid BOOLEAN DEFAULT FALSE,
  description TEXT,
  origin_realm_id INT REFERENCES realms(id) ON DELETE SET NULL
);

-- heroes - Champions or heroes legendaries 
CREATE TABLE heroes (
  id SERIAL PRIAMRY KEY,
  name VARCHAR(100) NOT NULL,
  title VARCHAR(100),
  birth_date DATE,
  power_level NUMERIC(5,2) CHECK (power_level >= 0),
  is_alive BOOLEAN DEFAULT TRUE,
  race_id INT REFERENCES races(id) ON DELETE CASCADE,
  realm_id INT REFERENCES realms(id) ON DELETE CASCADE
);

-- quests - Misions or adventures.
CREATE TABLE quests (
  id SERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  difficulty INT CHECK (difficulty BETWEEN 1 AND 10),
  reward_gold NUMERIC(10,2),
  status VARCHAR(20) DEFAULT 'Pending',
  created_at TIMESTAMP DEFAULT NOW(),
  assigned_hero_id INT REFERENCES heroes(id) ON DELETE SET NULL
);

-- items - Objects or Magic artifacts.
CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  is_cursed BOOLEAN DEFAULT FALSE,
  power_bonus INT,
  rarity VARCHAR(20) CHECK (rarity IN ('Common','Rare','Epic','Legendary')),
  crafted_at DATE,
  realm_id INT REFERENCES realms(id) ON DELETE CASCADE
);

--battles - Historical Battles.
CREATE TABLE battles (
  id SERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  description TEXT,
  date DATE,
  location VARCHAR(100),
  death_count INT,
  victorious_realm_id INT REFERENCES realms(id) ON DELETE SET NULL,
  realm_id INT REFERENCES realms(id) ON DELETE SET NULL
);
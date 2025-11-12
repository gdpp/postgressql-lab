-- 1. Crear una llave primaria en city (id)
ALTER TABLE city
ADD PRIMARY KEY (id);

-- 2. Crear un check en population, para que no soporte negativos
ALTER TABLE city
ADD CHECK (population >= 0);

-- 3. Crear una llave primaria compuesta en "countrylanguage"
-- los campos a usar como llave compuesta son countrycode y language
ALTER TABLE countrylanguage
ADD PRIMARY KEY (countrycode, language);

-- 4. Crear check en percentage, 
-- Para que no permita negativos ni números superiores a 100
ALTER TABLE countrylanguage
ADD CHECK ((percentage >= 0) AND (percentage <= 100));




CREATE UNIQUE INDEX "unique_name_countrycode_district" ON city (
  name, countrycode, district
)

SELECT * 
FROM city
WHERE name='Jinzhou' AND countrycode='CHN' AND district='Liaoning'


UPDATE city
SET name = 'Jinzhou OLD'
WHERE id = 2238 

CREATE INDEX "city_district" ON city (
  district
)
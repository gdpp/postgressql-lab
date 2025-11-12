SELECT * 
FROM country;


ALTER TABLE country
ADD PRIMARY KEY (code);

ALTER TABLE country
ADD CHECK (surfacearea >= 0);


SELECT DISTINCT continent
FROM country;

ALTER TABLE country
ADD CHECK (
  (continent = 'Asia') or
  (continent = 'South America') or
  (continent = 'North America') or
  (continent = 'Oceania') or
  (continent = 'Antarctica') or
  (continent = 'Africa') or
  (continent = 'Europe') or
  (continent = 'Central America')
);


ALTER TABLE country
DROP CONSTRAINT "country_continent_check";


CREATE UNIQUE INDEX "unique_country_name" ON country(
  name
);

CREATE INDEX "country_continent" ON country(
  continent
);
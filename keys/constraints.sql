ALTER TABLE city
ADD CONSTRAINT fk_country_code
FOREIGN KEY (countrycode)
REFERENCES country (code);

INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');


ALTER TABLE countrylanguage
ADD CONSTRAINT fk_country_language
FOREIGN KEY (countrycode)
REFERENCES country (code);


-- public.countrylanguage definition

-- Drop table

-- DROP TABLE public.countrylanguage;

CREATE TABLE countrylanguage (
	countrycode bpchar(3) NOT NULL,
	"language" text NOT NULL,
	isofficial bool NOT NULL,
	percentage float4 NOT NULL,
	CONSTRAINT "countrylanguage_percentage_check" CHECK (((percentage >= (0)) AND (percentage <= (100)))),
	CONSTRAINT "countrylanguage_pkey" PRIMARY KEY (countrycode, language)
);


-- public.countrylanguage foreign keys

ALTER TABLE countrylanguage ADD CONSTRAINT countrylanguage_countrycode_fkey FOREIGN KEY (countrycode) REFERENCES country(code) ON DELETE CASCADE;
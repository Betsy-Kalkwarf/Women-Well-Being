
DROP TABLE IF EXISTS CountryDemographics;


CREATE TABLE CountryDemographics (
   country_name character varying(50) NOT NULL,
  country_code character varying(5) NOT NULL,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  GDP FLOAT NOT NULL
);

SELECT * FROM countrydemographics;



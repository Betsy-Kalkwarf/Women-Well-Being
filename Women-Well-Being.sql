
DROP TABLE IF EXISTS CountryGDPDemographics;


CREATE TABLE CountryGDPDemographics (
   country_name character varying(50) NOT NULL,
  country_code character varying(5) NOT NULL,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  GDP FLOAT NOT NULL
);

SELECT * FROM CountryGDPDemographics;


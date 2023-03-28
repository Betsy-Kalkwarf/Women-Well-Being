# Women-Well-Being

## Reason why we selected our topic 
As women, we care about women's well-being and strive to figure out what aspects of life most impact if women live long and happy lives.

## Description of our source of data
"LivWell is a global longitudinal database which provides a range of key indicators related to women’s socioeconomic status, health and well-being, access to basic services, and demographic outcomes. Data are available at the sub-national level for 52 countries and 447 regions. A total of 134 indicators are based on 199 Demographic and Health Surveys for the period 1990-2019, supplemented by extensive information on socioeconomic and climatic conditions in the respective regions for a total of 190 indicators. The resulting data offer various opportunities for policy-relevant research on gender inequality, inclusive development, and demographic trends at the sub-national level." [Source]([url](https://www.kaggle.com/datasets/konradb/wellbeing-of-women-in-52-countries?resource=download))

## Questions we hope to answer with the data
- Is there a relationship between country demographics and aspects of life indicators (domestic violence rate, marriage age, years of education, and fertility rate) that impact women's overall well-being?
- Does GDP relate to these aspects of life?

## Technologies Used
- Python 3.8
- SciKitLearn
- AWS
- PostgresSQL 42.5.1.jar
- PySpark 3.2.3
- Plotly
- Excel
- Tableau

## Database: RDS Setup and ETL process for country demographics.

- Step1: Created a AWS database with postgres sql connection.
- Step2: Created S3 buckets and upoaded the following data sources.
       - 1) Country_GDP.csv
       - 2) Livwell_in_interpolated.csv
       - 3) world_country_and_usa_states_latitude_and_longitude_values.csv
- Step 3: Changed the visibility rules to public.
- Step 4: Created a PostgresSql databases that connects to the aws RDS.
- Step 5: Stored the connection string in the config.py
- Step 6: Created a schema for the CountryDemographics with the following fields (Women-Well-Being.sql):
        
```python
**      DROP TABLE IF EXISTS CountryDemographics;

        CREATE TABLE CountryDemographics (
        country_name character varying(50) NOT NULL,
        country_code character varying(5) NOT NULL,
        latitude FLOAT NOT NULL,
        longitude FLOAT NOT NULL,
        GDP FLOAT NOT NULL
        );**
```

- Step 7: Created a jupyter notebook Country_ETL.ipynb
- Step 8: Setup the pySpark session and postgresql.
- Step 9: Read the data from the aws database instance using Pyspark packages and load them into the dataframes.
- Step 10: Create a schema for country_df
   ```python
    schema = StructType([
  StructField("country_code", StringType(), False),  
  StructField("latitude", DoubleType(), True),
  StructField("longitude", DoubleType(), True),
  StructField("country_name", StringType(), False),
  ])
   ```
- Step 11: Rearrange the columns and drop the null values and store into another dataframe.
- Step 12: Read the Country_gdp and load it into the dataframe.
- Step 13: Dropped the not needed columns "Indicator name","Indicator Code".
- Step 14: Renamed the colummns "Country Name" and "Country Code" to "country_name" and "country_code".
- Step 15: Dropped the null values.
- Step 16: Calculated the average GDP of a country considering from the year 2000 till 2021 with row-wise aggregation and copied into a new dataframe.
- Step 17: Created the inner join considering the country name in both the data frames country and country gdp.
- Step 18: The resultant dataframe is uploaded into the database table in postgressql for further analysis with the livewell women well being dataset.

Added screenshot of database updations.
![Schema and table results](https://user-images.githubusercontent.com/111100908/210674327-ba064496-361c-4ee5-8bca-939dbfe21ea4.png)

=======

### Data Cleaning [Country Demographics](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/main/CountryDemographics.csv)
Our database was huge and had numerous missing values so we replaced those N/A values to 0. We only considered data after the year 2000. We chose five independent variables to operate as our input in our machine learning model. The indicators are: Domestic Violence Rate, Mean of Age, Mean of Marriage Age, Mean of Education Years, and Fertility Rate for 52 countries. 

### Data Integration [Country Indicators](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/main/Country_Indicators.csv)
We found three different sources from AWS and merged them together to include the country's GDP, Latitude, and Longitude. 

### Data Transformation [Livewell Mean Indicators](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/main/Livewell_Mean_Indicators.csv)
Based on country name, we calculated the average for each indicator and clustered them together. We used standard scaler to scale up or down the averages. 

### Data Reduction [Women Well Being Data](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/main/Women_Wellbeing_data.csv)
We applied Principal Component Analysis to perform feature reduction. 

=======

## Machine Learning - Unsupervised

We chose an unsupervised learning model because the data source did not have any predictions, and we wanted to be able to cluster the indicators chosen based on country.

- Step 1: Added ML_Indicators.ipynb
- Step 2: Retrieved the datasource from remote database.
- Step 3: Converted the pySpark datframe to pandas.
- Step 4: Cleaned and created a new dataframe considering the means Indicators (22 columns/401 columns).
- Step 5: Set up the machine learning model.
- Step 6: Scaled the data.
- Step 7: Fit and transform the data.
- Step 8: Applied PCA for feature reduction.
- Step 9: Checked the elbow curve to find the best count of clusters for K-Means clustering.
![Elbow Curve K6](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/main/Resources/Elbow_curve.png)


- Step 10: Created a 3d scatter plot to check the clusters.
![PCA Clusters](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/main/Resources/PCA-Cluster.png)

=======

## Dashboard
The dashboard for our project can be found on Tableau. (This is version 2.0 with the change in ML indicators.)
[link to story](https://public.tableau.com/app/profile/betsy.kalkwarf/viz/WomensWellBeing2_0/Maps?publish=yes)

=======

## Presentation
- [Google Slides Presentation](https://docs.google.com/presentation/d/1hRlJgyBabrDAQDgSi3ly5Jqvl-1FRBKlJ0P7cGGbLTE/edit#slide=id.g1d494fcdba2_0_0)



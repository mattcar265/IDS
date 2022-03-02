use ids4db;
set SQL_SAFE_UPDATES = 0;

delete from Life_Expectancy
where population = 0;

select Life_Expectancy
from Life_Expectancy
where Life_Expectancy = 0;

#Data cleaning

#Life Expectancy 2013
select Country, Year
from Life_Expectancy
where Life_Expectancy = 0 and Year = 2013;

select
	@LifeExpectancy := avg(Life_Expectancy)
from Life_Expectancy
where Year = 2013;

update Life_Expectancy
set Life_Expectancy = @Life_Expectancy
where Year = 2013 and Life_Expectancy = 0;

#Life Expectancy 2014
select Country, Year
from Life_Expectancy
where Life_Expectancy = 0 and Year = 2014;

#Life Expectancy 2015
select Country, Year
from Life_Expectancy
where Life_Expectancy = 0 and Year = 2015;

#Year
select Country, Year
from Life_Expectancy
where Year = 0;

#Adult Mortality
select Country, Year
from Life_Expectancy
where Adult_Mortality = 0 and Year = 2015;

select
	@Adult_Mortality := avg(Adult_Mortality)
from Life_Expectancy
where Year = 2013;

update Life_Expectancy
set Adult_Mortality = @Adult_Mortality
where Year = 2013 and Adult_Mortality = 0;

#Alcohol
select Country, Year
from Life_Expectancy
where Alcohol = 0 and Year = 2015;

select
	@Alcohol := avg(Alcohol)
from Life_Expectancy
where Year = 2015;

update Life_Expectancy
set Alcohol = @Alcohol
where Year = 2015 and Alcohol = 0;

#Percentage Expenditure
select Country, Year
from Life_Expectancy
where Percentage_Expenditure = 0 and Year = 2015;

select
	@Percentage_Expenditure := avg(Percentage_Expenditure)
from Life_Expectancy
where Year = 2014;

update Life_Expectancy
set Percentage_Expenditure = @Percentage_Expenditure
where Year = 2014 and Percentage_Expenditure = 0;

#BMI
select Country, Year
from Life_Expectancy
where BMI = 0 and Year = 2015;

select
	@BMI := avg(BMI)
from Life_Expectancy
where Year = 2015;

update Life_Expectancy
set BMI = @BMI
where Year = 2015 and BMI = 0;

#Total Expenditure
select Country, Year
from Life_Expectancy
where Total_Expenditure = 0 and Year = 2015;

select
	@Total_Expenditure := avg(Total_Expenditure)
from Life_Expectancy
where Year = 2011;

update Life_Expectancy
set Total_Expenditure = @Total_Expenditure
where Year = 2011 and Total_Expenditure = 0;

#Total Expenditure
select Country, Year
from Life_Expectancy
where Total_Expenditure = 0 and Year = 2015;

select
	@Total_Expenditure := avg(Total_Expenditure)
from Life_Expectancy
where Year = 2011;

update Life_Expectancy
set Total_Expenditure = @Total_Expenditure
where Year = 2011 and Total_Expenditure = 0;

#GDP
select Country, Year
from Life_Expectancy
where GDP = 0 and Year = 2015;

select
	@GDP := avg(GDP)
from Life_Expectancy
where Year = 2015;

update Life_Expectancy
set GDP = @GDP
where Year = 2015 and GDP = 0;

#Schooling
select Country, Year
from Life_Expectancy
where Schooling = 0 and Year = 2015;

select
	@Schooling := avg(Schooling)
from Life_Expectancy
where Year = 2013;

update Life_Expectancy
set Schooling = @Schooling
where Year = 2013 and Schooling = 0;

#Alcohol 2015
select
	@Alcohol2015 := avg(Alcohol)
from Life_Expectancy
where Year = 2015 and Alcohol > 0;

update Life_Expectancy
set Alcohol = @Alcohol2015
where Year = 2015 and Alcohol = 0;

#Percentage Expenditure 2015
select
	@Percentage_Expenditure2015 := avg(Percentage_Expenditure)
from Life_Expectancy
where Year = 2015 and Percentage_Expenditure > 0;

update Life_Expectancy
set Percentage_Expenditure = @Percentage_Expenditure2015
where Year = 2015 and Percentage_Expenditure = 0;

#Total Expenditure 2015
select
	@Total_Expenditure2015 := avg(Total_Expenditure)
from Life_Expectancy
where Year = 2015 and Total_Expenditure > 0;

update Life_Expectancy
set Total_Expenditure = @Total_Expenditure2015
where Year = 2015 and Total_Expenditure = 0;

select count(distinct Country) as "Total Countries"
from Life_Expectancy;

select 
	@max_mortality_2010 := max(Adult_Mortality),
    @min_mortality_2010 := min(Adult_Mortality)
from Life_Expectancy
where Year = 2010;

select 
	@max_mortality_2011 := max(Adult_Mortality),
    @min_mortality_2011 := min(Adult_Mortality)
from Life_Expectancy
where Year = 2011;

select 
	@max_mortality_2012 := max(Adult_Mortality),
    @min_mortality_2012 := min(Adult_Mortality)
from Life_Expectancy
where Year = 2012;

select 
	@max_mortality_2013 := max(Adult_Mortality),
    @min_mortality_2013 := min(Adult_Mortality)
from Life_Expectancy
where Year = 2013;

select 
	@max_mortality_2014 := max(Adult_Mortality),
    @min_mortality_2014 := min(Adult_Mortality)
from Life_Expectancy
where Year = 2014;

select 
	@max_mortality_2015 := max(Adult_Mortality),
    @min_mortality_2015 := min(Adult_Mortality)
from Life_Expectancy
where Year = 2015;

select @min_mortality_2010 as "Min Mortality 2010",
	@max_mortality_2010 as "Max Mortality 2010",
	@min_mortality_2011 as "Min Mortality 2011",
    @max_mortality_2011 as "Max Mortality 2011",
    @min_mortality_2012 as "Min Mortality 2012",
    @max_mortality_2012 as "Max Mortality 2012",
	@min_mortality_2013 as "Min Mortality 2013",
    @max_mortality_2013 as "Max Mortality 2013",
	@min_mortality_2014 as "Min Mortality 2014",
    @max_mortality_2014 as "Max Mortality 2014",
	@min_mortality_2015 as "Min Mortality 2015",
    @max_mortality_2015 as "Max Mortality 2015"
from Life_Expectancy;

select Country, min(Adult_Mortality), max(Adult_Mortality)
from Life_Expectancy;

select Year as "Year (first min, then max)", Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select min(Adult_Mortality) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select max(Adult_Mortality) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select min(Adult_Mortality) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select max(Adult_Mortality) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select min(Adult_Mortality) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select max(Adult_Mortality) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select min(Adult_Mortality) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select max(Adult_Mortality) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select min(Adult_Mortality) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select max(Adult_Mortality) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select min(Adult_Mortality) from Life_Expectancy where Year = 2015) and Year = 2015
union all
select Year, Country, Adult_Mortality
from Life_Expectancy
where Adult_Mortality = (select max(Adult_Mortality) from Life_Expectancy where Year = 2015) and Year = 2015;


select Year as "Year (first min, then max)", Country, Population
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2015) and Year = 2015
union all
select Year, Country, Population
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2015) and Year = 2015;


select Year as "Year (first min, then max)", Country, GDP
from Life_Expectancy
where GDP = (select min(GDP) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select max(GDP) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select min(GDP) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select max(GDP) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select min(GDP) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select max(GDP) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select min(GDP) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select max(GDP) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select min(GDP) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select max(GDP) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select min(GDP) from Life_Expectancy where Year = 2015) and Year = 2015
union all
select Year, Country, GDP
from Life_Expectancy
where GDP = (select max(GDP) from Life_Expectancy where Year = 2015) and Year = 2015;


select Year as "Year (first min, then max)", Country, Schooling
from Life_Expectancy
where Schooling = (select min(Schooling) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select max(Schooling) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select min(Schooling) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select max(Schooling) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select min(Schooling) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select max(Schooling) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select min(Schooling) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select max(Schooling) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select min(Schooling) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select max(Schooling) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select min(Schooling) from Life_Expectancy where Year = 2015) and Year = 2015
union all
select Year, Country, Schooling
from Life_Expectancy
where Schooling = (select max(Schooling) from Life_Expectancy where Year = 2015) and Year = 2015;


select Year as "Year (first min, then max)", Country, Alcohol
from Life_Expectancy
where Alcohol = (select min(Alcohol) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select max(Alcohol) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select min(Alcohol) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select max(Alcohol) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select min(Alcohol) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select max(Alcohol) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select min(Alcohol) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select max(Alcohol) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select min(Alcohol) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select max(Alcohol) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select min(Alcohol) from Life_Expectancy where Year = 2015) and Year = 2015
union all
select Year, Country, Alcohol
from Life_Expectancy
where Alcohol = (select max(Alcohol) from Life_Expectancy where Year = 2015) and Year = 2015;

select Country, Life_Expectancy, Population
from Life_Expectancy
where Year = 2010
order by Population desc;

select Year as "Year (first min, then max)", Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2010) and Year = 2010
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2011) and Year = 2011
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2012) and Year = 2012
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2013) and Year = 2013
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2014) and Year = 2014
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select min(Population) from Life_Expectancy where Year = 2015) and Year = 2015
union all
select Year, Country, Population, Life_Expectancy
from Life_Expectancy
where Population = (select max(Population) from Life_Expectancy where Year = 2015) and Year = 2015;


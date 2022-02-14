use ids4db;

select state
from USArrestsSQL
group by(state);

select *
from USArrestsSQL;

select *
from USArrestsSQL
where Assault=0-;

SET SQL_SAFE_UPDATES = 0;

update USArrestsSQL
set Assault = null
where Assault=0;

select *
from USArrestsSQL
where Assault is null;

select
	@avg_assault := avg(Assault)
from USArrestsSQL;

update USArrestsSQL
set Assault = @avg_assault
where Assault is null;

select *
from USArrestsSQL;

select min(Assault) as "Min Assault",
	max(Assault) as "Max Assault", 
	format(avg(Assault),2) as "Avg Assault", 
    format(variance(Assault),2) as "Variance of Assault"
from USArrestsSQL;

select min(Murder) as "Min Murder",
	max(Murder) as "Max Murder", 
	format(avg(Murder),2) as "Avg Murder", 
    format(variance(Murder),2) as "Variance of Murder"
from USArrestsSQL;

select min(UrbanPop) as "Min Urban Pop.",
	max(UrbanPop) as "Max Urban Pop.", 
	format(avg(UrbanPop),2) as "Avg Urban Pop.", 
    format(variance(UrbanPop),2) as "Variance of Urban Pop."
from USArrestsSQL;

select State, Murder
from USArrestsSQL
order by Murder desc;

select State, UrbanPop
from USArrestsSQL
order by UrbanPop asc;

select count(State) as "Murder Rates Higher than AZ"
from USArrestsSQL
where Murder > 8;

select State, Murder
from USArrestsSQL
where Murder > 8;

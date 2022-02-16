use ids4db;

select *
from child_mortalitySQL;

select UnderFiveMortalityRate
from child_mortalitySQL;

select *
from child_mortalitySQL;

select Year, UnderFiveMortalityRate as "Mean UnderFive MR", 
	InfantMortalityRate as "Mean Infant MR", 
	NeonatalMortalityRate as "Mean Neonatal MR"
from child_mortalitySQL
where Year=2003;

set SQL_SAFE_UPDATES=0;

update child_mortalitySQL
set UnderFiveMortalityRate=69.2
where UnderFiveMortalityRate=0;

update child_mortalitySQL
set InfantMortalityRate=48.6
where InfantMortalityRate=0;

update child_mortalitySQL
set NeonatalMortalityRate=28
where NeonatalMortalityRate=0;

select *
from child_mortalitySQL;

select Year, InfantMortalityRate
from child_mortalitySQL
order by InfantMortalityRate asc;

select
	@avg_neonatal := avg(NeonatalMortalityRate)
from child_mortalitySQL;

select Year, NeonatalMortalityRate
from child_mortalitySQL
where NeonatalMortalityRate > @avg_neonatal;  

select Year, InfantMortalityRate
from child_mortalitySQL
order by InfantMortalityRate desc;

select min(InfantMortalityRate) as "Min Infant MR", 
	max(InfantMortalityRate) as "Max Infant MR", 
    format(avg(InfantMortalityRate), 2) as "Avg Infant MR",
	format(variance(InfantMortalityRate), 2) as "Variance",
    format(std(InfantMortalityRate), 2) as "Standard Dev"
from child_mortalitySQL;

select min(NeonatalMortalityRate) as "Min Neonatal MR", 
	max(NeonatalMortalityRate) as "Max Neonatal MR", 
    format(avg(NeonatalMortalityRate), 2) as "Avg Neonatal MR",
	format(variance(NeonatalMortalityRate), 2) as "Variance",
    format(std(NeonatalMortalityRate), 2) as "Standard Dev"
from child_mortalitySQL;

select min(UnderFiveMortalityRate) as "Min Under-Five MR", 
	max(UnderFiveMortalityRate) as "Max Under-Five MR", 
    format(avg(UnderFiveMortalityRate), 2) as "Avg Under-Five MR",
	format(variance(UnderFiveMortalityRate), 2) as "Variance",
    format(std(UnderFiveMortalityRate), 2) as "Standard Dev"
from child_mortalitySQL;

select *
from child_mortalitySQL;

set SQL_SAFE_UPDATES=0;

alter table child_mortalitySQL
add OverFiveMortalityRate double;

update child_mortalitySQL
set OverFiveMortalityRate = UnderFiveMortalityRate + 20.55;

select Year,
	format(OverFiveMortalityRate,1) as "OverFiveMortalityRate", 
	format(UnderFiveMortalityRate,1) as "UnderFiveMortalityRate", 
	format(InfantMortalityRate,1) as "InfantMortalityRate",
	format(NeonatalMortalityRate,1) as "NeonatalMortalityRate"
from child_mortalitySQL;



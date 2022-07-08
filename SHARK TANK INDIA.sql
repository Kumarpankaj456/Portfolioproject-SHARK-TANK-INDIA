select * from [Portfolioproject(SHARK TANK INDIA)]..data
-- TOTAL NO EPISODES
select epno from [Portfolioproject(SHARK TANK INDIA)]..data
select distinct epno from [Portfolioproject(SHARK TANK INDIA)]..data
select count(distinct epno) from [Portfolioproject(SHARK TANK INDIA)]..data
--NO PITCHES
select distinct brand from [Portfolioproject(SHARK TANK INDIA)]..Data
select count(distinct brand) from [Portfolioproject(SHARK TANK INDIA)]..data
--PITCHES CONVERTED
select amountinvestedlakhs FROM [Portfolioproject(SHARK TANK INDIA)]..Data
select amountinvestedlakhs , case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from [Portfolioproject(SHARK TANK INDIA)]..data
--total number of funding recieved from total number of pitches 
select sum(a.converted_not_converted) Funding_recieved, count(*)totalpitches from(
select amountinvestedlakhs , case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from [Portfolioproject(SHARK TANK INDIA)]..data) a

--percentage funding recieved..
select cast(sum(a.converted_not_converted) as float) /cast(count(*) as float) Percentage_Funding from (
select amountinvestedlakhs , case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from [Portfolioproject(SHARK TANK INDIA)]..data) a

--total number of male participants
select sum(male) Male_Prticipants from [Portfolioproject(SHARK TANK INDIA)]..data

--total number of female Participants
select sum(female) Female_Prticipants from [Portfolioproject(SHARK TANK INDIA)]..data

--gender ratio
select sum(female)/sum(male) Gender_ratio from [Portfolioproject(SHARK TANK INDIA)]..data
--total amount invested
select sum(amountinvestedlakhs) Total_amount_invested_lakhs from [Portfolioproject(SHARK TANK INDIA)]..data
 
 --averge equity taken
 select * from [Portfolioproject(SHARK TANK INDIA)]..data where EquityTaken>0;
 select avg(a.EquityTaken) Avergeequitytaken from
 (select * from [Portfolioproject(SHARK TANK INDIA)]..data where EquityTaken>0) a

 --highhest deal taken
 select max(amountinvestedlakhs) Highest_Deal from [Portfolioproject(SHARK TANK INDIA)]..data
 ---highest equity taken
 select max(equitytaken)Highest_equity_taken from [Portfolioproject(SHARK TANK INDIA)]..data

--star_up having at least one women 
select sum(female) from [Portfolioproject(SHARK TANK INDIA)]..data

select sum(a.female_count) Start_up_atleat_one_women from(
select female, case when female>0 then 1 else 0 end as female_count from [Portfolioproject(SHARK TANK INDIA)]..data) a
 
 --pitches converted having atleast one women
 
 
 select * from [Portfolioproject(SHARK TANK INDIA)]..data where deal!='no deal'

 select * from [Portfolioproject(SHARK TANK INDIA)]..data

 select a.* ,case when a.female>0 then 1 else 0 end as female_count from(
 select * from [Portfolioproject(SHARK TANK INDIA)]..data where deal!='no deal') a

  select case when a.female>0 then 1 else 0 end as female_count, a.*from(
  select * from [Portfolioproject(SHARK TANK INDIA)]..data where deal!='no deal') a

  --final code
  
  select sum(b.female_count) start_up_atleat_onewomen_withdeal from(
  select case when a.female>0 then 1 else 0 end as female_count, a.*from(
  select * from [Portfolioproject(SHARK TANK INDIA)]..data where deal!='no deal') a) b

  --avg team member
  select teammembers,brand,amountinvestedlakhs,equitytakenP from [Portfolioproject(SHARK TANK INDIA)]..data where deal!='no deal' order by equitytakenp
  select avg(teammembers)  from [Portfolioproject(SHARK TANK INDIA)]..data

  --avg amount invested perdeal
  select avg(a.amountinvestedlakhs) amt_invested_per_deal from(
  select * from [Portfolioproject(SHARK TANK INDIA)]..data where deal!='no deal')a

  --age group of contestent
  select avgage,count(avgage) avgage_count from [Portfolioproject(SHARK TANK INDIA)]..data group by Avgage order by avgage_count desc

-- location grp of contestent
  select locations,count(locations) location_count from [Portfolioproject(SHARK TANK INDIA)]..data group by locations order by location_count desc

  --sector grp of contestent
  select sector,count(sector) sector_cnt from [Portfolioproject(SHARK TANK INDIA)]..data group by sector order by sector_cnt desc

  --partner deals
  select partners, count(partners) partners_cnt from [Portfolioproject(SHARK TANK INDIA)]..data  where partners!='-' group by partners order by partners_cnt desc
  select * from [Portfolioproject(SHARK TANK INDIA)]..data

  --making the matrix
select count(ashneeramountinvested) Ashneer_deals from [Portfolioproject(SHARK TANK INDIA)]..data where AshneerAmountInvested is not null
select count(ashneeramountinvested) Ashneer_deals from [Portfolioproject(SHARK TANK INDIA)]..data where AshneerAmountInvested is not null and AshneerAmountInvested!=0

select sum(c.ashneeramountinvested)Ashneer_Total_amount_invetesd, avg(ashneerequitytakenp) Ashneer_avg_equity_taken
from(select * from [Portfolioproject(SHARK TANK INDIA)]..data where ashneerequitytakenp!=0 and ashneerequitytakenp is not null)c


select a.sharks,a.total_deals_present,b.total_deals from(
select 'Ashneer' as Sharks,count(ashneeramountinvested) total_deals_present from [Portfolioproject(SHARK TANK INDIA)]..data 
where AshneerAmountInvested is not null)a

inner join(
select 'Ashneer'as Sharks, count(ashneeramountinvested) total_deals from [Portfolioproject(SHARK TANK INDIA)]..data 
where AshneerAmountInvested is not null  and ashneeramountinvested!=0) b
on a.sharks=b.sharks



--ashneer's data

select m.sharks,m.total_deals_present,m.total_deals,n.Total_amount_invetesd,n.Avg_equity_taken from
(select a.sharks,a.total_deals_present,b.total_deals from(
select 'Ashneer' as Sharks,count(ashneeramountinvested) total_deals_present from [Portfolioproject(SHARK TANK INDIA)]..data 
where AshneerAmountInvested is not null)a

inner join(
select 'Ashneer'as Sharks, count(ashneeramountinvested) total_deals from [Portfolioproject(SHARK TANK INDIA)]..data 
where AshneerAmountInvested is not null  and ashneeramountinvested!=0) b
on a.sharks=b.sharks)m

inner join
(select  'ashneer' as sharks ,sum(c.ashneeramountinvested) Total_amount_invetesd,
avg(ashneerequitytakenp) Avg_equity_taken
from(select * from [Portfolioproject(SHARK TANK INDIA)]..data where
ashneerequitytakenp!=0 and ashneerequitytakenp is not null)c)n
on m.sharks=n.sharks
union all
--aman's data
select m.sharks,m.total_deals_present,m.total_deals,n.Total_amount_invetesd,n.Avg_equity_taken from
(select a.sharks,a.total_deals_present,b.total_deals from(
select 'Aman' as Sharks,count(amanamountinvested) total_deals_present from [Portfolioproject(SHARK TANK INDIA)]..data 
where AmanAmountInvested is not null)a

inner join(
select 'Aman'as Sharks, count(amanamountinvested) total_deals from [Portfolioproject(SHARK TANK INDIA)]..data 
where AmanAmountInvested is not null  and amanamountinvested!=0) b
on a.sharks=b.sharks)m

inner join
(select  'aman' as sharks ,sum(c.amanamountinvested) Total_amount_invetesd,
avg(amanequitytakenp) Avg_equity_taken
from(select * from [Portfolioproject(SHARK TANK INDIA)]..data where
amanequitytakenp!=0 and amanequitytakenp is not null)c)n
on m.sharks=n.sharks
    

--namita's data

select m.sharks,m.total_deals_present,m.total_deals,n.Total_amount_invetesd,n.Avg_equity_taken from
(select a.sharks,a.total_deals_present,b.total_deals from(
select 'Namita' as Sharks,count(namitaamountinvested) total_deals_present from [Portfolioproject(SHARK TANK INDIA)]..data 
where namitaAmountInvested is not null)a

inner join(
select 'Namita'as Sharks, count(namitaamountinvested) total_deals from [Portfolioproject(SHARK TANK INDIA)]..data 
where namitaAmountInvested is not null  and namitaamountinvested!=0) b
on a.sharks=b.sharks)m

inner join
(select  'Namita' as sharks ,sum(c.namitaamountinvested) Total_amount_invetesd,
avg(namitaequitytakenp) Avg_equity_taken
from(select * from [Portfolioproject(SHARK TANK INDIA)]..data where
namitaequitytakenp!=0 and namitaequitytakenp is not null)c)n
on m.sharks=n.sharks
--peyush's data
select m.sharks,m.total_deals_present,m.total_deals,n.Total_amount_invetesd,n.Avg_equity_taken from
(select a.sharks,a.total_deals_present,b.total_deals from(
select 'Peyush' as Sharks,count(peyushamountinvested) total_deals_present from [Portfolioproject(SHARK TANK INDIA)]..data 
where peyushAmountInvested is not null)a

inner join(
select 'Peyush'as Sharks, count(peyushamountinvested) total_deals from [Portfolioproject(SHARK TANK INDIA)]..data 
where peyushAmountInvested is not null  and peyushamountinvested!=0) b
on a.sharks=b.sharks)m

inner join
(select  'Peyush' as sharks ,sum(cast(c.peyushamountinvested as float))Total_amount_invetesd,
avg(cast(peyushequitytakenp as float)) Avg_equity_taken
from(select * from [Portfolioproject(SHARK TANK INDIA)]..data where
peyushequitytakenp!=0 and peyushequitytakenp is not null)c)n
on m.sharks=n.sharks

--ghazal's data
select m.sharks,m.total_deals_present,m.total_deals,n.Total_amount_invetesd,n.Avg_equity_taken from
(select a.sharks,a.total_deals_present,b.total_deals from(
select 'Ghazal' as Sharks,count(ghazalamountinvested) total_deals_present from [Portfolioproject(SHARK TANK INDIA)]..data 
where ghazalAmountInvested is not null)a

inner join(
select 'Ghazal'as Sharks, count(ghazalamountinvested) total_deals from [Portfolioproject(SHARK TANK INDIA)]..data 
where ghazalAmountInvested is not null  and ghazalamountinvested!=0) b
on a.sharks=b.sharks)m

inner join
(select  'Ghazal' as sharks ,sum(cast(c.ghazalamountinvested as float)) Total_amount_invetesd,
avg(cast(ghazalequitytakenp as float)) Avg_equity_taken
from(select * from [Portfolioproject(SHARK TANK INDIA)]..data where
ghazalequitytakenp!='na' and ghazalequitytakenp is not null)c)n
on m.sharks=n.sharks

--vineeta's data
select m.sharks,m.total_deals_present,m.total_deals,n.Total_amount_invetesd,n.Avg_equity_taken from
(select a.sharks,a.total_deals_present,b.total_deals from(
select 'Vineeta' as Sharks,count(vineetaamountinvested) total_deals_present from [Portfolioproject(SHARK TANK INDIA)]..data 
where vineetaAmountInvested is not null)a

inner join(
select 'Vineeta'as Sharks, count(vineetaamountinvested) total_deals from [Portfolioproject(SHARK TANK INDIA)]..data 
where vineetaAmountInvested is not null  and vineetaamountinvested!=0) b
on a.sharks=b.sharks)m

inner join
(select  'Vineeta' as sharks ,sum(c.vineetaamountinvested) Total_amount_invetesd,
avg(vineetaequitytakenp) Avg_equity_taken
from(select * from [Portfolioproject(SHARK TANK INDIA)]..data where
vineetaequitytakenp!=0 and vineetaequitytakenp is not null)c)n
on m.sharks=n.sharks



--shartups in which highest the highest amount had invested

select c.* from 
(select brand,sector,amountinvestedlakhs,rank() over(partition by sector order by amountinvestedlakhs desc) rnk 

from [Portfolioproject(SHARK TANK INDIA)]..DATA) c

where c.rnk=1

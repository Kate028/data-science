select * from athlete_events;

-- How many olympics games have been held?
select count(distinct(games)) as no_of_games from athlete_events;

-- List down all Olympics games held so far.
select distinct games as all_games from athlete_events;

-- Mention the total no of nations who participated in each olympics game?
select count(distinct(noc)) as nations from athlete_events;

-- Which year saw the highest and lowest no of countries participating in olympics?
select year from athlete_events where  min(count(distinct(noc))) ;

-- Which nation has participated in all of the olympic games?
select noc from athlete_events 
where noc in(select distinct games from athlete_events);

-- Identify the sport which was played in all summer olympics.
-- -- total no of summer olympics games
-- -- for each sport, how many games where played in
-- -- compare both

with t1 as
	(select count(distinct games) as total_summer_games
    from athlete_events where season = 'summer' order by games),

t2 as
	(select distinct sport, games
    from athlete_events where season = 'summer' order by games),

t3 as 
	(select sport, count(games) as no_of_games
    from t2 group by sport)

select * from t3
join t1 on t1.total_summer_games = t3.no_of_games;
	

select distinct sport, count(sport), games
from athlete_events where season = 'summer' 
group by sport,games
order by games;

-- Which Sports were just played only once in the olympics?
-- Fetch the total no of sports played in each olympic games.
-- Fetch details of the oldest athletes to win a gold medal.
-- Find the Ratio of male and female athletes participated in all olympic games.
-- Fetch the top 5 athletes who have won the most gold medals.
-- -- all gold medals
with t1 as
	(select name, count(1) as total_medals from athlete_events
	where medal = 'Gold'
	group by name
	order by count(1) desc),
t2 as 
	(select *, dense_rank() over(order by total_medals desc) as rnk
    from t1)
    
select * from t2
where rnk <= 5;

select name, count(medal) from athlete_events
where medal = 'Gold'
group by name;

-- Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
select distinct(name), count((medal)), medal
from athlete_events 
where medal in ('gold', 'silver', 'bronze')
group by name, medal
order by count(medal) desc
limit 5;

-- Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
select 
	 distinct r.region, count(medal) as successful_countries
from 
	athlete_events e 
inner join 
	noc_regions r on e.NOC = r.NOC
group by r.NOC, r.region
order by count(medal) desc
limit 5;

-- List down total gold, silver and broze medals won by each country.
select distinct(r.region), medal, count((medal)) as total_no_of_medals
from athlete_events e inner join noc_regions r 
on e.noc = r.noc
where medal in ('gold' , 'silver', 'bronze')
group by region, medal
order by count(medal) desc;

-- List down total gold, silver and broze medals won by each country corresponding to each olympic games.
select distinct r.region, e.games, medal, count(medal)
from athlete_events e inner join noc_regions r
on e.noc = r.noc
where medal in ('gold', 'silver', 'bronze')
group by r.region, e.games, medal;

-- Identify which country won the most gold, most silver and most bronze medals in each olympic games.
select distinct r.region, e.games, medal, count(medal) as no_of_medals
from athlete_events e inner join noc_regions r
on e.noc = r.noc
where medal in ('gold', 'silver', 'bronze')
group by r.region, e.games, medal
order by count(medal) desc;

-- Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games.
select distinct r.region, e.games, medal, count(medal) as medal_count,
count(medal) OVER (partition BY games) AS each_olympic_games
from athlete_events e inner join noc_regions r
on e.noc = r.noc
where medal in ('gold', 'silver', 'bronze')
group by r.region, e.games, medal
order by count(medal) desc;

-- Which countries have never won gold medal but have won silver/bronze medals?
select * from athlete_events;
select * from noc_regions;

select distinct r.region, medal
from athlete_events e inner join noc_regions r
on e.noc = r.noc
where medal in ('silver', 'bronze') and medal != 'gold'
group by r.region,  medal
order by count(medal) desc;

-- In which Sport/event, India has won highest medals.
select distinct sport, event, r.region, medal, count(medal)
from athlete_events e inner join noc_regions r
on e.noc = r.noc
where r.region = 'India' and medal in ('gold', 'silver', 'bronze')
group by sport, event, r.region, medal
order by count(medal) desc;

-- Break down all olympic games where india won medal for Hockey and how many medals in each olympic games.

select distinct sport, event, r.region, medal, count(medal)
OVER (partition BY games) AS each_olympic_games
from athlete_events e inner join noc_regions r
on e.noc = r.noc
where r.region = 'India' and medal in ('gold', 'silver', 'bronze')
group by medal, games
order by count(medal) desc;

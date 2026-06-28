create database ipl_analytics_db;

use ipl_analytics_db;

select count(*) as total_deliveries from deliveries;
select count(*) as total_matches from matches;

select min(date) as first_date,
max(date)as last_date
from matches;


select *from deliveries;


alter table deliveries
modify column matchId int,
modify column inning int,
modify column over_ball decimal(4,1),
MODIFY COLUMN `over`  INT,
modify column  ball int,
modify column batting_team varchar(100),
modify column  bowling_team varchar(100),
modify column  batsman varchar(50),
modify column non_striker varchar(50),
modify column bowler varchar(50),
modify column batsman_runs int,
modify column extras int,
modify column isWide int,
modify column isNoBall int,
modify column Byes int,
modify column LegByes int,
modify column Penalty int,
modify column dismissal_kind varchar(30),
modify column player_dismissed varchar(30),
modify column date date,
modify column wicket int,
modify column total_runs int;


ALTER TABLE deliveries
ADD COLUMN delivery_id BIGINT AUTO_INCREMENT PRIMARY KEY;



select *from matches;

alter table matches
modify column season varchar(30),
modify column venue varchar(255),
modify column event varchar(100),
modify column winner_runs int,
modify column umpire2 varchar(50),
modify column toss_winner varchar(100),
modify column date date,
modify column umpire1 varchar(50),
modify column city varchar(100),
modify column reserve_umpire  varchar(50),
modify column winner varchar(100),
modify column method varchar(20),
modify column team1 varchar(100),
modify column toss_decision varchar(50),
modify column gender varchar(30),
modify column team2 varchar(100),
modify column balls_per_over int,
modify column winner_wickets int,
modify column tv_umpire varchar(50),
modify column player_of_match varchar(100),
modify column match_referee varchar(50),
modify column  outcome varchar(30),
modify column match_number int,
modify column matchId int;


alter table matches
add primary key(matchId);


alter table deliveries
ADD CONSTRAINT fk_match
FOREIGN KEY (matchId)
references matches(matchId);

-# Team Analysis
-- Most Successful Teams
select winner ,count(*) as total_wins
from matches
group by winner
order by total_wins;


-# Batting Analysis
-- # Top 10 Run Scorers

SELECT * FROM ipl_analytics_db.deliveries;

select batsman,
sum(batsman_runs) total_runs
from deliveries
group by batsman
order by total_runs
desc limit 10;

-- Top 10 Six Hitters

select  batsman,
       count(*) as total_sixes
from deliveries
where  batsman_runs = 6
group by  batsman
order by total_sixes desc
limit 10;

-- Top 10 Four Hitters

select  batsman,
       count(*) as total_fours
from deliveries
where  batsman_runs = 4
group by  batsman
order by total_fours desc
limit 10;

-# Bowling Analysis
-- Top 10 Wicket Takers

select bowler,
count(*) as total_wickets
from deliveries
where wicket=1
group by bowler
order by total_wickets
desc limit 10;


-#Match Analysis
-- Highest Team Scores
select winner ,
count(*) as total_wins
from matches
group by winner
order by total_wins
desc limit 10;

-- Venue-wise Match Count
select venue ,
count(matchId) as total_matches
from matches
group by venue
order by total_matches;


-- Season-wise Total Matches
select season,
count(matchId) as total_matches
from matches
group by season
order by total_matches
desc;

SELECT DISTINCT team1
FROM matches

UNION

SELECT DISTINCT team2
FROM matches
ORDER BY 1;








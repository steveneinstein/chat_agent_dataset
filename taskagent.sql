-----------------initials-----------------------------------

SELECT * FROM tskagnt.agentperformance;
use tskagnt
alter table `agentperformance` add column `date1` date after `date`
set sql_safe_updates=0;
update `agentperformance` set  date1 = str_to_date(`date`,"%m/%d/%Y") ## year shud be in caps
select `date` from agentperdormance 

-----------------setup-----------------
SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_SCHEMA = 'tskagnt' AND
     TABLE_NAME   = 'agentperformance' AND 
     COLUMN_NAME  = 'date1'
-------------------------------------------
alter table `agentperformance` drop `date`
ALTER TABLE `agentperformance`
column_name datatype;
------------------------------------------
--convert tiime to seconds--
alter  table `agentperformance` add column `Average Response Time1` varchar(50);

update `agentperformance` set `Average Response Time1`= time_to_sec(`Average Response Time`);

alter  table `agentperformance` add column `Average Resolution Time1` varchar(50);

update `agentperformance` set `Average Resolution Time1`= time_to_sec(`Average Resolution Time`);

-----------------------------task---------------------------------

Q1----avg rating based on week----Q1
select `agent name`,avg(`Average Rating`),`date1`,`Average Response time` from agentperformance where `Average Response time1`!=0  group by `Agent name`,week(`date1`);

Q2----total working days for each agents-----q2

select `Agent name`, count(`Agent name`) from  agentperformance group by `Agent name`

Q3---- total query that you have taken -----Q3

select `Agent Name`,sum(`Total Chats`) from `agentperformance` group by `Agent Name`

Q4------total Feedback that you have received ------Q4

select `Agent Name`,sum(`Total feedback`) from `agentperformance`  group by `Agent Name` ;

Q5------5. a agent name who have average rating between 3.5 to 4 -----Q5

select * from `agentperformance` where (`average rating`>3.5 & `average rating`<4 & `average rating`!=0 ) group by `Agent Name`

Q6----Agent namgroup e who have rating lesss then 3.5 ------q6

select * from `agentperformance` where (`average rating`<3.5 & `average rating`!=0)

q7----- agent name who have rating more then 4.5 ------q7

select * from `agentperformance` where (`average rating`>4.5 & `average rating`!=0)

q8----- how many feedaback agents have received more then 4.5 average ----q8

select `agent name`,sum(`total feedback`) from `agentperformance` where (`average rating`>4.5 & `average rating`!=0) group by `agent name`

q9------- average weekly response time for each agent ------q9

select `date1`,`agent name`, avg(`average response time1`) from`agentperformance` group by `agent name` ,week(`date1`);

q10 ----- average weekely resolution time for each agents -----q10

select `date1`,`agent name`, avg(`average resolution time1`) from`agentperformance` group by `agent name` ,week(`date1`,1);

q11------list of all agents name ------q11

select `agent name` from`agentperformance` group by `agent name`

q12 ----. percentage of chat on which they have received a feedback  -----q12

select `agent name`,((`total feedback`/`total chats`)*100) as `%` from `agentperformance` where  `Average Response time1`!=0  group by `agent name`

q13-----Total contributation hour for each and every agents weekly basis ----q13

select `agent name` ,( (sum(`average response time1`))/(60*60*24)) as days from `agentperformance` where `Average Response time1`!=0  group by `agent name`

q14 -----total percentage of active hour for a month -----q14

select `agent name` ,`date1`, ((((sum(`average response time1`))/(60*60*24))/26)*100) as `percent of month` from `agentperformance` where `Average Response time1`>0  group by `agent name`








/* 1 */
SELECT match_id, player, goal.id AS goal_id
FROM goal
INNER JOIN team 
  ON goal.team_id = team.id 
    WHERE name='Germany';

/* 2 */
SELECT goal.team_id,
       goal.player,  
       game.stadium, 
       game.match_data
FROM goal, game
INNER JOIN team ON team.name = 'Greece'
WHERE goal.match_id = game.id AND 
      goal.team_id = team.id;


INNER JOIN team 
  ON team.id = goal.team_id AND 
     team.name = 'Germany';

/* 3 */
SELECT name
FROM team
INNER JOIN goal 
  ON goal.team_id = team.id 
    WHERE player LIKE 'Mario%';

/* 4 */
SELECT goal.player, 
	   goal.team_id, 
	   goal.match_time, 
	   team.coach
FROM goal, team
WHERE team.id = goal.team_id AND 
	  goal.match_time <= 10;

/* 5 */
SELECT DISTINCT game.match_data, 
			    team.name
FROM game, team
WHERE team.coach = 'Fernando Santos' AND 
      (team.id = game.team1 OR team.id = game.team2);

/* 6 */
SELECT DISTINCT goal.player
FROM goal
INNER JOIN game 
  ON game.id = goal.match_id AND 
     game.stadium = 'National Stadiuml. Warsaw';

/* 7 */ 
SELECT DISTINCT goal.player
FROM goal
INNER JOIN team ON team.id = goal.team_id
INNER JOIN team AS enemy_team ON enemy_team.name = 'Greece'
INNER JOIN game ON (game.team1 = team.id AND game.team2 = enemy_team.id) OR 
                   (game.team2 = team.id AND game.team1 = enemy_team.id);

/* 8 */
SELECT team.name, COUNT(goal.id) AS goals
FROM team, goal
GROUP BY team.id, goal.team_id
WHERE team.id = goal.team_id;

/* 9 */
SELECT game.stadium, COUNT(goal.id) AS goals
FROM game, goal
GROUP BY game.id, goal.match_id
WHERE game.id = goal.match_id;

/* 10 */
SELECT team.name AS team, GROUP_CONCAT(goal.player SEPARATOR ', ') AS players
FROM goal, team
GROUP BY team.name
WHERE team.id = goal.team_id;

/* 11 */
SELECT date, name, SUM(count) AS score 
FROM team 
INNER JOIN 
( SELECT match_date AS date, game.team2 AS contestant_id, IF (((goal.team_id = team.id) AND (team.code = 'GER')), 2, -1) AS count 
  FROM game 
  INNER JOIN team ON game.team1 = team.id AND team.code = 'GER'
  INNER JOIN goal ON game.id = match_id 
  UNION ALL 
  SELECT match_date AS date, game.team1 AS contestant_id, IF (((goal.team_id = team.id) AND (team.code = 'GER')), 2, -1) AS count 
  FROM game 
  INNER JOIN team ON game.team2 = team.id AND team.code = 'GER'
  INNER JOIN goal ON game.id = match_id 
  UNION ALL 
  SELECT match_date AS date, game.team1 AS contestant_id, 0 AS count 
  FROM game 
  INNER JOIN team ON game.team2 = team.id AND team.code = 'GER'
  UNION ALL 
  SELECT match_date AS date, game.team2 AS contestant_id, 0 AS count 
  FROM game 
  INNER JOIN team ON game.team1 = team.id AND team.code = 'GER'
) AS ger ON team.id = contestant_id 
GROUP BY contestant_id 
ORDER BY date;



/* second part */

/* 1 */
SELECT computer.name
FROM computer
INNER JOIN soft ON soft.name LIKE 'Dr.Web%'
INNER JOIN soft_computer ON computer.id = soft_computer.computer_id AND soft.id = soft_computer.soft_id
INNER JOIN manufacter ON manufacter.name = 'Taiwan'
INNER JOIN computer_accessory ON computer.id = computer_accessory.computer_id
INNER JOIN accessory ON accessory.id = computer_accessory.accessory_id;

/* 2 */
SELECT name
FROM accessory
INNER JOIN accessory_availability ON accessory.id = accessory_availability.accessory_id 
                                  AND accessory_availability.count > 3
WHERE accessory.price > 1000
ORDER BY accessory.price DESC;

/* 3 */
SELECT GROUP_CONCAT(manufacter.name SEPARATOR ', ') AS countries
FROM manufacter
INNER JOIN accessory ON manufacter.id = accessory.id AND accessory.type = 'videocard'
INNER JOIN accessory_availability ON count = 1;















-- Insert Leagues
INSERT INTO `League` (league_id, league_name, league_champion_id)
VALUES
(1, 'Fall Fantasy League', 1),
(2, 'Spring Showdown', 4);

-- Insert League Members
INSERT INTO `League Member` (member_id, name, league_id)
VALUES
(1, 'Alice Johnson', 1),
(2, 'Bob Smith', 1),
(3, 'Carla Reeves', 2),
(4, 'David Lee', 2),
(5, 'Ethan Moore', 2);

-- Insert Professional Teams
INSERT INTO `Professional Team` (pro_team_id, team_name, schedule_id)
VALUES
(1, 'New York Hawks', 1),
(2, 'Dallas Mustangs', 2),
(3, 'Chicago Bears', 3),
(4, 'Miami Sharks', 4);

-- Insert Pro Team Schedules
INSERT INTO `Pro Team Schedule` (pro_team_id, week_1_opponent_id, week_2_opponent_id)
VALUES
(1, 2, 3),
(2, 3, 4),
(3, 1, 4),
(4, 1, 2);

-- Insert Football Players
INSERT INTO `Football Player` (player_id, owner_id, name, age, ranking, pro_team_id, position)
VALUES
(1, 1, 'Tom Daniels', 29, 1, 1, 'Quarterback'),
(2, 2, 'Mark Howard', 25, 2, 2, 'Runningback'),
(3, 1, 'Jaylen Banks', 24, 3, 1, 'Receiver'),
(4, 3, 'Nico Gomez', 26, 4, 3, 'Quarterback'),
(5, 4, 'Andre Green', 27, 5, 4, 'Runningback'),
(6, 5, 'Leo Tran', 23, 6, 3, 'Receiver');

-- Insert Quarterback Stats
INSERT INTO `Quarterback` (player_id, yards_thrown)
VALUES
(1, 3200),
(4, 2850);

-- Insert Runningback Stats
INSERT INTO `Runningback` (player_id, yards_run)
VALUES
(2, 870),
(5, 945);

-- Insert Receiver Stats
INSERT INTO `Receiver` (player_id, yards_received)
VALUES
(3, 1100),
(6, 980);

-- Insert Member Schedules
INSERT INTO `Member Schedule` (member_id, week_1_opponent_id, week_2_opponent_id)
VALUES
(1, 2, 3),
(2, 1, 3),
(3, 4, 5),
(4, 3, 5),
(5, 3, 4);

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- League table
CREATE TABLE League (
    league_id INTEGER PRIMARY KEY AUTOINCREMENT,
    league_name TEXT,
    league_champion_id INTEGER
);

-- LeagueMember table
CREATE TABLE LeagueMember (
    member_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    league_id INTEGER NOT NULL,
    FOREIGN KEY (league_id) REFERENCES League(league_id)
);

-- ProfessionalTeam table
CREATE TABLE ProfessionalTeam (
    pro_team_id INTEGER PRIMARY KEY AUTOINCREMENT,
    team_name TEXT NOT NULL,
    schedule_id INTEGER NOT NULL
);

-- ProTeamSchedule table
CREATE TABLE ProTeamSchedule (
    pro_team_id INTEGER PRIMARY KEY,
    week_1_opponent_id INTEGER NOT NULL,
    week_2_opponent_id INTEGER NOT NULL,
    FOREIGN KEY (pro_team_id) REFERENCES ProfessionalTeam(pro_team_id)
);

-- MemberSchedule table
CREATE TABLE MemberSchedule (
    member_id INTEGER PRIMARY KEY,
    week_1_opponent_id INTEGER NOT NULL,
    week_2_opponent_id INTEGER NOT NULL,
    FOREIGN KEY (member_id) REFERENCES LeagueMember(member_id)
);

-- FootballPlayer table
CREATE TABLE FootballPlayer (
    player_id INTEGER PRIMARY KEY AUTOINCREMENT,
    owner_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    ranking INTEGER NOT NULL,
    pro_team_id INTEGER NOT NULL,
    position TEXT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES LeagueMember(member_id),
    FOREIGN KEY (pro_team_id) REFERENCES ProfessionalTeam(pro_team_id)
);

-- Quarterback table
CREATE TABLE Quarterback (
    player_id INTEGER PRIMARY KEY,
    yards_thrown INTEGER NOT NULL,
    FOREIGN KEY (player_id) REFERENCES FootballPlayer(player_id)
);

-- Runningback table
CREATE TABLE Runningback (
    player_id INTEGER PRIMARY KEY,
    yards_run INTEGER NOT NULL,
    FOREIGN KEY (player_id) REFERENCES FootballPlayer(player_id)
);

-- Receiver table
CREATE TABLE Receiver (
    player_id INTEGER PRIMARY KEY,
    yards_received INTEGER NOT NULL,
    FOREIGN KEY (player_id) REFERENCES FootballPlayer(player_id)
);

-- Insert data

INSERT INTO League (league_id, league_name, league_champion_id)
VALUES
(1, 'Fall Fantasy League', 1),
(2, 'Spring Showdown', 4);

INSERT INTO LeagueMember (member_id, name, league_id)
VALUES
(1, 'Alice Johnson', 1),
(2, 'Bob Smith', 1),
(3, 'Carla Reeves', 2),
(4, 'David Lee', 2),
(5, 'Ethan Moore', 2);

INSERT INTO ProfessionalTeam (pro_team_id, team_name, schedule_id)
VALUES
(1, 'New York Hawks', 1),
(2, 'Dallas Mustangs', 2),
(3, 'Chicago Bears', 3),
(4, 'Miami Sharks', 4);

INSERT INTO ProTeamSchedule (pro_team_id, week_1_opponent_id, week_2_opponent_id)
VALUES
(1, 2, 3),
(2, 3, 4),
(3, 1, 4),
(4, 1, 2);

INSERT INTO FootballPlayer (player_id, owner_id, name, age, ranking, pro_team_id, position)
VALUES
(1, 1, 'Tom Daniels', 29, 1, 1, 'Quarterback'),
(2, 2, 'Mark Howard', 25, 2, 2, 'Runningback'),
(3, 1, 'Jaylen Banks', 24, 3, 1, 'Receiver'),
(4, 3, 'Nico Gomez', 26, 4, 3, 'Quarterback'),
(5, 4, 'Andre Green', 27, 5, 4, 'Runningback'),
(6, 5, 'Leo Tran', 23, 6, 3, 'Receiver');

INSERT INTO Quarterback (player_id, yards_thrown)
VALUES
(1, 3200),
(4, 2850);

INSERT INTO Runningback (player_id, yards_run)
VALUES
(2, 870),
(5, 945);

INSERT INTO Receiver (player_id, yards_received)
VALUES
(3, 1100),
(6, 980);

INSERT INTO MemberSchedule (member_id, week_1_opponent_id, week_2_opponent_id)
VALUES
(1, 2, 3),
(2, 1, 3),
(3, 4, 5),
(4, 3, 5),
(5, 3, 4);

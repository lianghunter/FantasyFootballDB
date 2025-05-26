CREATE TABLE `Football Player`(
    `player_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `owner_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `age` SMALLINT NOT NULL,
    `ranking` SMALLINT NOT NULL,
    `pro_team_id` BIGINT NOT NULL,
    `position` ENUM('Quarterback', 'Runningback', 'Receiver') NOT NULL
);
CREATE TABLE `Runningback`(
    `player_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `yards_run` SMALLINT NOT NULL
);
CREATE TABLE `League Member`(
    `member_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `league_id` BIGINT NOT NULL
);
CREATE TABLE `League`(
    `league_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `league_name` VARCHAR(255) NULL,
    `league_champion_id` BIGINT NOT NULL
);
CREATE TABLE `Professional Team`(
    `pro_team_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `team_name` VARCHAR(255) NOT NULL,
    `schedule_id` BIGINT NOT NULL
);
CREATE TABLE `Pro Team Schedule`(
    `pro_team_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `week_1_opponent_id` BIGINT NOT NULL,
    `week_2_opponent_id` BIGINT NOT NULL
);
CREATE TABLE `Quarterback`(
    `player_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `yards_thrown` SMALLINT NOT NULL
);
CREATE TABLE `Receiver`(
    `player_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `yards_received` SMALLINT NOT NULL
);
CREATE TABLE `Member Schedule`(
    `member_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `week_1_opponent_id` BIGINT NOT NULL,
    `week_2_opponent_id` BIGINT NOT NULL
);
ALTER TABLE
    `Football Player` ADD CONSTRAINT `football player_player_id_foreign` FOREIGN KEY(`player_id`) REFERENCES `Receiver`(`player_id`);
ALTER TABLE
    `Member Schedule` ADD CONSTRAINT `member schedule_member_id_foreign` FOREIGN KEY(`member_id`) REFERENCES `League Member`(`member_id`);
ALTER TABLE
    `Football Player` ADD CONSTRAINT `football player_player_id_foreign` FOREIGN KEY(`player_id`) REFERENCES `Runningback`(`player_id`);
ALTER TABLE
    `Football Player` ADD CONSTRAINT `football player_pro_team_id_foreign` FOREIGN KEY(`pro_team_id`) REFERENCES `Professional Team`(`pro_team_id`);
ALTER TABLE
    `Football Player` ADD CONSTRAINT `football player_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `League Member`(`member_id`);
ALTER TABLE
    `Football Player` ADD CONSTRAINT `football player_player_id_foreign` FOREIGN KEY(`player_id`) REFERENCES `Quarterback`(`player_id`);
ALTER TABLE
    `Pro Team Schedule` ADD CONSTRAINT `pro team schedule_pro_team_id_foreign` FOREIGN KEY(`pro_team_id`) REFERENCES `Professional Team`(`pro_team_id`);
ALTER TABLE
    `League Member` ADD CONSTRAINT `league member_league_id_foreign` FOREIGN KEY(`league_id`) REFERENCES `League`(`league_id`);
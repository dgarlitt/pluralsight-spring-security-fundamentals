UPDATE users SET password = "$2a$10$tgt90pj2I6PPD0DA04v7SOrydyP0SxL8JEaN4SH0Bhq77tT/rVlOi"
WHERE username = "jay";

CREATE TABLE permissions(
	username varchar(50) NOT NULL,
	target varchar(50) NOT NULL,
	permission varchar(50) NOT NULL,
	constraint fk_permissions_users
	foreign key(username) references users(username));

CREATE UNIQUE index ix_perm_username on permissions(username, target, permission);

INSERT INTO permissions(username, target, permission)
	VALUES('jay', 'com.pluralsight.model.Goal', 'createGoal');
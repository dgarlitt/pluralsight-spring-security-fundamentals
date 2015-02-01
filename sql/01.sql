CREATE TABLE users(
	username varchar(50) NOT NULL primary key,
	password varchar(50) NOT NULL,
	enabled boolean NOT NULL);

CREATE TABLE authorities(
	username varchar(50) NOT NULL,
	authority varchar(50) NOT NULL,
	constraint fk_authorities_users
		foreign key(username) references users(username));

CREATE UNIQUE INDEX ix_auth_username ON
	authorities(username, authority);

INSERT INTO users(username, password, enabled)
	VALUES("daniel", "secret", true);

SELECT * FROM users;

INSERT INTO authorities(username, authority)
	VALUES("daniel", "ROLE_USER");

SELECT * FROM authorities;

SELECT * FROM users;

INSERT INTO users(username, password, enabled)
	VALUES("jay", "secret", true);

INSERT INTO authorities(username, authority)
	VALUES("jay", "ROLE_ADMIN");
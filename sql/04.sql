INSERT INTO users(username, password, enabled)
	VALUES("idiot", "$2a$10$tgt90pj2I6PPD0DA04v7SOrydyP0SxL8JEaN4SH0Bhq77tT/rVlOi", true);

INSERT INTO authorities(username, authority)
	VALUES("idiot", "ROLE_BAD");
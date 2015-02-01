UPDATE users set password = "5ebe2294ecd0e0f08eab7690d2a6ee69"
WHERE username = "daniel";

select * from users;

ALTER TABLE users MODIFY password varchar(60);

UPDATE users SET password = "$2a$10$tgt90pj2I6PPD0DA04v7SOrydyP0SxL8JEaN4SH0Bhq77tT/rVlOi"
WHERE username = "daniel";

select * from users;
# SQL - Week 3 Assignment
# Keino Chichester
# January 21, 2017

CREATE TABLE users
(
user_id int, 
user_name varchar (30) not null,
primary key (user_id)
);

INSERT INTO users ( user_id, user_name ) VALUES ( 1, 'Modesto'); 
INSERT INTO users ( user_id, user_name ) VALUES ( 2, 'Ayine'); 
INSERT INTO users ( user_id, user_name ) VALUES ( 3, 'Christopher'); 
INSERT INTO users ( user_id, user_name ) VALUES ( 4, 'Cheng Woo'); 
INSERT INTO users ( user_id, user_name ) VALUES ( 5, 'Saulat'); 
INSERT INTO users ( user_id, user_name ) VALUES ( 6, 'Heidy');

select * from users

CREATE TABLE groups 
( 
group_id int primary key, 
group_name varchar (30) NOT NULL, 
user_id int NULL REFERENCES users
);

INSERT INTO groups ( group_id, group_name, user_id ) VALUES ( 1, 'IT', 1); 
INSERT INTO groups ( group_id, group_name, user_id ) VALUES ( 2, 'IT', 2); 
INSERT INTO groups ( group_id, group_name, user_id ) VALUES ( 3, 'Sales', 3); 
INSERT INTO groups ( group_id, group_name, user_id ) VALUES ( 4, 'Sales', 4); 
INSERT INTO groups ( group_id, group_name, user_id ) VALUES ( 5, 'Administration', 5); 
INSERT INTO groups ( group_id, group_name, user_id ) VALUES ( 6, 'Operations', NULL);

select * from groups

CREATE TABLE rooms 
( 
room_id int PRIMARY KEY, 
room_name varchar (30) NOT NULL, 
group_id int NULL REFERENCES groups 
);

INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 1, '101', 1); 
INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 2, '102', 2); 
INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 3, '102', 3); 
INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 4, 'Auditorium A', 4); 
INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 5, 'Auditorium B', NULL);

select * from rooms

# Question 1:
SELECT b.group_id, b.group_name, a.user_id, a.user_name FROM users a RIGHT JOIN groups b ON a.user_id = b.user_id;

# Question 2:
SELECT b.room_id, b.room_name, a.group_id, a.group_name FROM groups a RIGHT JOIN rooms b ON a.group_id = b.group_id;

# Question 3:
SELECT a.user_id, a.user_name as employee_name, b.group_name, c.room_name 
FROM users a 
LEFT JOIN groups b 
ON a.user_id = b.user_id 
LEFT JOIN rooms c 
ON b.group_id = c.group_id 
ORDER BY a.user_name, b.group_name, c.room_name;


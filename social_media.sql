create database social_media;
use social_media;
create table User (
    user_id bigint PRIMARY KEY auto_increment,
    full_name varchar(100),
    email varchar(100), 
    avatar_url text,
    status bit,
    date_of_birth date,
    created_at datetime,
    updated_at datetime,
    phone_number varchar(11),
    roll bit
);

create table Post (
    post_id bigint PRIMARY KEY auto_increment,
    user_id bigint,
    foreign key (user_id) references User(user_id),
    topic varchar(100),
    content text,
    post_time datetime,
    tag_contact bigint,
    access bit DEFAULT 1 ,
    status bit 
);

create table Post_topic(
	post_id bigint,
	foreign key (post_id) references Post(user_id),
	topic ENUM('PET', 'TRAVEL', 'MOVIE', 'GAME', 'MUSIC','FASHION')
);

CREATE TABLE Like_Post (
    like_id bigint PRIMARY KEY auto_increment,
    post_id bigint,
    foreign key (post_id) references Post(post_id),
    user_id bigint ,
    foreign key (user_id) REFERENCES User(user_id),
    liked_at datetime
);

CREATE TABLE Comment (
    comment_id bigint PRIMARY KEY auto_increment,
    post_id bigint ,
    foreign key (post_id) references Post(post_id),
    user_id bigint ,
	foreign key (user_id) references User(user_id),
    content varchar(255),
    comment_time datetime,
    liked bit DEFAULT 0
);
CREATE TABLE Like_Comment (
    like_id bigint PRIMARY KEY auto_increment,
    comment_id bigint,
    foreign key (comment_id ) references Comment(comment_id),
    user_id bigint,
     foreign key (user_id) references User(user_id),
    liked_at datetime
);

CREATE TABLE Share_Post (
    share_id bigint PRIMARY KEY auto_increment,
    post_id bigint,
    foreign key (post_id) references Post(post_id),
    user_id bigint,
     foreign key (user_id) references User(user_id),
    share_time datetime
);

create table file_url (
post_id bigint ,
foreign key (post_id) references post(post_id),
post_url text 
);

-- CREATE TABLE Share_Comment (
--     share_id bigint PRIMARY KEY,
--     comment_id bigint,
--     foreign key (comment_id) references Comment(comment_id),
--     user_id bigint REFERENCES User(user_id),
--     share_time datetime
-- );


CREATE TABLE User_relationship (
    user_id bigint,
    foreign key (user_id) references User(user_id),
    follower_id bigint,
	foreign key (follower_id) references User(user_id),
    block_status bit
);

CREATE TABLE Comment_like (
    comment_id bigint,
    foreign key (comment_id) references Comment(comment_id),
    id_user bigint REFERENCES User(user_id),
    like_time datetime
);
insert into User(full_name ,email  ,status ,date_of_birth ,created_at ,phone_number ,roll )
values('trần đức châu','a@gmail.com',1,'1999-01-01',now(),'1234567891' ,1)

insert into Post (    post_id bigint PRIMARY KEY auto_increment,
    user_id bigint,
     (user_id) references User(user_id),
     varchar(100),
    text,
     datetime,
     bigint,
     bit  ,
     bit )

DELIMITER //
CREATE PROCEDURE test()
BEGIN
   
END; //
DELIMITER

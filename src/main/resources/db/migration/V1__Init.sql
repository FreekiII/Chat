create sequence hibernate_sequence start 1 increment 1;

create table msg
(
    id             int8         not null,
    text           varchar(256) not null,
    time_published timestamp default localtimestamp,
    usr_id         int8,
    room_id        int8,
    primary key (id)
);

create table room
(
    id         int8        not null,
    name       varchar(30) not null,
    is_private boolean,
    owner_id   int8,
    primary key (id)
);

create table room_user
(
    room_id int8 not null,
    user_id int8 not null,
    primary key (room_id, user_id)
);

create table usr
(
    id         int8        not null,
    is_active  boolean     not null,
    is_blocked boolean     not null,
    password   varchar(30) not null,
    username   varchar(15) not null,
    primary key (id)
);

create table usr_role
(
    usr_id int8 not null,
    roles  varchar(255)
);

alter table if exists msg
    add constraint msg_usr_FK foreign key (usr_id) references usr;

alter table if exists msg
    add constraint msg_room_FK foreign key (room_id) references room on delete cascade;

alter table if exists room
    add constraint room_owner_FK foreign key (owner_id) references usr;

alter table if exists room_user
    add constraint room_user_FK foreign key (user_id) references usr;

alter table if exists room_user
    add constraint user_room_FK foreign key (room_id) references room;

alter table if exists usr_role
    add constraint role_user_FK foreign key (usr_id) references usr;
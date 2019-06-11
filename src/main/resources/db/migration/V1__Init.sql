create sequence hibernate_sequence start 1 increment 1;

create table msg
(
    id             int8          not null,
    text           varchar(2048) not null,
    time_published timestamp default localtimestamp,
    usr_id         int8,

    primary key (id)
);

create table usr
(
    id        int8         not null,
    is_active boolean      not null,
    password  varchar(255) not null,
    username  varchar(255) not null,
    primary key (id)
);

create table usr_role
(
    usr_id int8 not null,
    roles  varchar(255)
);

alter table if exists msg
    add constraint msg_usr_FK foreign key (usr_id) references usr;

alter table if exists usr_role
    add constraint usr_role_usr_FK foreign key (usr_id) references usr;
insert into usr (id, username, password, is_active, is_blocked)
values (42, 'Miza', '123', true, false);

insert into usr_role (usr_id, roles)
values (42, 'USER'),
       (42, 'MODERATOR'),
       (42, 'ADMIN');
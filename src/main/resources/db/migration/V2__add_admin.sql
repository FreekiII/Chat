insert into usr (id, username, password, is_active)
values (42, 'Miza', '123', true);

insert into usr_role (usr_id, roles)
values (42, 'USER'),
       (42, 'ADMIN');
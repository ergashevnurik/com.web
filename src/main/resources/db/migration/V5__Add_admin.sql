insert into usr (id, username, password, active)
    values (3, 'admin', 'admin', true);

insert into user_role (user_id, roles)
    values (3, 'USER'), (3, 'ADMIN');
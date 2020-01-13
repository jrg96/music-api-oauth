create table users(
    username varchar2(50) not null primary key,
    password varchar2(60) not null,
    enabled number(1) not null
);

create table authorities (
    username varchar2(50) not null,
    authority varchar2(50) not null,
    constraint fk_authorities_users foreign key(username) references users(username)
);

INSERT INTO users VALUES ('luis','$2a$10$O4zV8CJ.E6KyrwuRocn4ceIoYRB/AjwCA6BbGs98a3WW3GUiKXkZy',1); --luis123
INSERT INTO authorities VALUES ('luis','ADMINISTRADOR'); --autoridad
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

---------------------------------------------------------------------------------------

CREATE TABLE OAUTH_CLIENT_DETAILS (
  CLIENT_ID VARCHAR2(255),
  RESOURCE_IDS VARCHAR2(255),
  CLIENT_SECRET VARCHAR2(255),
  SCOPE VARCHAR2(255),
  AUTHORIZED_GRANT_TYPES VARCHAR2(255),
  WEB_SERVER_REDIRECT_URI VARCHAR2(255),
  AUTHORITIES VARCHAR2(255),
  ACCESS_TOKEN_VALIDITY NUMBER,
  REFRESH_TOKEN_VALIDITY NUMBER,
  ADDITIONAL_INFORMATION VARCHAR2(4000),
  AUTOAPPROVE VARCHAR2(255)
);

ALTER TABLE OAUTH_CLIENT_DETAILS ADD (
  CONSTRAINT client_id_pk PRIMARY KEY (CLIENT_ID));
  
-- secret: luis123
INSERT INTO 
OAUTH_CLIENT_DETAILS(CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY)
VALUES ('spring-security-oauth2-read-client', 'resource-server-rest-api',
 '$2a$10$O4zV8CJ.E6KyrwuRocn4ceIoYRB/AjwCA6BbGs98a3WW3GUiKXkZy',
 'read', 'password,authorization_code,refresh_token,implicit', 'USER', 10800, 2592000);

 
 -- secret: luis123
INSERT INTO OAUTH_CLIENT_DETAILS
(CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY)
VALUES ('spring-security-oauth2-read-write-client', 'resource-server-rest-api',
'$2a$10$O4zV8CJ.E6KyrwuRocn4ceIoYRB/AjwCA6BbGs98a3WW3GUiKXkZy',
'read,write', 'password,authorization_code,refresh_token,implicit', 'USER', 10800, 2592000); 





CREATE TABLE OAUTH_CLIENT_TOKEN (
  TOKEN_ID VARCHAR2(255),
  TOKEN BLOB,
  AUTHENTICATION_ID VARCHAR2(255),
  USER_NAME VARCHAR2(255),
  CLIENT_ID VARCHAR2(255)
);

ALTER TABLE OAUTH_CLIENT_TOKEN ADD (
  CONSTRAINT authentication_id_pk PRIMARY KEY (AUTHENTICATION_ID));
  
  
 
 CREATE TABLE OAUTH_ACCESS_TOKEN (
  TOKEN_ID VARCHAR2(255),
  TOKEN BLOB,
  AUTHENTICATION_ID VARCHAR(255),
  USER_NAME VARCHAR(255),
  CLIENT_ID VARCHAR(255),
  AUTHENTICATION BLOB,
  REFRESH_TOKEN VARCHAR(255)
); 
  
ALTER TABLE OAUTH_ACCESS_TOKEN ADD (
  CONSTRAINT authentication_id_pk_1 PRIMARY KEY (AUTHENTICATION_ID));
  
  

CREATE TABLE OAUTH_REFRESH_TOKEN (
  TOKEN_ID VARCHAR(255),
  TOKEN BLOB,
  AUTHENTICATION BLOB
);




CREATE TABLE OAUTH_CODE (
  CODE VARCHAR(255),
  AUTHENTICATION BLOB
);



CREATE TABLE OAUTH_APPROVALS (
  USERID VARCHAR2(255),
  CLIENTID VARCHAR2(255),
  SCOPE VARCHAR2(255),
  STATUS VARCHAR2(10),
  EXPIRESAT TIMESTAMP,
  LASTMODIFIEDAT TIMESTAMP
);  
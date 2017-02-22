CREATE DATABASE summary_table_dev;
commit;

CREATE TABLE developers(
ID   INT               NOT NULL AUTO_INCREMENT,
NAME VARCHAR (25)     NOT NULL,
LAST_NAME VARCHAR(50),
dev_company int,
PRIMARY KEY (ID)
);
commit;

CREATE TABLE skills(
ID   INT NOT NULL AUTO_INCREMENT,
skill VARCHAR (100) NOT NULL,
PRIMARY KEY (ID)
);
commit;

CREATE TABLE companies(
ID   INT NOT NULL AUTO_INCREMENT,
company VARCHAR (120) NOT NULL,
PRIMARY KEY (ID)
);
commit;

CREATE TABLE customers(
ID   INT NOT NULL AUTO_INCREMENT,
customer VARCHAR (100) NOT NULL,
PRIMARY KEY (ID)
);
commit;

CREATE TABLE projects(
ID   INT NOT NULL AUTO_INCREMENT,
project VARCHAR (100) NOT NULL,
proj_customers int ,
proj_company int,
foreign key (proj_company) references companies(id),
foreign key (proj_customers) references customers(id),
PRIMARY KEY (ID)
);
commit;

CREATE TABLE dev_skills(
ID   INT NOT NULL AUTO_INCREMENT,
DEVELOPER_ID INT  NOT NULL,
SKILL_ID INT  NOT NULL,
foreign key (DEVELOPER_ID) references DEVELOPERS(id),
foreign key (SKILL_ID) references skills(id),
PRIMARY KEY (ID)
);
commit;

CREATE TABLE dev_project(
ID   INT NOT NULL AUTO_INCREMENT,
DEVELOPER_ID INT  NOT NULL,
PROJECT_ID INT  NOT NULL,
foreign key (DEVELOPER_ID) references developers(id),
foreign key (PROJECT_ID) references projects(id),
PRIMARY KEY (ID)
);
commit;

Alter Table developers add constraint dev_company_FK foreign key (dev_company) references companies(id);
commit;

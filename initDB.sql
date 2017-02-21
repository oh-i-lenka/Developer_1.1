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
DEVELOPER_ID INT REFERENCES developers (ID) NOT NULL,
PRIMARY KEY (ID)
);
commit;

CREATE TABLE companies(
ID   INT NOT NULL AUTO_INCREMENT,
company VARCHAR (120) NOT NULL,
DEVELOPER_ID INT REFERENCES developers (ID) NOT NULL,
PROJECT_ID INT REFERENCES projects (ID) NOT NULL,
PRIMARY KEY (ID)
);
commit;

CREATE TABLE customers(
ID   INT NOT NULL AUTO_INCREMENT,
skill VARCHAR (100) NOT NULL,
DEVELOPER_ID INT REFERENCES companies (ID) NOT NULL,
PRIMARY KEY (ID)
);
commit;

CREATE TABLE projects(
ID   INT NOT NULL AUTO_INCREMENT,
project VARCHAR (100) NOT NULL,
proj_customers int REFERENCES customers (ID),
PRIMARY KEY (ID)
);
commit;

CREATE TABLE dev_skills(
ID   INT NOT NULL AUTO_INCREMENT,
DEVELOPER_ID INT  NOT NULL,
SKILL_ID  NOT NULL,
PRIMARY KEY (ID)
);
commit;

CREATE TABLE dev_project(
ID   INT NOT NULL AUTO_INCREMENT,
DEVELOPER_ID INT  NOT NULL,
PROJECT_ID INT  NOT NULL,
develop_FK foreign key (DEVELOPER_ID) references developers(id)
PRIMARY KEY (ID)
);
commit;

Alter Table developers add constraint dev_company_FK foreign key (dev_company) references companies(id);
commit;

Alter Table dev_project add constraint develop_FK foreign key (DEVELOPER_ID) references developers(id);
commit;

Alter Table dev_project add constraint project_FK foreign key (PROJECT_ID) references projects(id);
commit;

Alter Table dev_skills add constraint developer_FK foreign key (DEVELOPER_ID) references DEVELOPERS(id);
Alter Table dev_skills add constraint skills_FK foreign key (SKILL_ID) references skills(id);
commit;

Alter Table projects add constraint company_FK foreign key (proj_company) references companies(id);
Alter Table projects add constraint customer_FK foreign key (proj_customers) references customers(id);
commit;

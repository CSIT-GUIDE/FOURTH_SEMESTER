create database DBMSCLASS2;
use DBMSCLASS2;

create table pos (
    id int primary key not null auto_increment,
    title nvarchar(200),
    department nvarchar(200),
    jobdesc nvarchar(500),
    stats boolean default false
);

insert into pos(title, department, jobdesc, stats)
values('CEO','management','Controls and manages whole organization',false);
insert into pos(title, department, jobdesc, stats)
values('Department Head','R&D','Manages R&D department',true);
insert into pos(title, department, jobdesc, stats)
values('Manager','IT','Manages certain teams',true);
insert into pos(title, department, jobdesc, stats)
values('Programmer','R&D','coding',false);

create table vacancy (
    id int auto_increment primary key,
    fk_posid int,
    constraint fk_perVac foreign key (fk_posid)
        references pos (id),
    dutiesAndRespo nvarchar(500),
    minqualification nvarchar(200),
    minexperience nvarchar(200),
    minSalary decimal(10 , 2 ),
    maxSalary decimal(10 , 2 )
);

insert into vacancy(fk_posid,dutiesAndRespo, minqualification,minexperience,minSalary,maxSalary)
values('2','Watch all over the department','Master Degree in IT subjects', '5 years experience', 20000,30000);
insert into vacancy(fk_posid,dutiesAndRespo, minqualification,minexperience,minSalary,maxSalary)
values('1','Watch all over the company','PHD in IT subjects', '10 years experience', 200000,300000);
insert into vacancy(fk_posid,dutiesAndRespo, minqualification,minexperience,minSalary,maxSalary)
values('4','Write the backend programs','Bachelor in B.Sc. CSIT', '1 years experience', 20000,50000);
insert into vacancy(fk_posid,dutiesAndRespo, minqualification,minexperience,minSalary,maxSalary)
values('3','Manage the specific department','Master Degree MBA', '6 years experience', 50000,90000);
insert into vacancy(fk_posid,dutiesAndRespo, minqualification,minexperience,minSalary,maxSalary)
values('4','Do programming in java and database','Bachelor in CSIT or Computer Engineering', '2 years experience', 25000,35000);


create table recruiterTeam (
    id int primary key auto_increment,
    fk_vacid int,
    constraint fk_perRecr foreign key (fk_vacid) references vacancy (id),
    empName nvarchar(100) not null,
    empSector nvarchar(100)
);

insert into recruiterTeam(fk_vacid,empname,empSector)
values(1,"Sagar Giri", "Department of HRM");
insert into recruiterTeam(fk_vacid,empname,empSector)
values(3,"Kundan S J B R", "Programming in JAVA and Database Management");
insert into recruiterTeam(fk_vacid,empname,empSector)
values(5,"Kundan S J B R", "Programming in JAVA and Database Management");
insert into recruiterTeam(fk_vacid,empname,empSector)
values(2,"Rudra Pandey", "Company Head");


create table media (
    id int primary key auto_increment,
    category nvarchar(20),
    name nvarchar(100) not null
);
insert into media(category,name)
values ("Radio", "Kantipur FM");
insert into media(category,name)
values ("TV", "Kantipur TV");
insert into media(category,name)
values ("Newspaper", "Kathmandu Post");
insert into media(category,name)
values ("Newspaper", "Himalayan Times");

create table vacancyAnnouncement (
    id int primary key auto_increment,
    fk_vacAnnId int,
    constraint fk_perVacAnn foreign key (fk_vacAnnId) references vacancy (id),
    fk_medID int,
    constraint fk_perMedVacAnn foreign key (fk_medID) references media (id),
    announcedDate date,
    deadline date
);
insert into vacancyAnnouncement(fk_vacAnnId,fk_medID,announcedDate,deadline)
values (1,1,2014-09-01,2014-09-15);
insert into vacancyAnnouncement(fk_vacAnnId,fk_medID,announcedDate,deadline)
values (1,2,2014-09-01,2014-09-15);
insert into vacancyAnnouncement(fk_vacAnnId,fk_medID,announcedDate,deadline)
values (1,4,2014-09-01,2014-09-15);
insert into vacancyAnnouncement(fk_vacAnnId,fk_medID,announcedDate,deadline)
values (2,1,2014-09-01,2014-09-10);
insert into vacancyAnnouncement(fk_vacAnnId,fk_medID,announcedDate,deadline)
values (4,2,2014-08-01,2014-09-15);
insert into vacancyAnnouncement(fk_vacAnnId,fk_medID,announcedDate,deadline)
values (4,3,2014-09-01,2014-09-05);

update vacancyAnnouncement set announcedDate = '2014-09-01' where id in (1,2,3);
update vacancyAnnouncement set deadline = '2014-09-15' where id in (1,2,3);
update vacancyAnnouncement set announcedDate = '2014-09-01' where id in (4,5,6);
update vacancyAnnouncement set deadline = '2014-09-10' where id in (4,5,6);

create table applicants (
    id int auto_increment primary key,
    fk_VacAppId int,
    constraint fk_perApplicant foreign key (fk_VacAppId) references vacancy (id),
    fullName nvarchar(100) not null,
    addr nvarchar(100) not null,
    contact nvarchar(10) not null
);

insert into applicants (fk_VacAppID,fullName, addr, contact)
values(1,"Sharthak Khanal","Kapan","9849214145");
insert into applicants (fk_VacAppID,fullName, addr, contact)
values(2,"Anish Thakuri","Gokarna","9840XXXXX");
insert into applicants (fk_VacAppID,fullName, addr, contact)
values(3,"Anju Shahi","Bisalnagar","9805XXXXX");
insert into applicants (fk_VacAppID,fullName, addr, contact)
values(3,"Sanjeev Mainali","Gaushala","980XXXXXX");
insert into applicants (fk_VacAppID,fullName, addr, contact)
values(4,"Sanjeev Budha","Sifal","9806XXXXX");



create table applicantExperience (
    id int auto_increment primary key,
    fk_AppExp int,
    constraint fk_perAppExp foreign key (fk_AppExp) references applicants (id),
    organization nvarchar(200),
    dutiesResponsibility nvarchar(200),
	yearsWorked int
);

insert into applicantExperience(fk_AppExp, organization, dutiesResponsibility, yearsWorked)
values(1,"Verisk","Watched over Programmers Department",5);
insert into applicantExperience(fk_AppExp, organization, dutiesResponsibility, yearsWorked)
values(2,"Verisk","Companys CEO",20);
insert into applicantExperience(fk_AppExp, organization, dutiesResponsibility, yearsWorked)
values(3,"D2Hawk Eye","Java Programmer",3);
insert into applicantExperience(fk_AppExp, organization, dutiesResponsibility, yearsWorked)
values(4,"Brain Digit","Manager at Accounts Department",4);
insert into applicantExperience(fk_AppExp, organization, dutiesResponsibility, yearsWorked)
values(5,"Verisk","Ruby Expert",4);

create table applicantEducation (
    id int auto_increment primary key,
	fk_AppEdu int,
	constraint fk_perApplicantEdu foreign key(fk_AppEdu) references applicants(id),
    lvl nvarchar(20),
    institute nvarchar(100)
);
insert into applicantEducation(fk_AppEdu, lvl, institute)
values (1,"Masters in BA","KU");
insert into applicantEducation(fk_AppEdu, lvl, institute)
values (2,"PHD in Economics","KU");
insert into applicantEducation(fk_AppEdu, lvl, institute)
values (3,"BSC CSIT","DWIT");
insert into applicantEducation(fk_AppEdu, lvl, institute)
values (4,"MBA","PU");
insert into applicantEducation(fk_AppEdu, lvl, institute)
values (5,"BSC CSIT","Ascol TU");

create table shortList(
	id int primary key auto_increment,
	fk_vaccID int,
	constraint fk_perVacList foreign key(fk_vaccID) references vacancy(id),
	fk_appID int,
	constraint fk_perAppList foreign key(fk_appID) references applicants(id),
	remarks varchar(500)
	);

insert into shortList(fk_vaccID, fk_appID, remarks)
values(2,1,"nice qualification");
insert into shortList(fk_vaccID, fk_appID, remarks)
values(4,3,"qualititative programmer, able to do works under pressure");
insert into shortList(fk_vaccID, fk_appID, remarks)
values(4,5,"max experience");

create table score(
	id int primary key auto_increment,
	fk_appID int,
	constraint fk_perShortScore foreign key(fk_appID) references shortList(fk_appID),
	score int not null,
	interviewer_name varchar(250)
	);

insert into score(fk_appID,score,interviewer_name)
values(1,85,"Sagar Kumar");
insert into score(fk_appID,score,interviewer_name)
values(3,75,"KUNDAN SUMSHER");
insert into score(fk_appID,score,interviewer_name)
values(5,90,"Anil Lama");


-- SQL Queries and outputs


-- select pos.id, pos.title, vacancy.minexperience,count(*) from vacancy inner join pos on vacancy.fk_posid = pos.id group by pos.id,vacancy.fk_posid;
-- +----+-----------------+---------------------+----------+
-- | id | title           | minexperience       | count(*) |0
-- +----+-----------------+---------------------+----------+
-- |  1 | CEO             | 	10 years experience |        1 |
-- |  2 | Department Head | 5 years experience  |        1 |
-- |  3 | Manager         | 6 years experience  |        1 |
-- |  4 | Programmer      | 1 years experience  |        2 |
-- +----+-----------------+---------------------+----------+
--


-- select (select fullName from applicants where id = fk_appID) as name,MAX(score) from score;
-- +-----------------+------------+
-- | name            | MAX(score) |
-- +-----------------+------------+
-- | Sharthak Khanal |         90 |
-- +-----------------+------------+


-- mysql> select applicants.fullName, max(score.score) from applicants join score on applicants.id = score.fk_appID;
-- +-----------------+------------------+
-- | fullName        | max(score.score) |
-- +-----------------+------------------+
-- | Sharthak Khanal |               90 |
-- +-----------------+------------------+

-- mysql> select applicants.id, applicants.fullName, shortList.remarks from applicants join shortList on applicants.id = shortList.fk_appID;
-- +----+-----------------+-----------------------------------------------------------+
-- | id | fullName        | remarks                                                   |
-- +----+-----------------+-----------------------------------------------------------+
-- |  1 | Sharthak Khanal | nice qualification                                        |
-- |  3 | Anju Shahi      | qualititative programmer, able to do works under pressure |
-- |  5 | Sanjeev Budha   | max experience                                            |
-- +----+-----------------+-----------------------------------------------------------+

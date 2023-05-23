use soulsbuilds;

create user 'insert'@'localhost' identified by 'insert';
	grant insert on * to 'insert';
    
create user 'select'@'localhost' identified by 'select';
	grant select on * to 'select';
    
create table boss_status (
fk_boss int,
effect_status varchar(45),
fk_status int,
	constraint fk_status foreign key (fk_status) references status (fk_status)
);

insert into boss_status values 
	(1, 7, 3, 1);


select 
bosses.name,
status.id_status,
status.status
	from bosses join boss_status
	on fkBoss = id_boss
    join soulsbuilds.status
		on id_status = fk_status;
	
create table usuario (
id_user int primary key auto_increment,
nome varchar(45),
email varchar(80),
password varchar(45),
ds_experience int
);

create table build (
id_build int primary key auto_increment,
name varchar(45),
perks varchar(45),
level int,
fk_user int,
	constraint fk_user foreign key(fk_user) references usuario (id_user)
);

create table dificuldade (
fk_boss int,
fk_build int,
fk_user int,
dificuldade int,
	foreign key (fk_boss) references bosses (id_boss),
	foreign key (fk_build) references build (id_build),
	foreign key (fk_user) references usuario (id_user)
);

create table status(
id_status int primary key auto_increment,
status varchar(45)
);

create table perks(
id_perks int primary key auto_increment,
vigor int,
attunement int,
endurance int,
vitality int,
strength int,
dexterity int,
intelligence int,
faith int,
luck int
);

create table bosses(
id_boss int primary key auto_increment,
name varchar(45),
health_points int,
souls int
);
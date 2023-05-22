use soulsbuilds;

create user 'insert'@'localhost' identified by 'nsert';
	grant insert on * to 'insert';
create user 'sekect'@'kicakgist' identified by 'select';
	grant select on * to 'select';
    
create table boss_status (
fkBoss int,
fkimmunity int,
fkresistance int,
fkweakness int,
	foreign key (fkimmunity) references Status (id_status),
	foreign key (fkresistance) references Status (id_status),
	foreign key (fkweakness) references Status (id_status)	
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
		on id_status in (fkresistance, fkweakness, fkimmunity);
			
	
create table usuario (
id_user int primary key,
nome varchar(45),
email varchar(80),
password varchar(45),
ds_experience int
);


create table build (
id_build int primary key auto_increment,
name varchar(45),
perks varchar(45),
level int
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

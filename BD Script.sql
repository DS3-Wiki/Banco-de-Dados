create soulsbuilds;

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
	(1, );

insert into status values
	(1, 'Dark'),
	(2, 'Bleed'),
	(3, 'Fire'),
	(4, 'Frost'),
	(5, 'Poison'),
	(6, 'Toxic'),
	(7, 'Magic'),
	(8, 'Lighning');

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

insert into bosses values
	(null, 'Iudex Gundyr', 1037, 3000),
	(null, 'Vordt of the Boreal Valley', 1328, 3000),
	(null, 'Curse-Rotted Greatwood', 5405, 7000),
	(null, 'Crstal Sage', 2723, 8000),
	(null, 'Abyss Watchers', 1548, 18000),
	(null, 'Deacons of the Deep', 4099, 13000),
	(null, 'High Lord Wolnir', 15041, 22000),
	(null, 'Old Demon King', 5301, 25000),
	(null, 'Pontiff Sulyvahn', 5106, 28000),
	(null, 'Yhorm the Giant', 27822, 36000),
	(null, 'Aldrich, Devourer of Gods', 4727, 50000),
	(null, 'Dancer of the Boreal Valley', 5111, 60000),
	(null, 'Dragonslayer Armour', 4581, 48000),
	(null, 'Oceiros, the Consumed King', 8087, 58000),
	(null, 'Champion Gundyr', 4956, 60000),
	(null, 'Lothric, Younger Prince', 4294, 85000),
	(null, 'Ancient Wyvern', 7873, 70000),
	(null, 'Nameless King', 4577, 80000),
	(null, 'Soul of Cinder', 6557, 100000);
    
    

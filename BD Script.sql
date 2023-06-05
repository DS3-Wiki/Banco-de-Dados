create database soulsbuilds;

use soulsbuilds;

create user 'insert'@'localhost' identified by 'insert';
	grant insert on * to 'insert';
    
create user 'select'@'localhost' identified by 'select';
	grant select on * to 'select';
    
    
select * from itens;

create table boss_status (
fk_boss int,
effect_status varchar(45),
fk_status int,
	constraint fk_status foreign key (fk_status) references all_status (id_status)
);

insert into boss_status values 
	(1,'Resistance', 1),
	(1,'Resistance', 2),
	(1,'Weakness', 3),
	(1,'Weakness', 4),
	(2,'Resistance', 9),
	(2,'Weakness', 3),
	(2,'Weakness', 1),
	(3,'Resistance', 10),
	(3,'Weakness', 3),
	(3,'Weakness', 9),
	(4,'Resistance', 7),
	(4,'Weakness', 6),
	(4,'Weakness', 5),
	(5,'Resistance', 1),
	(5,'Resistance', 2),
	(5,'Weakness', 8),
	(6,'Resistance', 7),
	(6,'Resistance', 1),
	(6,'Resistance', 2),
	(6,'Weakness', 10),
	(7,'Resistance', 1),
	(7,'Resistance', 10),
	(8,'Resistance', 3),
	(8,'Weakness', 1),
	(9,'Resistance', 6),
	(9,'Resistance', 5),
	(9,'Resistance', 2),
	(9,'Weakness', 10),
	(10,'Resistance', 9),
	(10,'Weakness', 8),
	(11,'Resistance', 1),
	(11,'Resistance', 7),
	(11,'Weakness', 8),
	(11,'Weakness', 3),
	(12,'Resistance', 2),
	(12,'Weakness', 1),
	(12,'Weakness', 8),
	(13,'Resistance', 1),
	(13,'Resistance', 8),
	(13,'Weakness', 4),
	(14,'Resistance', 7),
	(14,'Resistance', 2),
	(14,'Weakness', 8),
	(15,'Resistance', 5),
	(15,'Resistance', 6),
	(15,'Resistance', 2),
	(15,'Weakness', 8),
	(16,'Resistance', 1),
	(16,'Weakness', 8),
	(16,'Weakness', 4),
	(17,'Resistance', 6),
	(17,'Resistance', 5),
	(17,'Weakness', 8),
	(18,'Resistance', 7),
	(18,'Weakness', 3),
	(19,'Resistance', 3),
	(19,'Weakness', 8);


insert into all_status values
	(1, 'Dark'),
	(2, 'Bleed'),
	(3, 'Fire'),
	(4, 'Frost'),
	(5, 'Poison'),
	(6, 'Toxic'),
	(7, 'Magic'),
	(8, 'Lighning'),
    (9, 'Slash'),
    (10, 'None');




select 
bosses.name,
boss_status.effect_status,
all_status.status
	from bosses join boss_status
		on id_boss = fk_boss
	join all_status
		on id_status = fk_status;

        


create table usuario (
id_user int primary key auto_increment,
nome varchar(45),
email varchar(80),
password varchar(45)
);

create table build (
id_build int primary key auto_increment,
name varchar(45),
perks varchar(45),
level int,
fk_user int,
	constraint fk_user foreign key(fk_user) references usuario (id_user),
fk_perks int,
	constraint fk_perks foreign key(fk_perks) references perks (id_perks)
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

create table all_status(
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
id_boss int primary key,
name varchar(45),
health_points int,
souls int,
level int,
fk_img int,
	constraint fk_img foreign key (fk_img) references bosses_img (id_img)
);

create table bosses_img(
id_img int primary key,
src varchar(160)
);

drop tables bosses, bosses_img;

insert into bosses_img values
    (1,	'http://darksouls3.wdfiles.com/local--files/boss-image:iudex-gundyr/Iudex_Gundyr.jpg'),
	(2,	'http://darksouls3.wdfiles.com/local--files/boss-image:vordt/Vordt.jpg'),
	(3,	'https://darksouls3.wdfiles.com/local--files/boss-image:curse-rotted-greatwoodv1/Curse-rotted_Greatwoodv1.jpg'),
	(4,	'./Assets/img/chefes/Crystal_sage_boss_29.webp'),
	(5,	'./Assets/img/chefes/abyss.jpg'),
	(6,	'./Assets/img/chefes/053 - 6SQeZqA.jpg'),
	(7,	'./Assets/img/chefes/High_Lord_Wolnir_6.webp'),
	(8,	'https://i.redd.it/54vd7p9q58u71.jpg'),
	(9,	'./Assets/img/chefes/Pontiff_Sulyvahn.webp'),
	(10,'https://darksouls3.wdfiles.com/local--files/boss-image:yhorm1/Yhorm1.jpg'),
	(11,'https://darksouls3.wdfiles.com/local--files/boss-image:aldrichv1/Aldrichv1.jpg'),
	(12,'https://i.scdn.co/image/ab67706c0000da84a4dc42c0c3fb40477e87e9ee'),
	(13,'https://i.ytimg.com/vi/2leoHoiZWQE/maxresdefault.jpg'),
	(14,'./Assets/img/chefes/Oceiros_-_01.webp'),
	(15,'https://darksouls3.wdfiles.com/local--files/boss-image:champion-gundyr/Champion_Gundyr.jpg'),
	(16,'https://darksouls3.wdfiles.com/local--files/boss-image:twin-princesv2/Twin_Princesv2.jpg'),
	(17,'https://darksouls3.wdfiles.com/local--files/boss-image:ancient-wyvern1/Ancient_Wyvern1.jpg'),
	(18,'https://e1.pxfuel.com/desktop-wallpaper/958/722/desktop-wallpaper-steam-workshop-dark-souls-iii-nameless-king.jpg'),
	(19,'https://darksouls3.wdfiles.com/local--files/boss-image:soul-of-cinder-2-2/Soul_of_Cinder_2_2.jpg');
select * from bosses_img;

insert into bosses values
	(1, 'Iudex 	Gundyr', 1037, 3000, 1, 1),
	(2, 'Vordt of the Boreal Valley', 1328, 3000, 15, 2),
	(3, 'Curse-Rotted Greatwood', 5405, 7000, 25, 3),
	(4, 'Crstal Sage', 2723, 8000, 30, 4),
	(5, 'Abyss Watchers', 1548, 18000, 40, 5),
	(6, 'Deacons of the Deep', 4099, 13000, 40, 6),
	(7, 'High Lord Wolnir', 15041, 22000, 50, 7),
	(8, 'Old Demon King', 5301, 25000, 60, 8),
	(9, 'Pontiff Sulyvahn', 5106, 28000, 60, 9),
	(10, 'Yhorm the Giant', 27822, 36000, 60, 10),
	(11, 'Aldrich, Devourer of Gods', 4727, 50000, 60, 11),
	(12, 'Dancer of the Boreal Valley', 5111, 60000, 60, 12),
	(13, 'Dragonslayer Armour', 4581, 48000, 60, 13),
	(14, 'Oceiros, the Consumed King', 8087, 58000, 55, 14),
	(15, 'Champion Gundyr', 4956, 60000, 70, 15),
	(16, 'Lothric, Younger Prince', 4294, 85000, 65, 16),
	(17, 'Ancient Wyvern', 7873, 70000, 65, 17),
	(18, 'Nameless King', 4577, 80000, 70, 18),
	(19, 'Soul of Cinder', 6557, 100000, 70, 19);
    
select * 
	from bosses join bosses_img
		on fk_img = id_img;
    

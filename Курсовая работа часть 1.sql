drop database if exists geo_work;

create database geo_work;

use geo_work;





drop table if exists Bookmark;



drop table if exists Category;



drop table if exists InfrastructureObject;



drop table if exists Photos;



drop table if exists Realty;



drop table if exists TotalRealty;



drop table if exists RealtyMeta;



drop table if exists Region;



drop table if exists Seller;



drop table if exists User;



drop table if exists Visitors;



drop table if exists realty2infrastructure;



create table Bookmark(
    realty_id int not null,
    login varchar(20) not null
);




create table Category (
    category_id int not null primary key,
    name varchar(50) not null
);






create table InfrastructureObject (
    object_id int not null primary key,
    name varchar(50)
);





create table Photos (
    realty_id int not null,
    name      varchar(50),
    photo     longblob
);



create table Realty (
    realty_id int not null primary key,
    category_id int not null,
    seller_id int not null,
    code int not null,
    latitude varchar(10) not null,
    longitude varchar(10) not null,
    description varchar(50),
    address varchar(50) not null,
    price int not null
);




create table TotalRealty(
    count int,
    type int not null primary key
);



create table RealtyMeta(
    meta_id int not null primary key,
    realty_id int not null,
    area float,
    num_of_rooms int,
    level int
);





create table Region(
    name varchar(50) not null,
    code int not null primary key
);




create table Seller(
    name      varchar(50) not null,
    surname   varchar(50) not null,
    phone     varchar(10),
    seller_id int not null primary key
);





create table User(
    login varchar(20) not null primary key
);




create table Visitors(
    realty_id int not null,
    count int
);



create table realty2infrastructure(
    realty_id int not null,
    object_id int not null,
    primary key (realty_id, object_id)
);



alter table Bookmark
    add constraint FK_Bookmark foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;



alter table Bookmark
    add constraint FK_User_Bookmarks foreign key (login)
        references User (login) on delete restrict on update restrict;



alter table Photos
    add constraint FK_realty2photo foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;



alter table Realty
    add constraint FK_realty2category foreign key (category_id)
        references Category (category_id) on delete restrict on update restrict;



alter table Realty
    add constraint FK_realty2region foreign key (code)
        references Region (code) on delete restrict on update restrict;



alter table Realty
    add constraint FK_seller2realty foreign key (seller_id)
        references Seller (seller_id) on delete restrict on update restrict;



alter table RealtyMeta
    add constraint FK_realty2meta foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;



alter table Visitors
    add constraint FK_Просмотры foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;



alter table realty2infrastructure
    add constraint FK_realty2infrastructure foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;



alter table realty2infrastructure
    add constraint FK_realty2infrastructure2 foreign key (object_id)
        references InfrastructureObject (object_id) on delete restrict on update restrict;
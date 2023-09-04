create table guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80) null,
member_since date)

create table room_type(
id int primary key identity(1,1),
description varchar(80),
max_capacity int)


create table reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20))


alter table reservation
add guest_id int,
constraint guest_id1 foreign key(guest_id) references guest(id)

create table room(
id int primary key identity(1,1),
number varchar(10),
_name varchar(40),
_status varchar(10),
smoke bit)


alter table room
add room_type_id int,
constraint Room_Room_type foreign key(room_type_id) references room_type(id)

create table reserved_room(
id int primary key identity(1,1),
number_of_rooms int,
_status varchar(20))

alter table reserved_room
add room_type_id int,
constraint Reserved_room_Room_type1 foreign key(room_type_id) references room_type(id)

alter table reserved_room
add reservation_id int,
constraint Reservation_Reserved_room foreign key(reservation_id) references reservation(id)


create table occupied_room(
id int primary key identity(1,1),
check_in datetime,
check_out datetime)

alter table occupied_room
add room_id int,
constraint Room_Occupied_room foreign key(room_id) references room(id)

alter table occupied_room
add reservation_id int,
constraint Reservation_Occupied_room foreign key(reservation_id) references reservation(id)

create table hosted_at(
id int primary key identity(1,1))

alter table hosted_at
add guest_id int,
constraint Hosted_atGuest foreign key(guest_id) references guest(id)

 hosted_at
add occupied_room_id int,
constraint Hosted_at_Occupied_room foreign key(occupied_room_id) references occupied_room(id)

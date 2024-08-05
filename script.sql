create database business_management;

use business_management;

create table customers(
   id int auto_increment,
   name varchar(50) not null,
   address varchar(100) not null,
   email varchar(100) not null,
   phone varchar(20) not null,
   constraint pk_customer primary key(id),
   constraint un_email unique(email),
   constraint un_phone unique(phone)
);

create table products(
   id int auto_increment,
   name varchar(50) not null,
   description text not null,
   price decimal(10,2) not null,
   stock int not null,
   constraint pk_product primary key(id)
);

create table purchase_orders(
   id int auto_increment,
   date date not null,
   customer_id int not null,
   delivery_address varchar(50) not null,
   constraint pk_order primary key(id),
   constraint fk_customer foreign key(customer_id) references customers(id)
);

create table order_details(
   id int auto_increment,
   order_id int not null,
   product_id int not null,
   quantity int not null,
   price decimal(15,2) not null,
   constraint pk primary key(id),
   constraint fk_order foreign key(order_id) references purchase_orders(id),
   constraint fk_product foreign key(product_id) references products(id)
);


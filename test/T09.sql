
create table part (
    partnumber int primary key,
    description varchar(100),
    price int
);

create table supplier (
    supplier varchar(100),
    suppaddress varchar(100),
    primary key (supplier, suppaddress)
);
create table part_supplier (
    partnumber int,
    supplier varchar(100),
    suppaddress varchar(100),
    primary key (partnumber, supplier, suppaddress),
    foreign key (partnumber) references part(partnumber),
    foreign key (supplier, suppaddress) references supplier(supplier, suppaddress)
);


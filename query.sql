use master;
drop database banco;
create database banco;
use banco;

create table vendas(
	id int identity(1,1)not null, data date, id_l int not null, valor decimal(6,2) not null, primary key (id)
);

create table produtos(
	id int identity(1,1)not null, nome nvarchar(80) not null, preco decimal(6,2) not null, primary key (id)
);

create table prod_vend(
	id int identity(1,1)not null, id_vnd int not null, id_prod int not null, qtd int not null, primary key (id),
);

create table clientes(
	id int identity(1,1)not null, nome varchar(120)not null, primary key (id),
);

go

alter table vendas
add constraint fk_vda_cli
foreign key (id_l) references clientes(id)

alter table prod_vend
add constraint fk_prod_vend_cdpd
foreign key (id_prod) references produtos(id)

alter table prod_vend
add constraint fk_prod_vend_vda
foreign key (id_vda) references vendas(id)

go

INSERT INTO produtos (nome, preco) VALUES ('CPU', 1600.00);
INSERT INTO produtos (nome, preco) VALUES ('Fonte', 400.00);
INSERT INTO produtos (nome, preco) VALUES ('RAM', 600.00);
INSERT INTO clientes (nome) VALUES ('Jojo');
INSERT INTO vendas (data, id_l, valor) VALUES('2020-02-13',4800.00);
INSERT INTO prod_vend (id_prod, id_vnd, qtd) VALUES (1,1,3);
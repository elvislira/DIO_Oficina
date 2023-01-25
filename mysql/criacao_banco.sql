-- MySQL

-- Exclusão da base de dados, caso exista
drop database if exists oficina;

-- Criação do banco de dados
create database oficina;

-- Ativa o banco de dados para uso
use oficina;

-- Criação da tabela cliente
create table cliente (
	idCliente INT auto_increment,
    nome varchar(50) not null,
    cpf char(14) not null,
    endereco varchar(50) not null,
    numero int,
    bairro varchar(30),
    cidade varchar(30),
    uf char(2),
    constraint pk_cliente primary key(idCliente),
    constraint unique_cpf unique(cpf)
);

alter table cliente auto_increment=1;

-- Criação da tabela equipe
create table equipe (
	idEquipe int auto_increment,
    qtdIntegrantes int not null,
    constraint pk_equipe primary key(idEquipe)
);

alter table equipe auto_increment=1;

-- Criação da tabela especialidade
create table especialidade (
	idEspecialidade int auto_increment,
    nome varchar(30) not null,
    constraint pk_especialidade primary key(idEspecialidade)
);

alter table especialidade auto_increment=1;

-- Criação da tabela mecanico
create table mecanico (
	idMecanico int auto_increment,
    idEspecialidade int not null,
    idEquipe int not null,
    nome varchar(50) not null,
    endereco varchar(100),
    constraint pk_mecanico primary key(idMecanico, idEspecialidade, idEquipe),
    constraint fk_mecanico_idEspecialidade foreign key(idEspecialidade) references especialidade,
    constraint fk_mecanico_idEquipe foreign key(idEquipe) references equipe(idEquipe)
);

alter table mecanico auto_increment=1;

-- Criação da tabela veiculo
create table veiculo (
	idVeiculo int auto_increment,
    idCliente int not null,
    idEquipe int not null,
    modelo varchar(30) not null,
    placa char(8) not null,
    constraint pkVeiculo primary key(idVeiculo, idCliente),
    constraint fkVeiculo_idCliente foreign key(idCliente) references cliente(idCliente)
);

alter table veiculo auto_increment=1;

-- Criação da tabela OS
create table os (
	idOS int auto_increment,
    idEquipe int not null,
    dataEmissao date not null,
    dataEntrega date not null,
    valor float not null,
    situacao enum('Em avaliação', 'Em execução', 'Concluída') default 'Em avaliação',
    constraint pk_os primary key(idOS),
    constraint fk_os_idEquipe foreign key(idEquipe) references equipe
);

alter table os auto_increment=1;

-- Criação da tabela peca
create table peca (
	idPeca int auto_increment,
    descricao varchar(45) not null,
    valor float not null,
    constraint pk_peca primary key(idPeca)
);

alter table peca auto_increment=1;

-- Criacao da tabela peca_os
create table peca_os (
	idOS int not null,
    idPeca int not null,
    quantidade int not null,
    constraint pk_peca_os primary key(idOS, idPeca),
    constraint fk_peca_os_idPeca foreign key(idPeca) references peca
);

-- Criação da tabela mao_de_obra
create table mao_de_obra (
	idMaoDeObra int auto_increment,
    valor float not null,
    constraint pk_mao_de_obra primary key(idMaoDeObra)
);

alter table mao_de_obra auto_increment=1;

-- Criação da tabela servico
create table servico (
	idServico int auto_increment,
    idMaoDeObra int not null,
    tipo enum('Conserto', 'Revisão') default 'Revisão',
    constraint pk_servico primary key(idServico, idMaoDeObra),
    constraint fk_servico_idMaoDeObra foreign key(idMaoDeObra) references mao_de_obra
);

alter table servico auto_increment=1;

-- Criação da tabela servico_os
create table servico_os (
	idServico int not null,
    idOS int not null,
    valor float not null,
    constraint pk_servico_os primary key(idServico, idOS),
    constraint fk_servico_os_idOS foreign key(idOS) references os(idOS)
);


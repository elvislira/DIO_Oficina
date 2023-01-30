-- SGBD SQL Server
-- Script para a criação do banco e das tabelas

-- Exclui o banco oficina, caso exista
DROP DATABASE IF EXISTS oficina;

-- Cria o banco oficina
CREATE DATABASE oficina;

-- Abre o banco de dados para uso
USE oficina;

-- Criação da tabela cliente
CREATE TABLE cliente (
	idCliente INT IDENTITY(1,1),
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(14) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    numero INT,
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    uf CHAR(2),
    CONSTRAINT pk_cliente PRIMARY KEY(idCliente),
    CONSTRAINT unique_cpf UNIQUE(cpf)
);

-- Criação da tabela equipe
CREATE TABLE equipe (
	idEquipe INT IDENTITY(1,1),
    nome VARCHAR(10) NOT NULL
    	CHECK(nome IN ('Kirk', 'Spock', 'Uhura', 'Mccoy', 'Scott')),
    CONSTRAINT pk_equipe PRIMARY KEY(idEquipe),
    CONSTRAINT unique_nome UNIQUE(nome)
);

-- Criação da tabela especialidade
CREATE TABLE especialidade (
	idEspecialidade INT IDENTITY(1,1),
    nome VARCHAR(30) NOT NULL,
    CONSTRAINT pk_especialidade PRIMARY KEY(idEspecialidade)
);

-- Criação da tabela mecanico
CREATE TABLE mecanico (
	idMecanico INT IDENTITY(1,1),
    idEspecialidade INT NOT NULL,
    idEquipe INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100),
    CONSTRAINT pk_mecanico PRIMARY KEY(idMecanico, idEspecialidade, idEquipe),
    CONSTRAINT fk_mecanico_idEspecialidade FOREIGN KEY(idEspecialidade) REFERENCES especialidade,
    CONSTRAINT fk_mecanico_idEquipe FOREIGN KEY(idEquipe) REFERENCES equipe(idEquipe)
);

-- Criação da tabela veiculo
CREATE TABLE veiculo (
	idVeiculo INT IDENTITY(1,1),
    idCliente INT NOT NULL,
    idEquipe INT NOT NULL,
    modelo VARCHAR(30) NOT NULL,
    placa CHAR(8) NOT NULL,
    CONSTRAINT pkVeiculo PRIMARY KEY(idVeiculo, idCliente),
    CONSTRAINT fkVeiculo_idCliente FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
);

-- Criação da tabela OS
CREATE TABLE os (
	idOS INT IDENTITY(1,1),
    idEquipe INT NOT NULL,
    dataEmissao DATE NOT NULL,
    dataEntrega DATE NOT NULL,
    valor FLOAT NOT NULL,
    situacao VARCHAR(15) 
    	CHECK(situacao IN ('Em avaliação', 'Em execução', 'Concluída'))
    	DEFAULT 'Em avaliação',
    CONSTRAINT pk_os PRIMARY KEY(idOS),
    CONSTRAINT fk_os_idEquipe FOREIGN KEY(idEquipe) REFERENCES equipe
);

-- Criação da tabela peca
CREATE TABLE peca (
	idPeca INT IDENTITY(1,1),
    descricao VARCHAR(45) NOT NULL,
    valor FLOAT NOT NULL,
    CONSTRAINT pk_peca PRIMARY KEY(idPeca)
);

-- Criacao da tabela peca_os
CREATE TABLE peca_os (
	idOS INT NOT NULL,
    idPeca INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT pk_peca_os PRIMARY KEY(idOS, idPeca),
    CONSTRAINT fk_peca_os_idPeca FOREIGN KEY(idPeca) REFERENCES peca
);

-- Criação da tabela mao_de_obra
CREATE TABLE mao_de_obra (
	idMaoDeObra INT IDENTITY(1,1),
    valor FLOAT NOT NULL,
    CONSTRAINT pk_mao_de_obra PRIMARY KEY(idMaoDeObra)
);

-- Criação da tabela servico
CREATE TABLE servico (
	idServico INT IDENTITY(1,1),
    idMaoDeObra INT NOT NULL,
    tipo VARCHAR(10) 
    	CHECK(tipo IN ('Conserto', 'Revisão'))
    	DEFAULT 'Revisão',
    CONSTRAINT pk_servico PRIMARY KEY(idServico, idMaoDeObra),
    CONSTRAINT fk_servico_idMaoDeObra FOREIGN KEY(idMaoDeObra) REFERENCES mao_de_obra
);

-- Criação da tabela servico_os
CREATE TABLE servico_os (
	idServico INT NOT NULL,
    idOS INT NOT NULL,
    valor FLOAT NOT NULL,
    CONSTRAINT pk_servico_os PRIMARY KEY(idServico, idOS),
    CONSTRAINT fk_servico_os_idOS FOREIGN KEY(idOS) REFERENCES os(idOS)
);


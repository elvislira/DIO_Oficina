-- PostgreSQL

-- Criação da tabela cliente
CREATE TABLE cliente (
	idCliente SERIAL,
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

-- Cria o tipo enum nomear a equipe
CREATE TYPE NOME_EQUIPE AS ENUM('Kirk', 'Spock', 'Uhura', 'Mccoy', 'Scott');

-- Criação da tabela equipe
CREATE TABLE equipe (
	idEquipe SERIAL,
    nome NOME_EQUIPE NOT NULL,
    CONSTRAINT pk_equipe PRIMARY KEY(idEquipe),
    CONSTRAINT unique_nome UNIQUE(nome)
);

-- Criação da tabela especialidade
CREATE TABLE especialidade (
	idEspecialidade SERIAL,
    nome VARCHAR(30) NOT NULL,
    CONSTRAINT pk_especialidade PRIMARY KEY(idEspecialidade)
);

-- Criação da tabela mecanico
CREATE TABLE mecanico (
	idMecanico SERIAL,
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
	idVeiculo SERIAL,
    idCliente INT NOT NULL,
    idEquipe INT NOT NULL,
    modelo VARCHAR(30) NOT NULL,
    placa CHAR(8) NOT NULL,
    CONSTRAINT pkVeiculo PRIMARY KEY(idVeiculo, idCliente),
    CONSTRAINT fkVeiculo_idCliente FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
);

-- Cria o tipo enum situacao_os
CREATE TYPE SITUACAO_OS AS ENUM('Em avaliação', 'Em execução', 'Concluída');

-- Criação da tabela OS
CREATE TABLE os (
	idOS SERIAL,
    idEquipe INT NOT NULL,
    dataEmissao DATE NOT NULL,
    dataEntrega DATE NOT NULL,
    valor FLOAT NOT NULL,
    situacao SITUACAO_OS DEFAULT 'Em avaliação',
    CONSTRAINT pk_os PRIMARY KEY(idOS),
    CONSTRAINT fk_os_idEquipe FOREIGN KEY(idEquipe) REFERENCES equipe
);

-- Criação da tabela peca
CREATE TABLE peca (
	idPeca SERIAL,
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
	idMaoDeObra SERIAL,
    valor FLOAT NOT NULL,
    CONSTRAINT pk_mao_de_obra PRIMARY KEY(idMaoDeObra)
);

-- Cria o tipo enum situacao_os
CREATE TYPE TIPO_SERVICO AS ENUM('Conserto', 'Revisão');

-- Criação da tabela servico
CREATE TABLE servico (
	idServico SERIAL,
    idMaoDeObra INT NOT NULL,
    tipo TIPO_SERVICO DEFAULT 'Revisão',
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


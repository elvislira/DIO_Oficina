-- SGBD SQL Server Queries

-- Ativa o banco de dados para uso
USE oficina;

-- Todos os clientes com seus respectivos automóveis
-- Somente os clientes que tem automóvel
SELECT c.idCliente, c.nome, v.modelo, v.placa FROM cliente c
	INNER JOIN veiculo v ON c.idCliente=v.idCliente;

-- Todos os clientes com seus respectivos automóveis
-- Incluindo os que não tem automóvel
SELECT c.idCliente, c.nome, v.modelo, v.placa FROM cliente c
	LEFT JOIN veiculo v ON c.idCliente=v.idCliente;

-- Lista de equipes com quantidade de integrantes
SELECT e.nome, count(*) FROM equipe e
	INNER JOIN mecanico m ON e.idEquipe=m.idEquipe
    GROUP BY e.nome;

-- Quantidade de mecânicos por especialidade
SELECT e.nome, count(*) AS 'qtdMecanicos' FROM mecanico m
	INNER JOIN especialidade e ON m.idEspecialidade= e.idEspecialidade
    GROUP BY e.nome;

-- Total das OS por cliente
SELECT c.nome, sum(os.valor) AS 'total' FROM os
	INNER JOIN equipe e ON os.idEquipe=e.idEquipe
    INNER JOIN veiculo v ON e.idEquipe=v.idVeiculo
    INNER JOIN cliente c ON v.idCliente=c.idCliente
    GROUP BY c.nome;

-- Total das OS por cliente e ordenado pelo total
SELECT c.nome, sum(os.valor) AS 'total' FROM os
	INNER JOIN equipe e ON os.idEquipe=e.idEquipe
    INNER JOIN veiculo v ON e.idEquipe=v.idVeiculo
    INNER JOIN cliente c ON v.idCliente=c.idCliente
    GROUP BY c.nome
    ORDER BY total;

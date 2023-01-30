-- MySQL Queries

-- Todos os clientes com seus respectivos automóveis
-- Somente os clientes que tem automóvel
select c.idCliente, c.nome, v.modelo, v.placa from cliente c
	inner join veiculo v on c.idCliente=v.idCliente;

-- Todos os clientes com seus respectivos automóveis
-- Incluindo os que não tem automóvel
select c.idCliente, c.nome, v.modelo, v.placa from cliente c
	left join veiculo v on c.idCliente=v.idCliente;

-- Lista de equipes com quantidade de integrantes
select e.nome, count(*) from equipe e
	inner join mecanico m on e.idEquipe=m.idEquipe
    group by e.nome;

-- Quantidade de mecânicos por especialidade
select e.nome, count(*) as 'qtdMecanicos' from mecanico m
	inner join especialidade e on m.idEspecialidade= e.idEspecialidade
    group by e.nome;

-- Total das OS por cliente
select c.nome, sum(os.valor) as 'total' from os
	inner join equipe e on os.idEquipe=e.idEquipe
    inner join veiculo v on e.idEquipe=v.idVeiculo
    inner join cliente c on v.idCliente=c.idCliente
    group by c.nome;

-- Total das OS por cliente e ordenado pelo total
select c.nome, sum(os.valor) as 'total' from os
	inner join equipe e on os.idEquipe=e.idEquipe
    inner join veiculo v on e.idEquipe=v.idVeiculo
    inner join cliente c on v.idCliente=c.idCliente
    group by c.nome
    order by total;

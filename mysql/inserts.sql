-- Ativa o banco de dados para uso
use oficina;

insert into cliente (nome, cpf, endereco, numero, bairro, cidade, uf)
	values	('Thiago Yago Lima', '307.868.635-36', 'Rua Urquiza Leal', 207, 'Salgado Filho', 'Aracaju', 'SE'),
			('Eliane Isabela Rafaela Lopes', '530.903.855-89', 'Travessa Mestre Pedro Geraldo dos Santos',  847, 'Cirurgia', 'Aracaju', 'SE'),
			('Sophia Juliana Brito', '939.980.914-59', 'Rua Pelotas',  642, 'Artur Lundgren II', 'Paulista', 'PE'),
			('Olivia Marli Daiane Alves', '494.608.065-11', 'Rua Nova Esperança', 209, 'Dois de Julho', 'Camaçari', 'BA'),
			('Calebe Giovanni Erick Pereira', '275.145.344-90', 'Rua Pedro José Vieira', 908, 'Barro', 'Recife', 'PE'),
			('Anthony Martin Barros', '298.362.380-77', 'Quadra Quadra 1', 689, 'Incra 8 (Brazlândia)', 'Brasília', 'DF'),
			('Giovanna Priscila Fernandes', '075.486.864-80', 'Vila Guilherme', 622, 'Condor', 'Belém', 'PA'),
			('Sérgio Alexandre Murilo Carvalho', '261.255.384-35', 'Rua Felizardo Leite', 718, 'Centro', 'Patos', 'PB'),
			('Tereza Maya Souza', '557.237.163-79', 'Rua Cosme e Damião', 526, 'Cidade Industrial', 'Teresina', 'PI'),
			('Antonella Tatiane Carolina Nogueira', '634.945.354-93', 'Rua Rodolfo de Araújo Júnior', 930, 'Boa Viagem', 'Recife', 'PE');

insert into equipe (qtdIntegrantes)
	values (2), (3), (3), (2), (2);

insert into especialidade (nome)
	values	('Motor'), ('Elétrica'), ('Lanternagem');

insert into mecanico (idEspecialidade, idEquipe, nome, endereco)
	values	(1, 2, 'Carlos Eduardo', 'Rua Santa Clara, 375 - Primavera-Ji-Paraná/RO'),
			(2, 1, 'Analu Esther', 'Rua 16, 742 - Loteamento Barros-Araguaína-TO'),
            (2, 3, 'Oliver Renato', 'Rua Adolfo Bezerra, 416 - Aldeia dos Camarás-Camaragibe-PE'),
            (3, 2, 'Natália Alícia', 'Rua Epitácio Pessoa, 354 - Centro-Sousa-PB'),
            (2, 4, 'Heloise Emanuelly', 'Rua Londrina, 963 - São Francisco-Teresina-PI'),
            (1, 3, 'Adriana Daniela', '1ª Avenida da Universidade, 403 - Universidade-Macapá-AP'),
            (1, 1, 'Paulo Daniel', 'Rua Clíper, 953 - Colorado-Teresina-PI'),
            (1, 5, 'Emanuelly Luna', 'Rua Major Cícero de Góis Monteiro, 846 - Centro-Palmeira dos Índios-AL'),
            (1, 4, 'Lúcia Daniela', 'Rua Sete, 512 - Vila Embratel-São Luís-MA'),
            (2, 2, 'Giovanni Erick', 'Rua Maria Felipa, 708 - Engenho Velho de Brotas-Salvador-BA'),
            (2, 5, 'Allana Julia', 'Rua Norival Felix de Almeida, 176 - Colina Park I-Ji-Paraná-RO'),
            (3, 3, 'Miguel Marcos', 'Alameda da CPA, 549 - Pedrinhas-Macapá-AP');

insert into veiculo (idCliente, idEquipe, modelo, placa)
	values	(1, 3, 'Pick-Up 4x4', 'MBU-8850'),
			(2, 1, 'Cargo CD 1.0 8V 53cv (Pick-Up)', 'MYI-6096'),
            (3, 5, 'Charade TX 1.3 16V', 'GYA-4835'),
            (4, 2, '300 C 5.7 V8 16V 340cv', 'JFK-0010'),
            (5, 4, 'Rodeo 3.2 V6', 'ILD-7729'),
            (6, 3, 'Stark 2.3 4WD 127cv', 'NAW-3658'),
            (7, 1, 'Javali 3.0 4x4 Diesel', 'MXK-4316'),
            (8, 1, 'Esprit S-4 2.2 16V', 'LWE-7554'),
            (9, 3, 'Cuore 0/TS0 85i', 'NAW-3756'),
            (10, 5, 'Buggy W. 1.6 8V', 'MTF-4097');

insert into os (idEquipe, dataEmissao, dataEntrega, valor, situacao)
	values	(3, '2021-01-15', '2021-02-01', 0.0, default),
            (1, '2021-12-01', '2021-12-10', 0.0, default),
            (5, '2021-10-01', '2021-10-31', 0.0, default),
            (2, '2022-05-13', '2022-05-25', 0.0, default),
            (4, '2022-07-05', '2022-07-20', 0.0, default),
            (3, '2022-03-20', '2022-04-10', 0.0, default),
            (1, '2022-09-02', '2022-09-15', 0.0, default),
            (1, '2023-01-16', '2023-01-30', 0.0, default),
            (3, '2023-01-02', '2023-01-20', 0.0, default),
            (5, '2023-01-05', '2023-01-25', 0.0, default);

insert into peca (descricao, valor)
	values	('Amortecedor dianteiro', 0.0),
			('Farol de milha', 0.0),
            ('Bomba de combustível', 0.0),
            ('Grampo da borracha para-choque', 0.0),
            ('Kit de embreagem', 0.0),
            ('Chupeta de bateria', 0.0),
            ('Rolamento diferencial', 0.0),
            ('Bateria', 0.0),
            ('Cabo da embreagem', 0.0),
            ('Borracha da janela lateral traseira', 0.0);

insert into peca_os (idOS, idPeca, quantidade)
	values	(10, 5, 1),
			(1, 4, 2),
            (5, 8, 2),
            (2, 6, 1),
            (9, 1, 1),
            (7, 2, 2),
            (3, 7, 1),
            (6, 3, 1),
            (4, 10, 2),
            (8, 9, 1);

insert into mao_de_obra (valor)
	values	(0.0),
			(0.0),
            (0.0),
            (0.0),
            (0.0);

insert into servico (idMaoDeObra, tipo)
	values	(4, default),
			(1, default),
            (3, default),
            (5, default),
            (2, default);

insert into servico_os (idServico, idOS, valor)
	values	(1, 9, 0.0),
			(5, 1, 0.0),
            (3, 10, 0.0),
            (1, 6, 0.0),
            (4, 4, 0.0),
            (2, 2, 0.0),
            (3, 5, 0.0),
            (5, 3, 0.0),
            (2, 7, 0.0),
            (1, 8, 0.0);
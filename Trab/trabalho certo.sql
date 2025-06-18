CREATE TABLE Time (
 id_time INT NOT NULL,
 nome VARCHAR(100) NOT NULL,
 categoria VARCHAR(50)
);

ALTER TABLE Time ADD CONSTRAINT PK_Time PRIMARY KEY (id_time);


CREATE TABLE Torcedor (
 id_torcedor INT NOT NULL,
 telefone VARCHAR(20),
 email VARCHAR(100),
 cpf CHAR(11) NOT NULL,
 nome VARCHAR(100),
 data_nascimento DATE,
 id_time INT
);

ALTER TABLE Torcedor ADD CONSTRAINT PK_Torcedor PRIMARY KEY (id_torcedor);


CREATE TABLE Esatdio (
 id_estadio INT NOT NULL,
 nome VARCHAR(100) NOT NULL,
 capacidade INT NOT NULL,
 localizacao VARCHAR(10),
 id_time INT
);

ALTER TABLE Esatdio ADD CONSTRAINT PK_Esatdio PRIMARY KEY (id_estadio);


CREATE TABLE Ingresso (
 id_ingresso INT NOT NULL,
 preco DECIMAL(7,2) NOT NULL,
 data_compra DATE NOT NULL,
 setor VARCHAR(50),
 id_time INT,
 id_torcedor INT
);

ALTER TABLE Ingresso ADD CONSTRAINT PK_Ingresso PRIMARY KEY (id_ingresso);


CREATE TABLE Jogador (
 id_jogador INT NOT NULL,
 nome VARCHAR(100) NOT NULL,
 nacionalide VARCHAR(50) NOT NULL,
 posicao VARCHAR(30) NOT NULL,
 numero_camisa INT NOT NULL,
 altura DECIMAL(4,2),
 peso DECIMAL(5,2),
 id_time INT
);

ALTER TABLE Jogador ADD CONSTRAINT PK_Jogador PRIMARY KEY (id_jogador);


CREATE TABLE partida (
 id_partida INT NOT NULL,
 data DATE NOT NULL,
 placar_casa INT,
 placar_visitante INT,
 publico INT,
 competicao VARCHAR(100),
 id_estadio INT
);

ALTER TABLE partida ADD CONSTRAINT PK_partida PRIMARY KEY (id_partida);


CREATE TABLE Patrocinador (
 id_patrocinador INT NOT NULL,
 nome VARCHAR(100) NOT NULL,
 tipo VARCHAR(50),
 valor_contrato DECIMAL(10,2),
 data_inicio DATE,
 data_fim DATE,
 id_time INT
);

ALTER TABLE Patrocinador ADD CONSTRAINT PK_Patrocinador PRIMARY KEY (id_patrocinador);


CREATE TABLE Tecnico (
 id_treinador INT NOT NULL,
 nome VARCHAR(100) NOT NULL,
 data_nascomento DATE NOT NULL,
 tipo VARCHAR(50) NOT NULL,
 id_time INT
);

ALTER TABLE Tecnico ADD CONSTRAINT PK_Tecnico PRIMARY KEY (id_treinador);


CREATE TABLE Contrato (
  id_contrato INT NOT NULL,
 clausulas VARCHAR(500),
 salario DECIMAL(10,2),
 data_fim DATE NOT NULL,
 data_inicio DATE,
 id_treinador INT,
 id_jogador INT
);

ALTER TABLE Contrato ADD CONSTRAINT PK_Contrato PRIMARY KEY ( id_contrato);


CREATE TABLE Competicao (
 id_titulo INT NOT NULL,
 nome_competicao VARCHAR(100) NOT NULL,
 ano INT NOT NULL,
 id_partida INT,
 id_jogador INT
);

ALTER TABLE Competicao ADD CONSTRAINT PK_Competicao PRIMARY KEY (id_titulo);


CREATE TABLE Funcionario (
 id_funcionario INT NOT NULL,
 nome VARCHAR(100),
 cargo VARCHAR(50) NOT NULL,
 data_admissao DATE NOT NULL,
 salario DECIMAL(10),
 id_time INT,
  id_contrato INT
);

ALTER TABLE Funcionario ADD CONSTRAINT PK_Funcionario PRIMARY KEY (id_funcionario);

ALTER TABLE Torcedor ADD CONSTRAINT FK_Torcedor_0 FOREIGN KEY (id_time) REFERENCES Time (id_time);

ALTER TABLE Esatdio ADD CONSTRAINT FK_Esatdio_0 FOREIGN KEY (id_time) REFERENCES Time (id_time);

ALTER TABLE Ingresso ADD CONSTRAINT FK_Ingresso_0 FOREIGN KEY (id_time) REFERENCES Time (id_time);

ALTER TABLE Ingresso ADD CONSTRAINT FK_Ingresso_1 FOREIGN KEY (id_torcedor) REFERENCES Torcedor (id_torcedor);

ALTER TABLE Jogador ADD CONSTRAINT FK_Jogador_0 FOREIGN KEY (id_time) REFERENCES Time (id_time);

ALTER TABLE partida ADD CONSTRAINT FK_partida_0 FOREIGN KEY (id_estadio) REFERENCES Esatdio (id_estadio);

ALTER TABLE Patrocinador ADD CONSTRAINT FK_Patrocinador_0 FOREIGN KEY (id_time) REFERENCES Time (id_time);

ALTER TABLE Tecnico ADD CONSTRAINT FK_Tecnico_0 FOREIGN KEY (id_time) REFERENCES Time (id_time);

ALTER TABLE Contrato ADD CONSTRAINT FK_Contrato_0 FOREIGN KEY (id_treinador) REFERENCES Tecnico (id_treinador);

ALTER TABLE Contrato ADD CONSTRAINT FK_Contrato_1 FOREIGN KEY (id_jogador) REFERENCES Jogador (id_jogador);

ALTER TABLE Competicao ADD CONSTRAINT FK_Competicao_0 FOREIGN KEY (id_partida) REFERENCES partida (id_partida);

ALTER TABLE Competicao ADD CONSTRAINT FK_Competicao_1 FOREIGN KEY (id_jogador) REFERENCES Jogador (id_jogador);

ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_0 FOREIGN KEY (id_time) REFERENCES Time (id_time);

ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_1 FOREIGN KEY ( id_contrato) REFERENCES Contrato ( id_contrato);

INSERT INTO Time (id_time, nome, categoria) VALUES
(1, 'SC Internacional', 'Profissional'),
(2, 'Grêmio FBPA', 'Profissional'),
(3, 'CR Flamengo', 'Profissional');

INSERT INTO Esatdio (id_estadio, nome, capacidade, localizacao, id_time) VALUES
(1, 'Beira-Rio', 50832, 'RS', 1),
(2, 'Arena do Grêmio', 55662, 'RS', 2),
(3, 'Maracanã', 78838, 'RJ', 3);

INSERT INTO Tecnico (id_treinador, nome, data_nascomento, tipo, id_time) VALUES
(1, 'Eduardo Coudet', '1974-09-12', 'Principal', 1),
(2, 'Renato Portaluppi', '1962-09-09', 'Principal', 2),
(3, 'Tite', '1961-05-25', 'Principal', 3);

INSERT INTO Jogador (id_jogador, nome, nacionalide, posicao, numero_camisa, altura, peso, id_time) VALUES
(1, 'Alan Patrick', 'Brasileira', 'Meio-campo', 10, 1.74, 72.5, 1),
(2, 'Enner Valencia', 'Equatoriana', 'Atacante', 13, 1.77, 75.1, 1),
(3, 'Sergio Rochet', 'Uruguaia', 'Goleiro', 1, 1.90, 84.0, 1),
(4, 'Mathías Villasanti', 'Paraguaia', 'Volante', 20, 1.78, 77.0, 2),
(5, 'Franco Cristaldo', 'Argentina', 'Meio-campo', 10, 1.75, 74.0, 2),
(6, 'Diego Costa', 'Hispano-Brasileira', 'Atacante', 19, 1.88, 85.5, 2);

INSERT INTO Contrato (id_contrato, clausulas, salario, data_fim, data_inicio, id_treinador, id_jogador) VALUES
(1, 'Cláusula de rescisão de 50 milhões de euros.', 350000.00, '2026-12-31', '2023-01-15', NULL, 1),
(2, 'Bônus por 20+ gols na temporada.', 400000.00, '2025-12-31', '2023-07-01', NULL, 2),
(3, 'Cláusula de renovação automática por metas.', 500000.00, '2025-12-31', '2022-11-20', 1, NULL),
(4, 'Participação em lucros de marketing.', 250000.00, '2027-06-30', '2023-02-10', NULL, 4),
(5, 'Cláusula de rescisão de 60 milhões de euros.', 300000.00, '2026-12-31', '2023-01-05', NULL, 5),
(6, 'Bônus por títulos conquistados.', 600000.00, '2025-12-31', '2022-08-01', 2, NULL);

INSERT INTO Torcedor (id_torcedor, telefone, email, cpf, nome, data_nascimento, id_time) VALUES
(101, '51991112222', 'joao.silva@email.com', '11122233344', 'João Silva', '1985-05-20', 1),
(102, '51988887777', 'maria.pereira@email.com', '55566677788', 'Maria Pereira', '1992-11-30', 2),
(103, '51993334444', 'pedro.costa@email.com', '99988877766', 'Pedro Costa', '1988-01-15', 1),
(104, '51987654321', 'ana.oliveira@email.com', '22233344455', 'Ana Oliveira', '2001-07-22', 2);

INSERT INTO Ingresso (id_ingresso, preco, data_compra, setor, id_time, id_torcedor) VALUES
(1001, 150.00, '2024-10-20', 'Setor Sul', 1, 101),
(1002, 160.00, '2024-10-21', 'Cadeira Superior', 2, 102),
(1003, 150.00, '2024-10-22', 'Setor Sul', 1, 103),
(1004, 200.00, '2024-10-23', 'Cadeira Gold', 2, 104);

INSERT INTO partida (id_partida, data, placar_casa, placar_visitante, publico, competicao, id_estadio) VALUES
(51, '2024-10-26', 2, 1, 45000, 'Campeonato Brasileiro', 1),
(52, '2024-11-05', 0, 0, 51000, 'Campeonato Brasileiro', 2),
(53, '2024-11-10', 3, 0, 38000, 'Copa do Brasil', 1);

INSERT INTO Patrocinador (id_patrocinador, nome, tipo, valor_contrato, data_inicio, data_fim, id_time) VALUES
(21, 'Banrisul', 'Master', 15000000.00, '2023-01-01', '2025-12-31', 1),
(22, 'Vero', 'Manga', 5000000.00, '2023-01-01', '2025-12-31', 1),
(23, 'Banrisul', 'Master', 16000000.00, '2023-01-01', '2025-12-31', 2),
(24, 'Esportes da Sorte', 'Costas', 7000000.00, '2024-01-01', '2024-12-31', 2);

INSERT INTO Competicao (id_titulo, nome_competicao, ano, id_partida, id_jogador) VALUES
(301, 'Brasileirão', 2024, 51, 1),
(302, 'Brasileirao', 2024, 52, 3),
(303, 'Copa do Brasil', 2024, 53, 2);

INSERT INTO Funcionario (id_funcionario, nome, cargo, data_admissao, salario, id_time, id_contrato) VALUES
(201, 'Carlos Nunes', 'Fisioterapeuta', '2020-03-10', 8000.00, 1, NULL),
(202, 'Fernanda Lima', 'Nutricionista', '2019-07-01', 9500.00, 2, NULL),
(203, 'Ricardo Souza', 'Analista de Desempenho', '2022-01-20', 11000.00, 1, 3),
(204, 'Juliana Martins', 'Fisioterapeuta', '2021-05-15', 8500.00, 2, NULL);

SELECT
    J.nome AS "Nome do Jogador",
    J.posicao AS "Posição",
    T.nome AS "Time"
FROM
    Jogador J
JOIN
    Time T ON J.id_time = T.id_time;

SELECT * FROM Time WHERE categoria = 'Profissional' ORDER BY nome;

SELECT * FROM Time WHERE nome LIKE '% %' ORDER BY id_time;

SELECT * FROM Jogador WHERE posicao = 'Atacante' ORDER BY nome;

SELECT * FROM Jogador WHERE altura > 1.80 ORDER BY altura DESC;

SELECT * FROM Torcedor WHERE id_time = 1 ORDER BY nome;

SELECT * FROM Torcedor WHERE data_nascimento < '1990-01-01' ORDER BY data_nascimento;

SELECT * FROM Esatdio WHERE localizacao = 'RS' ORDER BY nome;

SELECT * FROM Esatdio WHERE capacidade > 55000 ORDER BY capacidade DESC;

SELECT * FROM Ingresso WHERE setor = 'Setor Sul' ORDER BY data_compra;

SELECT * FROM Ingresso WHERE preco > 150.00 ORDER BY preco DESC;

SELECT * FROM partida WHERE competicao = 'brasileirão' ORDER BY data;

SELECT * FROM partida WHERE publico > 40000 ORDER BY publico DESC;

SELECT * FROM Patrocinador WHERE tipo = 'Master' ORDER BY valor_contrato DESC;

SELECT * FROM Patrocinador WHERE valor_contrato > 10000000.00 ORDER BY valor_contrato;

SELECT * FROM Tecnico WHERE tipo = 'Principal' ORDER BY nome;

SELECT * FROM Tecnico WHERE data_nascomento < '1970-01-01' ORDER BY data_nascomento;

SELECT * FROM Contrato WHERE id_treinador IS NULL ORDER BY salario DESC;

SELECT * FROM Contrato WHERE salario > 380000.00 ORDER BY salario DESC;

SELECT * FROM Competicao WHERE ano = 2024 ORDER BY id_partida;

SELECT * FROM Competicao WHERE nome_competicao <> 'Copa do Brasil' ORDER BY nome_competicao;

SELECT * FROM Funcionario WHERE cargo = 'Fisioterapeuta' ORDER BY nome;

SELECT * FROM Funcionario WHERE salario > 9000.00 ORDER BY salario DESC;


SELECT
    J.nome,
    C.salario
FROM
    Jogador J
JOIN
    Contrato C ON J.id_jogador = C.id_jogador
WHERE
    C.salario > (SELECT AVG(salario) FROM Contrato WHERE id_jogador IS NOT NULL);

SELECT nome, 'Jogador' AS Funcao FROM Jogador
UNION
SELECT nome, 'Técnico' AS Funcao FROM Tecnico
ORDER BY nome;
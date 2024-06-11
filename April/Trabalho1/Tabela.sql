-- Criação da tabela Carro
CREATE TABLE Carro (
    CarroID INT NOT NULL,
    Placa INT,
    Marca CHAR(10),
    Modelo CHAR(10),
    Ano INT,
    Nome_Motorista CHAR(10),
    CONSTRAINT PK_Carro PRIMARY KEY (CarroID)
);

-- Criação da tabela Meio_Pagamento
CREATE TABLE Meio_Pagamento (
    PagamentoID INT NOT NULL,
    Descricao CHAR(10),
    CONSTRAINT PK_Meio_Pagamento PRIMARY KEY (PagamentoID)
);

-- Criação da tabela Seguro
CREATE TABLE Seguro (
    SeguroID INT NOT NULL,
    Preco INT,
    Nome_Seguro CHAR(10),
    Beneficios CHAR(10),
    CONSTRAINT PK_Seguro PRIMARY KEY (SeguroID)
);

-- Criação da tabela Passageiros
CREATE TABLE Passageiros (
    PassageiroID INT NOT NULL,
    PagamentoID INT NOT NULL,
    SeguroID INT NOT NULL,
    CPF INT,
    Nome CHAR(50),
    Email CHAR(50),
    Telefone INT,
    Bairro_Partida CHAR(50), -- Adiciona a coluna Bairro_Partida
    CONSTRAINT PK_Passageiros PRIMARY KEY (PassageiroID),
    CONSTRAINT FK_Passageiros_0 FOREIGN KEY (PagamentoID) REFERENCES Meio_Pagamento (PagamentoID),
    CONSTRAINT FK_Passageiros_1 FOREIGN KEY (SeguroID) REFERENCES Seguro (SeguroID)
);

-- Criação da tabela Viagem
CREATE TABLE Viagem (
    ViagemID INT NOT NULL,
    CarroID INT NOT NULL,
    PassageiroID INT NOT NULL,
    PagamentoID INT NOT NULL,
    SeguroID INT NOT NULL,
    Kms INT,
    Valor INT,
    Bairro_Partida CHAR(50),
    Endereco_Completo_Partida CHAR(100),
    Taxa_Adicional INT,
    Bairro_Chegada CHAR(50),
    Endereco_Completo_Chegada CHAR(100),
    CONSTRAINT PK_Viagem PRIMARY KEY (ViagemID),
    CONSTRAINT FK_Viagem_0 FOREIGN KEY (CarroID) REFERENCES Carro (CarroID),
    CONSTRAINT FK_Viagem_1 FOREIGN KEY (PassageiroID) REFERENCES Passageiros (PassageiroID),
    CONSTRAINT FK_Viagem_2 FOREIGN KEY (PagamentoID) REFERENCES Meio_Pagamento (PagamentoID),
    CONSTRAINT FK_Viagem_3 FOREIGN KEY (SeguroID) REFERENCES Seguro (SeguroID)
);

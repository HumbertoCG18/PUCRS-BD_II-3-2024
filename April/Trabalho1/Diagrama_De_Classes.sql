CREATE TABLE Carro (
 Codigo INT NOT NULL,
 Placa INT,
 Marca CHAR(10),
 Modelo CHAR(10),
 Ano INT,
 Nome_Motorista CHAR(10)
);

ALTER TABLE Carro ADD CONSTRAINT PK_Carro PRIMARY KEY (Codigo);


CREATE TABLE Meio_Pagamento (
 PagamentoID INT NOT NULL,
 Descricao CHAR(10)
);

ALTER TABLE Meio_Pagamento ADD CONSTRAINT PK_Meio_Pagamento PRIMARY KEY (PagamentoID);


CREATE TABLE Seguro (
 SeguroID INT NOT NULL,
 Preco INT,
 Nome_Seguro CHAR(10),
 Beneficios CHAR(10)
);

ALTER TABLE Seguro ADD CONSTRAINT PK_Seguro PRIMARY KEY (SeguroID);


CREATE TABLE Passageiros (
 PassageiroID INT NOT NULL,
 PagamentoID INT NOT NULL,
 SeguroID INT NOT NULL,
 CPF INT,
 Nome INT,
 Email INT,
 Telefone INT
);

ALTER TABLE Passageiros ADD CONSTRAINT PK_Passageiros PRIMARY KEY (PassageiroID,PagamentoID,SeguroID);


CREATE TABLE Viagem (
 Id INT NOT NULL,
 Codigo INT NOT NULL,
 PassageiroID INT NOT NULL,
 PagamentoID INT NOT NULL,
 SeguroID INT NOT NULL,
 Kms INT,
 Valor INT,
 Bairro_Partida CHAR(10),
 Taxa_Adicional INT,
 Cidade_Destino CHAR(10),
 Endereco_Completo CHAR(10)
);

ALTER TABLE Viagem ADD CONSTRAINT PK_Viagem PRIMARY KEY (Id,Codigo,PassageiroID,PagamentoID,SeguroID);


ALTER TABLE Passageiros ADD CONSTRAINT FK_Passageiros_0 FOREIGN KEY (PagamentoID) REFERENCES Meio_Pagamento (PagamentoID);
ALTER TABLE Passageiros ADD CONSTRAINT FK_Passageiros_1 FOREIGN KEY (SeguroID) REFERENCES Seguro (SeguroID);


ALTER TABLE Viagem ADD CONSTRAINT FK_Viagem_0 FOREIGN KEY (Codigo) REFERENCES Carro (Codigo);
ALTER TABLE Viagem ADD CONSTRAINT FK_Viagem_1 FOREIGN KEY (PassageiroID,PagamentoID,SeguroID) REFERENCES Passageiros (PassageiroID,PagamentoID,SeguroID);



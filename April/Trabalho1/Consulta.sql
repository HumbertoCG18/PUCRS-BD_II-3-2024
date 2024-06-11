-- Consultas SQL
-- a) Listar os Códigos dos Carros que realizaram corridas que partiram do bairro 'Floresta'
SELECT DISTINCT CarroID
FROM Viagem
WHERE Bairro_Partida = 'Floresta';

SELECT p.Nome, v.CarroID
FROM Viagem v
JOIN Passageiros p ON v.PassageiroID = p.PassageiroID
WHERE v.Bairro_Partida = p.Bairro_Partida;


SELECT p.CPF, p.Nome, SUM(v.Kms) AS TotalKms
FROM Viagem v
JOIN Passageiros p ON v.PassageiroID = p.PassageiroID
GROUP BY p.CPF, p.Nome;



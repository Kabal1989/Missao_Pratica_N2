use Loja;

insert into usuários
values (1, 'op1', 'op2'),
(2, 'op2', 'op2')

select * from usuários

update usuários
set Senha = 'op1'
where UsuarioID = 1

insert into Produtos
values (1, 'Banana', '100', '5.00'),
(2, 'Laranja', '500', '2.00'),
(3, 'Manga', '800', '4.00')


select * from Produtos

select * from Pessoas

DECLARE @PessoaID INT;
SET @PessoaID = NEXT VALUE FOR PessoaSequence;

INSERT INTO Pessoas (PessoaID, Nome, Tipo, Endereco, Telefone)
VALUES (@PessoaID, 'João da Silva', 'F', 'Rua A, 123', '1234-5678');

DECLARE @PessoaID INT;
SET @PessoaID = NEXT VALUE FOR PessoaSequence;

INSERT INTO Pessoas (PessoaID, Nome, Tipo, Endereco, Telefone)
VALUES (@PessoaID, 'Empresa XYZ Ltda', 'J', 'Av. B, 456', '9876-5432');

INSERT INTO MovimentosCompra (MovimentoCompraID, ProdutoID, PessoaID, Quantidade, PrecoUnitario)
VALUES (1, 1, 1, 5, 100.00),
       (2, 2, 1, 3, 150.00);

INSERT INTO MovimentosVenda (MovimentoVendaID, ProdutoID, PessoaID, Quantidade, PrecoUnitario)
VALUES (1, 1, 2, 2, 120.00),
       (2, 3, 2, 4, 180.00);

select * from MovimentosCompra

select * from MovimentosVenda

SELECT *
FROM Pessoas
WHERE Tipo = 'F';

SELECT *
FROM Pessoas
WHERE Tipo = 'J';

SELECT 'Entrada' AS TipoMovimentacao, P.Nome AS Fornecedor, Pr.Nome AS Produto, MC.Quantidade, MC.PrecoUnitario, MC.Quantidade * MC.PrecoUnitario AS ValorTotal
FROM MovimentosCompra MC
JOIN Pessoas P ON MC.PessoaID = P.PessoaID
JOIN Produtos Pr ON MC.ProdutoID = Pr.ProdutoID;

SELECT 'Saída' AS TipoMovimentacao, P.Nome AS Comprador, Pr.Nome AS Produto, MV.Quantidade, MV.PrecoUnitario, MV.Quantidade * MV.PrecoUnitario AS ValorTotal
FROM MovimentosVenda MV
JOIN Pessoas P ON MV.PessoaID = P.PessoaID
JOIN Produtos Pr ON MV.ProdutoID = Pr.ProdutoID;

SELECT Pr.Nome AS Produto, SUM(MC.Quantidade * MC.PrecoUnitario) AS ValorTotalEntradas
FROM MovimentosCompra MC
JOIN Produtos Pr ON MC.ProdutoID = Pr.ProdutoID
GROUP BY Pr.Nome;

SELECT Pr.Nome AS Produto, SUM(MV.Quantidade * MV.PrecoUnitario) AS ValorTotalSaidas
FROM MovimentosVenda MV
JOIN Produtos Pr ON MV.ProdutoID = Pr.ProdutoID
GROUP BY Pr.Nome;

SELECT U.Nome AS Operador
FROM Usuarios U
LEFT JOIN MovimentosCompra MC ON U.UsuarioID = MC.UsuarioID
WHERE MC.UsuarioID IS NULL;

SELECT U.Nome AS Operador, SUM(MC.Quantidade * MC.PrecoUnitario) AS ValorTotalEntradas
FROM MovimentosCompra MC
JOIN Usuarios U ON MC.UsuarioID = U.UsuarioID
GROUP BY U.Nome;

SELECT U.Nome AS Operador, SUM(MV.Quantidade * MV.PrecoUnitario) AS ValorTotalSaidas
FROM MovimentosVenda MV
JOIN Usuarios U ON MV.UsuarioID = U.UsuarioID
GROUP BY U.Nome;

SELECT MV.ProdutoID, AVG(MV.PrecoUnitario) AS ValorMedioVenda
FROM MovimentosVenda MV
GROUP BY MV.ProdutoID;





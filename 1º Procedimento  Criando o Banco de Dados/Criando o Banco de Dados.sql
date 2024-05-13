CREATE TABLE Produtos  (
  ProdutoID INT   NOT NULL ,
  Nome VARCHAR(100)    ,
  Quantidade INT    ,
  Preco DECIMAL(10, 2)      ,
PRIMARY KEY(ProdutoID));




CREATE TABLE usuários (
  UsuarioID INT   NOT NULL ,
  Nome VARCHAR(100)    ,
  Senha VARCHAR(50)      ,
PRIMARY KEY(UsuarioID));




CREATE TABLE Pessoas (
  PessoaID  INT   NOT NULL ,
  Nome VARCHAR(100)    ,
  Tipo VARCHAR(1)    ,
  CPF VARCHAR(14)    ,
  CNPJ VARCHAR(18)    ,
  Endereco VARCHAR(200)    ,
  Telefone VARCHAR(20)      ,
PRIMARY KEY(PessoaID ));




CREATE TABLE MovimentosCompra  (
  MovimentoCompraID INT   NOT NULL ,
  Pessoas_PessoaID  INT   NOT NULL ,
  Produtos _ProdutoID INT   NOT NULL ,
  usuários_UsuarioID INT   NOT NULL ,
  ProdutoID INT    ,
  PessoaID INT    ,
  Quantidade INT    ,
  PrecoUnitario DECIMAL(10, 2)      ,
PRIMARY KEY(MovimentoCompraID, Pessoas_PessoaID , Produtos _ProdutoID, usuários_UsuarioID)      ,
  FOREIGN KEY(Pessoas_PessoaID )
    REFERENCES Pessoas(PessoaID ),
  FOREIGN KEY(Produtos _ProdutoID)
    REFERENCES Produtos (ProdutoID),
  FOREIGN KEY(usuários_UsuarioID)
    REFERENCES usuários(UsuarioID));


CREATE INDEX MovimentosCompra _FKIndex1 ON MovimentosCompra  (Pessoas_PessoaID );
CREATE INDEX MovimentosCompra _FKIndex2 ON MovimentosCompra  (Produtos _ProdutoID);
CREATE INDEX MovimentosCompra _FKIndex3 ON MovimentosCompra  (usuários_UsuarioID);


CREATE INDEX IFK_Rel_1x1 ON MovimentosCompra  (Pessoas_PessoaID );
CREATE INDEX IFK_Rel_Nx1 ON MovimentosCompra  (Produtos _ProdutoID);
CREATE INDEX IFK_Rel_1x1 ON MovimentosCompra  (usuários_UsuarioID);


CREATE TABLE MovimentosVenda  (
  MovimentoVendaID INT   NOT NULL ,
  Pessoas_PessoaID  INT   NOT NULL ,
  Produtos _ProdutoID INT   NOT NULL ,
  usuários_UsuarioID INT   NOT NULL ,
  ProdutoID INT    ,
  PessoaID INT    ,
  Quantidade INT    ,
  PrecoUnitario DECIMAL(10, 2)      ,
PRIMARY KEY(MovimentoVendaID, Pessoas_PessoaID , Produtos _ProdutoID, usuários_UsuarioID)      ,
  FOREIGN KEY(Pessoas_PessoaID )
    REFERENCES Pessoas(PessoaID ),
  FOREIGN KEY(Produtos _ProdutoID)
    REFERENCES Produtos (ProdutoID),
  FOREIGN KEY(usuários_UsuarioID)
    REFERENCES usuários(UsuarioID));


CREATE INDEX MovimentosVenda _FKIndex1 ON MovimentosVenda  (Pessoas_PessoaID );
CREATE INDEX MovimentosVenda _FKIndex2 ON MovimentosVenda  (Produtos _ProdutoID);
CREATE INDEX MovimentosVenda _FKIndex3 ON MovimentosVenda  (usuários_UsuarioID);


CREATE INDEX IFK_Rel_1x1 ON MovimentosVenda  (Pessoas_PessoaID );
CREATE INDEX IFK_Rel_Nx1 ON MovimentosVenda  (Produtos _ProdutoID);
CREATE INDEX IFK_Rel_1x1 ON MovimentosVenda  (usuários_UsuarioID);




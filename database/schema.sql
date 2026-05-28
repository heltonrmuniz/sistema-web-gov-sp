-- ===================================================
-- BANCO DE DADOS - SISTEMA DE ESTOQUE
-- ===================================================
-- Este arquivo contém APENAS a estrutura (sem dados)
-- Execute no SQL Server Management Studio
-- ===================================================

-- Criar banco de dados (opcional - se não existir)
-- CREATE DATABASE CR_LIMEIRA;
-- GO

-- USE CR_LIMEIRA;
-- GO

-- ===================================================
-- TABELA DE PRODUTOS
-- ===================================================
CREATE TABLE Produtos (
    IdProduto INT IDENTITY(1,1) PRIMARY KEY,
    NomeProduto VARCHAR(100) NOT NULL,
    Descricao TEXT,
    TipoProduto VARCHAR(50), -- Estocável, Perecível, Hortifruti, Escritório, Limpeza, Kit, Vestuário, Utensílio
    UnidadeMedida VARCHAR(20), -- KG, UN, L, CX, PC
    QuantidadeMinima INT DEFAULT 0,
    QuantidadeAtual INT DEFAULT 0,
    Localizacao VARCHAR(50),
    DataCadastro DATETIME DEFAULT GETDATE(),
    Ativo BIT DEFAULT 1
);

-- ===================================================
-- TABELA DE ENTRADAS (PRODUTO_ESTOQUE_ENTRADA)
-- ===================================================
CREATE TABLE Entradas (
    IdEntrada INT IDENTITY(1,1) PRIMARY KEY,
    IdProduto INT FOREIGN KEY REFERENCES Produtos(IdProduto),
    Quantidade INT NOT NULL,
    ValorUnitario DECIMAL(10,2),
    ValorTotal DECIMAL(10,2),
    DataEntrada DATETIME DEFAULT GETDATE(),
    NotaFiscal VARCHAR(50),
    Fornecedor VARCHAR(100),
    Responsavel VARCHAR(50),
    Observacao TEXT
);

-- ===================================================
-- TABELA DE BAIXAS (PRODUTO_ESTOQUE_BAIXA)
-- ===================================================
CREATE TABLE Baixas (
    IdBaixa INT IDENTITY(1,1) PRIMARY KEY,
    IdProduto INT FOREIGN KEY REFERENCES Produtos(IdProduto),
    Quantidade INT NOT NULL,
    DataBaixa DATETIME DEFAULT GETDATE(),
    Destino VARCHAR(100),
    Responsavel VARCHAR(50),
    Observacao TEXT
);

-- ===================================================
-- TABELA DE CONTROLE DE VENCIMENTO
-- ===================================================
CREATE TABLE Vencimentos (
    IdVencimento INT IDENTITY(1,1) PRIMARY KEY,
    IdProduto INT FOREIGN KEY REFERENCES Produtos(IdProduto),
    DataFabricacao DATE,
    DataVencimento DATE NOT NULL,
    Lote VARCHAR(50),
    Quantidade INT NOT NULL,
    DataEntrada DATETIME DEFAULT GETDATE(),
    Status VARCHAR(20) DEFAULT 'Vigente' -- Vigente, Vencido, Utilizado
);

-- ===================================================
-- TABELA DE PREVISÕES
-- ===================================================
CREATE TABLE Previsoes (
    IdPrevisao INT IDENTITY(1,1) PRIMARY KEY,
    IdProduto INT FOREIGN KEY REFERENCES Produtos(IdProduto),
    Periodo VARCHAR(20), -- Mensal, Bimestral, Trimestral
    Ano INT,
    Mes INT,
    QuantidadePrevista INT,
    QuantidadeReal INT,
    DataPrevisao DATETIME DEFAULT GETDATE()
);

-- ===================================================
-- TABELA DE PEDIDOS
-- ===================================================
CREATE TABLE Pedidos (
    IdPedido INT IDENTITY(1,1) PRIMARY KEY,
    IdProduto INT FOREIGN KEY REFERENCES Produtos(IdProduto),
    TipoPedido VARCHAR(30), -- Trimestral, Urgente, Reposição
    Quantidade INT,
    DataPedido DATETIME DEFAULT GETDATE(),
    Status VARCHAR(20) DEFAULT 'Pendente', -- Pendente, Aprovado, Entregue, Cancelado
    Observacao TEXT
);

-- ===================================================
-- TABELA DE ROMANEIOS
-- ===================================================
CREATE TABLE Romaneios (
    IdRomaneio INT IDENTITY(1,1) PRIMARY KEY,
    Tipo VARCHAR(20), -- Entrada, Retirada
    DataRomaneio DATETIME DEFAULT GETDATE(),
    ArquivoPDF VARCHAR(200),
    GeradoPor VARCHAR(50)
);

-- ===================================================
-- TABELA DE LOGS/AUDITORIA (opcional)
-- ===================================================
CREATE TABLE Logs (
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    Tabela VARCHAR(50),
    Acao VARCHAR(20), -- INSERT, UPDATE, DELETE
    IdRegistro INT,
    Usuario VARCHAR(50),
    DataAcao DATETIME DEFAULT GETDATE(),
    Detalhes TEXT
);

-- ===================================================
-- ÍNDICES PARA MELHOR PERFORMANCE
-- ===================================================
CREATE INDEX IX_Entradas_IdProduto ON Entradas(IdProduto);
CREATE INDEX IX_Entradas_DataEntrada ON Entradas(DataEntrada);
CREATE INDEX IX_Baixas_IdProduto ON Baixas(IdProduto);
CREATE INDEX IX_Baixas_DataBaixa ON Baixas(DataBaixa);
CREATE INDEX IX_Vencimentos_IdProduto ON Vencimentos(IdProduto);
CREATE INDEX IX_Vencimentos_DataVencimento ON Vencimentos(DataVencimento);
CREATE INDEX IX_Produtos_TipoProduto ON Produtos(TipoProduto);

-- ===================================================
-- TRIGGER PARA ATUALIZAR QUANTIDADE ATUAL DO PRODUTO
-- ===================================================
-- Trigger para entrada de produtos
CREATE TRIGGER trg_Entrada_AtualizaEstoque
ON Entradas
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.QuantidadeAtual = p.QuantidadeAtual + i.Quantidade
    FROM Produtos p
    INNER JOIN inserted i ON p.IdProduto = i.IdProduto
END;
GO

-- Trigger para baixa de produtos
CREATE TRIGGER trg_Baixa_AtualizaEstoque
ON Baixas
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.QuantidadeAtual = p.QuantidadeAtual - i.Quantidade
    FROM Produtos p
    INNER JOIN inserted i ON p.IdProduto = i.IdProduto
END;
GO

-- ===================================================
-- FIM DO SCRIPT
-- ===================================================

CREATE TABLE produtos (
    id_produto INT IDENTITY(1,1) NOT NULL,          -- ID do Produto
    nome_produto NVARCHAR(255) NOT NULL,           -- Nome do Produto
    preco_unitario DECIMAL(10, 2) NOT NULL,        -- Preço Unitário
    estoque_disponivel INT DEFAULT 0,              -- Estoque Disponível
    PRIMARY KEY (id_produto),                      -- Chave Primária
    UNIQUE (nome_produto)                          -- Restrição de Unicidade
);

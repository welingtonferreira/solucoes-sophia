CREATE TABLE vendas (
    id_venda INT IDENTITY(1,1) PRIMARY KEY,          -- Número da Venda
    id_cliente INT NOT NULL,                         -- Código do Cliente
    data_venda DATETIME NOT NULL,                    -- Data da Venda
    total_venda DECIMAL(10, 2) NOT NULL,             -- Total da Venda
    CONSTRAINT fk_vendas_clientes
        FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
        ON DELETE NO ACTION
);

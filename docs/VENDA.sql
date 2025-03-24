CREATE TABLE IF NOT EXISTS vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,         -- Número da Venda
    id_cliente INT NOT NULL,                          -- Código do Cliente
    data_venda DATETIME NOT NULL,                     -- Data da Venda
    total_venda DECIMAL(10, 2) NOT NULL,              -- Total da Venda
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE RESTRICT
);
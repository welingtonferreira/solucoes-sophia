CREATE TABLE IF NOT EXISTS itens_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,          -- Identificador do Item de Venda
    id_venda INT NOT NULL,                           -- Número da Venda
    id_produto INT NOT NULL,                         -- Código do Produto
    quantidade INT NOT NULL,                         -- Quantidade Vendida
    valor_unitario DECIMAL(10, 2) NOT NULL,          -- Valor Unitário do Produto
    subtotal DECIMAL(10, 2) NOT NULL,                -- Subtotal (quantidade * valor_unitario)
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE RESTRICT
);
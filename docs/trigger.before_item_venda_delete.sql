CREATE TRIGGER before_item_venda_delete
ON itens_venda
INSTEAD OF DELETE
AS
BEGIN
    -- Atualizar o estoque do produto antes de excluir o item de venda
    UPDATE produtos
    SET estoque_disponivel = estoque_disponivel + d.quantidade
    FROM produtos p
    INNER JOIN deleted d ON p.id_produto = d.id_produto;

    -- Excluir o item de venda
    DELETE FROM itens_venda
    WHERE id_item IN (SELECT id_item FROM deleted);
END;

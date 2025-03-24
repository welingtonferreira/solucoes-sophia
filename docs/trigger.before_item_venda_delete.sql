DELIMITER $$

CREATE TRIGGER before_item_venda_delete
BEFORE DELETE ON itens_venda
FOR EACH ROW
BEGIN
    -- Atualiza o estoque do produto antes de excluir a venda
    UPDATE produtos
    SET estoque_disponivel = estoque_disponivel + OLD.quantidade
    WHERE id_produto = OLD.id_produto;
END$$

DELIMITER ;


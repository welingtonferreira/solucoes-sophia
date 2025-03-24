DELIMITER $$

CREATE TRIGGER after_item_venda_insert
AFTER INSERT ON itens_venda
FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;

    -- Atualiza o estoque do produto
    UPDATE produtos
    SET estoque_disponivel = estoque_disponivel - NEW.quantidade
    WHERE id_produto = NEW.id_produto;

    -- Obter o saldo atual do estoque
    SELECT estoque_disponivel INTO estoque_atual
    FROM produtos
    WHERE id_produto = NEW.id_produto;

    -- Verificar se o estoque ficou negativo
    IF estoque_atual < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estoque insuficiente para o produto!';
    END IF;
END$$

DELIMITER ;



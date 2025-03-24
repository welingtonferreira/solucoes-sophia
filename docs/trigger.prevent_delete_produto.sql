DELIMITER $$

CREATE TRIGGER prevent_delete_produto
BEFORE DELETE ON produtos
FOR EACH ROW
BEGIN
    DECLARE item_venda_count INT;

    -- Verifica se o produto está em algum item de venda
    SELECT COUNT(*) INTO item_venda_count
    FROM itens_venda
    WHERE id_produto = OLD.id_produto;

    -- Impede a exclusão se o produto estiver em algum item de venda
    IF item_venda_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível excluir o produto. Ele está associado a vendas.';
    END IF;
END $$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER prevent_delete_cliente
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
    DECLARE venda_count INT;

    -- Verifica se o cliente tem vendas associadas
    SELECT COUNT(*) INTO venda_count
    FROM vendas
    WHERE id_cliente = OLD.id_cliente;

    -- Impede a exclusão se houver vendas associadas
    IF venda_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível excluir o cliente. Existem vendas associadas a este cliente.';
    END IF;
END $$

DELIMITER ;

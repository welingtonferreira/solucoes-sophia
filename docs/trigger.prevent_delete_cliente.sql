CREATE TRIGGER prevent_delete_cliente
ON clientes
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @venda_count INT;
    DECLARE @id_cliente INT;

    -- Obter o ID do cliente que está sendo excluído
    SELECT @id_cliente = id_cliente
    FROM deleted;

    -- Verificar se o cliente tem vendas associadas
    SELECT @venda_count = COUNT(*)
    FROM vendas
    WHERE id_cliente = @id_cliente;

    -- Impedir a exclusão se houver vendas associadas
    IF @venda_count > 0
    BEGIN
        RAISERROR ('Não é possível excluir o cliente. Existem vendas associadas a este cliente.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Excluir o cliente se não houver vendas associadas
        DELETE FROM clientes
        WHERE id_cliente = @id_cliente;
    END
END;

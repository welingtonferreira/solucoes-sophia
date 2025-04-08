CREATE TRIGGER prevent_delete_produto
ON produtos
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @item_venda_count INT;
    DECLARE @id_produto INT;

    -- Obter o ID do produto que está sendo excluído
    SELECT @id_produto = id_produto
    FROM deleted;

    -- Verificar se o produto está em algum item de venda
    SELECT @item_venda_count = COUNT(*)
    FROM itens_venda
    WHERE id_produto = @id_produto;

    -- Impedir a exclusão se o produto estiver associado a vendas
    IF @item_venda_count > 0
    BEGIN
        RAISERROR ('Não é possível excluir o produto. Ele está associado a vendas.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Excluir o produto se não estiver associado a vendas
        DELETE FROM produtos
        WHERE id_produto = @id_produto;
    END
END;

CREATE TRIGGER after_item_venda_insert
ON itens_venda
AFTER INSERT
AS
BEGIN
    DECLARE @estoque_atual INT;
    DECLARE @id_produto INT;
    DECLARE @quantidade INT;

    -- Obter os valores inseridos
    SELECT @id_produto = id_produto, @quantidade = quantidade
    FROM inserted;

    -- Atualizar o estoque do produto
    UPDATE produtos
    SET estoque_disponivel = estoque_disponivel - @quantidade
    WHERE id_produto = @id_produto;

    -- Obter o saldo atual do estoque
    SELECT @estoque_atual = estoque_disponivel
    FROM produtos
    WHERE id_produto = @id_produto;

    -- Verificar se o estoque ficou negativo
    IF @estoque_atual < 0
    BEGIN
        RAISERROR ('Estoque insuficiente para o produto!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

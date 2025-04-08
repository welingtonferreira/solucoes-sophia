object dtCadastros: TdtCadastros
  Height = 390
  Width = 491
  object Produtos: TFDQuery
    Active = True
    CachedUpdates = True
    IndexFieldNames = 'ID_PRODUTO'
    Connection = DMPrincipal.FireDacCon
    Transaction = DMPrincipal.FireTransCon
    UpdateTransaction = DMPrincipal.FireTransCon
    UpdateObject = upProdutos
    SQL.Strings = (
      
        'SELECT ID_PRODUTO, NOME_PRODUTO, PRECO_UNITARIO, ESTOQUE_DISPONI' +
        'VEL'
      '  FROM PRODUTOS'
      '')
    Left = 120
    Top = 8
    object ProdutosID_PRODUTO: TFDAutoIncField
      FieldName = 'ID_PRODUTO'
      ReadOnly = True
    end
    object ProdutosNOME_PRODUTO: TWideStringField
      FieldName = 'NOME_PRODUTO'
      Required = True
      Size = 255
    end
    object ProdutosPRECO_UNITARIO: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Required = True
      Precision = 10
      Size = 2
    end
    object ProdutosESTOQUE_DISPONIVEL: TIntegerField
      FieldName = 'ESTOQUE_DISPONIVEL'
    end
  end
  object dsProdutos: TDataSource
    DataSet = Produtos
    Left = 120
    Top = 64
  end
  object Clientes: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DMPrincipal.FireDacCon
    Transaction = DMPrincipal.FireTransCon
    UpdateTransaction = DMPrincipal.FireTransCon
    UpdateObject = upClientes
    SQL.Strings = (
      
        'SELECT ID_CLIENTE, NOME_COMPLETO, CPF_CNPJ, TELEFONE, EMAIL, END' +
        'ERECO_COMPLETO'
      '  FROM CLIENTES')
    Left = 40
    Top = 8
    object ClientesID_CLIENTE: TFDAutoIncField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ClientesNOME_COMPLETO: TWideStringField
      FieldName = 'NOME_COMPLETO'
      Origin = 'NOME_COMPLETO'
      Required = True
      Size = 255
    end
    object ClientesCPF_CNPJ: TWideStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      Size = 18
    end
    object ClientesTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
    object ClientesEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object ClientesENDERECO_COMPLETO: TWideStringField
      FieldName = 'ENDERECO_COMPLETO'
      Origin = 'ENDERECO_COMPLETO'
      Size = 255
    end
  end
  object dsClientes: TDataSource
    DataSet = Clientes
    Left = 40
    Top = 56
  end
  object upProdutos: TFDUpdateSQL
    Connection = DMPrincipal.FireDacCon
    InsertSQL.Strings = (
      'INSERT INTO SOPHIA.dbo.PRODUTOS'
      '(nome_produto, preco_unitario, estoque_disponivel)'
      
        'VALUES (:NEW_nome_produto, :NEW_preco_unitario, :NEW_estoque_dis' +
        'ponivel);'
      'SELECT SCOPE_IDENTITY() AS id_produto')
    ModifySQL.Strings = (
      'UPDATE SOPHIA.dbo.PRODUTOS'
      
        'SET nome_produto = :NEW_nome_produto, preco_unitario = :NEW_prec' +
        'o_unitario, '
      '  estoque_disponivel = :NEW_estoque_disponivel'
      
        'WHERE nome_produto = :OLD_nome_produto AND preco_unitario = :OLD' +
        '_preco_unitario AND '
      '  estoque_disponivel = :OLD_estoque_disponivel;'
      'SELECT id_produto'
      'FROM SOPHIA.dbo.PRODUTOS'
      
        'WHERE nome_produto = :NEW_nome_produto AND preco_unitario = :NEW' +
        '_preco_unitario AND '
      '  estoque_disponivel = :NEW_estoque_disponivel')
    DeleteSQL.Strings = (
      'DELETE FROM SOPHIA.dbo.PRODUTOS'
      
        'WHERE nome_produto = :OLD_nome_produto AND preco_unitario = :OLD' +
        '_preco_unitario AND '
      '  estoque_disponivel = :OLD_estoque_disponivel')
    FetchRowSQL.Strings = (
      
        'SELECT id_produto, nome_produto, preco_unitario, estoque_disponi' +
        'vel'
      'FROM ('
      'select * from PRODUTOS'
      ') '
      
        'WHERE nome_produto = :OLD_nome_produto AND preco_unitario = :OLD' +
        '_preco_unitario AND '
      '  estoque_disponivel = :OLD_estoque_disponivel')
    Left = 120
    Top = 112
  end
  object upClientes: TFDUpdateSQL
    Connection = DMPrincipal.FireDacCon
    InsertSQL.Strings = (
      'INSERT INTO SOPHIA.dbo.CLIENTES'
      '(nome_completo, cpf_cnpj, telefone, email, '
      '  endereco_completo)'
      
        'VALUES (:NEW_nome_completo, :NEW_cpf_cnpj, :NEW_telefone, :NEW_e' +
        'mail, '
      '  :NEW_endereco_completo);'
      'SELECT SCOPE_IDENTITY() AS id_cliente')
    ModifySQL.Strings = (
      'UPDATE SOPHIA.dbo.CLIENTES'
      
        'SET nome_completo = :NEW_nome_completo, cpf_cnpj = :NEW_cpf_cnpj' +
        ', '
      
        '  telefone = :NEW_telefone, email = :NEW_email, endereco_complet' +
        'o = :NEW_endereco_completo'
      'WHERE id_cliente = :OLD_id_cliente;'
      'SELECT id_cliente'
      'FROM SOPHIA.dbo.CLIENTES'
      'WHERE id_cliente = :NEW_id_cliente')
    DeleteSQL.Strings = (
      'DELETE FROM SOPHIA.dbo.CLIENTES'
      'WHERE id_cliente = :OLD_id_cliente')
    FetchRowSQL.Strings = (
      
        'SELECT id_cliente, nome_completo, cpf_cnpj, telefone, email, end' +
        'ereco_completo'
      'FROM ('
      'select * from CLIENTES'
      ') '
      'WHERE id_cliente = :OLD_id_cliente')
    Left = 43
    Top = 104
  end
  object Vendas: TFDQuery
    Active = True
    CachedUpdates = True
    IndexFieldNames = 'ID_VENDA'
    Connection = DMPrincipal.FireDacCon
    Transaction = DMPrincipal.FireTransCon
    UpdateTransaction = DMPrincipal.FireTransCon
    UpdateObject = upVendas
    SQL.Strings = (
      'SELECT ID_VENDA, ID_CLIENTE, DATA_VENDA, TOTAL_VENDA'
      '  FROM VENDAS')
    Left = 192
    Top = 16
    object VendasID_VENDA: TFDAutoIncField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object VendasID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object VendasDATA_VENDA: TSQLTimeStampField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
      Required = True
    end
    object VendasTOTAL_VENDA: TBCDField
      FieldName = 'TOTAL_VENDA'
      Origin = 'TOTAL_VENDA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
  end
  object dsVendas: TDataSource
    DataSet = Vendas
    Left = 192
    Top = 64
  end
  object upVendas: TFDUpdateSQL
    Connection = DMPrincipal.FireDacCon
    InsertSQL.Strings = (
      'INSERT INTO SOPHIA.dbo.VENDAS'
      '(id_cliente, data_venda, total_venda)'
      'VALUES (:NEW_id_cliente, :NEW_data_venda, :NEW_total_venda);'
      'SELECT SCOPE_IDENTITY() AS id_venda')
    ModifySQL.Strings = (
      'UPDATE SOPHIA.dbo.VENDAS'
      'SET id_cliente = :NEW_id_cliente, data_venda = :NEW_data_venda, '
      '  total_venda = :NEW_total_venda'
      'WHERE id_venda = :OLD_id_venda;'
      'SELECT id_venda'
      'FROM SOPHIA.dbo.VENDAS'
      'WHERE id_venda = :NEW_id_venda')
    DeleteSQL.Strings = (
      'DELETE FROM SOPHIA.dbo.VENDAS'
      'WHERE id_venda = :OLD_id_venda')
    FetchRowSQL.Strings = (
      'SELECT id_venda, id_cliente, data_venda, total_venda'
      'FROM ('
      'select * from VENDAS'
      ') '
      'WHERE id_venda = :OLD_id_venda')
    Left = 192
    Top = 118
  end
  object ItensVendas: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DMPrincipal.FireDacCon
    Transaction = DMPrincipal.FireTransCon
    UpdateTransaction = DMPrincipal.FireTransCon
    UpdateObject = upItensVendas
    SQL.Strings = (
      
        'SELECT ID_ITEM, ID_VENDA, ID_PRODUTO, QUANTIDADE, VALOR_UNITARIO' +
        ', SUBTOTAL'
      '  FROM ITENS_VENDA'
      '')
    Left = 264
    Top = 24
    object ItensVendasID_ITEM: TFDAutoIncField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ItensVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      Required = True
    end
    object ItensVendasID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object ItensVendasQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object ItensVendasVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ItensVendasSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
  end
  object dsItensVendas: TDataSource
    DataSet = ItensVendas
    Left = 264
    Top = 80
  end
  object upItensVendas: TFDUpdateSQL
    Connection = DMPrincipal.FireDacCon
    InsertSQL.Strings = (
      'INSERT INTO SOPHIA.dbo.ITENS_VENDA'
      '(id_venda, id_produto, quantidade, valor_unitario, '
      '  subtotal)'
      
        'VALUES (:NEW_id_venda, :NEW_id_produto, :NEW_quantidade, :NEW_va' +
        'lor_unitario, '
      '  :NEW_subtotal);'
      'SELECT SCOPE_IDENTITY() AS id_item')
    ModifySQL.Strings = (
      'UPDATE SOPHIA.dbo.ITENS_VENDA'
      
        'SET id_venda = :NEW_id_venda, id_produto = :NEW_id_produto, quan' +
        'tidade = :NEW_quantidade, '
      '  valor_unitario = :NEW_valor_unitario, subtotal = :NEW_subtotal'
      'WHERE id_item = :OLD_id_item;'
      'SELECT id_item'
      'FROM SOPHIA.dbo.ITENS_VENDA'
      'WHERE id_item = :NEW_id_item')
    DeleteSQL.Strings = (
      'DELETE FROM SOPHIA.dbo.ITENS_VENDA'
      'WHERE id_item = :OLD_id_item')
    FetchRowSQL.Strings = (
      
        'SELECT id_item, id_venda, id_produto, quantidade, valor_unitario' +
        ', subtotal'
      'FROM ('
      'select * from ITENS_VENDA'
      ') '
      'WHERE id_item = :OLD_id_item')
    Left = 264
    Top = 134
  end
  object User: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DMPrincipal.FireDacCon
    Transaction = DMPrincipal.FireTransCon
    UpdateTransaction = DMPrincipal.FireTransCon
    UpdateObject = upUser
    SQL.Strings = (
      'SELECT ID, NOME, CPF, RG, EMAIL, CEL, TEL, LOGIN, SENHA'
      'FROM [USER]')
    Left = 424
    Top = 24
    object UserID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object UserNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object UserCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      FixedChar = True
      Size = 11
    end
    object UserRG: TWideStringField
      FieldName = 'RG'
      Origin = 'RG'
    end
    object UserEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object UserCEL: TWideStringField
      FieldName = 'CEL'
      Origin = 'CEL'
      Size = 15
    end
    object UserTEL: TWideStringField
      FieldName = 'TEL'
      Origin = 'TEL'
      Size = 15
    end
    object UserLOGIN: TWideStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
      Size = 50
    end
    object UserSENHA: TWideStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
  end
  object dsUser: TDataSource
    DataSet = User
    Left = 424
    Top = 72
  end
  object upUser: TFDUpdateSQL
    Connection = DMPrincipal.FireDacCon
    InsertSQL.Strings = (
      'INSERT INTO SOPHIA.dbo.[USER]'
      '(nome, cpf, rg, email, cel, tel, '
      '  login, senha)'
      
        'VALUES (:NEW_nome, :NEW_cpf, :NEW_rg, :NEW_email, :NEW_cel, :NEW' +
        '_tel, '
      '  :NEW_login, :NEW_senha);'
      'SELECT SCOPE_IDENTITY() AS id')
    ModifySQL.Strings = (
      'UPDATE SOPHIA.dbo.[USER]'
      
        'SET nome = :NEW_nome, cpf = :NEW_cpf, rg = :NEW_rg, email = :NEW' +
        '_email, '
      
        '  cel = :NEW_cel, tel = :NEW_tel, login = :NEW_login, senha = :N' +
        'EW_senha'
      'WHERE id = :OLD_id;'
      'SELECT id'
      'FROM SOPHIA.dbo.[USER]'
      'WHERE id = :NEW_id')
    DeleteSQL.Strings = (
      'DELETE FROM SOPHIA.dbo.[USER]'
      'WHERE id = :OLD_id')
    FetchRowSQL.Strings = (
      
        'SELECT id, nome, cpf, rg, email, cel, tel, login, senha, adminis' +
        'trador'
      'FROM ('
      'select * from [USER]'
      ') '
      'WHERE id = :OLD_id')
    Left = 427
    Top = 120
  end
end

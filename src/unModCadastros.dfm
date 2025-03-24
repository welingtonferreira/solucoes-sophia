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
      Origin = 'id_produto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ProdutosNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'nome_produto'
      Required = True
      Size = 255
    end
    object ProdutosPRECO_UNITARIO: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Origin = 'preco_unitario'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ProdutosESTOQUE_DISPONIVEL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE_DISPONIVEL'
      Origin = 'estoque_disponivel'
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
      Origin = 'id_cliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ClientesNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Origin = 'nome_completo'
      Required = True
      Size = 255
    end
    object ClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'cpf_cnpj'
      Required = True
      Size = 18
    end
    object ClientesTELEFONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TELEFONE'
      Origin = 'telefone'
      Size = 15
    end
    object ClientesEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'email'
      Size = 100
    end
    object ClientesENDERECO_COMPLETO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDERECO_COMPLETO'
      Origin = 'endereco_completo'
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
      'INSERT INTO sismaster.produtos'
      '(nome_produto, preco_unitario, estoque_disponivel)'
      
        'VALUES (:new_nome_produto, :new_preco_unitario, :new_estoque_dis' +
        'ponivel)')
    ModifySQL.Strings = (
      'UPDATE sismaster.produtos'
      
        'SET nome_produto = :new_nome_produto, preco_unitario = :new_prec' +
        'o_unitario, '
      '  estoque_disponivel = :new_estoque_disponivel'
      'WHERE id_produto = :old_id_produto')
    DeleteSQL.Strings = (
      'DELETE FROM sismaster.produtos'
      'WHERE id_produto = :old_id_produto')
    FetchRowSQL.Strings = (
      
        'SELECT id_produto, nome_produto, preco_unitario, estoque_disponi' +
        'vel'
      'FROM sismaster.produtos'
      'WHERE id_produto = :old_id_produto')
    Left = 120
    Top = 112
  end
  object upClientes: TFDUpdateSQL
    Connection = DMPrincipal.FireDacCon
    InsertSQL.Strings = (
      'INSERT INTO sismaster.clientes'
      '(nome_completo, cpf_cnpj, telefone, email, '
      '  endereco_completo)'
      
        'VALUES (:new_nome_completo, :new_cpf_cnpj, :new_telefone, :new_e' +
        'mail, '
      '  :new_endereco_completo)')
    ModifySQL.Strings = (
      'UPDATE sismaster.clientes'
      
        'SET nome_completo = :new_nome_completo, cpf_cnpj = :new_cpf_cnpj' +
        ', '
      
        '  telefone = :new_telefone, email = :new_email, endereco_complet' +
        'o = :new_endereco_completo'
      'WHERE id_cliente = :old_id_cliente')
    DeleteSQL.Strings = (
      'DELETE FROM sismaster.clientes'
      'WHERE id_cliente = :old_id_cliente')
    FetchRowSQL.Strings = (
      
        'SELECT id_cliente, nome_completo, cpf_cnpj, telefone, email, end' +
        'ereco_completo'
      'FROM sismaster.clientes'
      'WHERE id_cliente = :old_id_cliente')
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
      Origin = 'id_venda'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object VendasID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'id_cliente'
      Required = True
    end
    object VendasDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
      Origin = 'data_venda'
      Required = True
    end
    object VendasTOTAL_VENDA: TBCDField
      FieldName = 'TOTAL_VENDA'
      Origin = 'total_venda'
      Required = True
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
      'INSERT INTO sismaster.vendas'
      '(id_cliente, data_venda, total_venda)'
      'VALUES (:new_id_cliente, :new_data_venda, :new_total_venda)')
    ModifySQL.Strings = (
      'UPDATE sismaster.vendas'
      'SET id_cliente = :new_id_cliente, data_venda = :new_data_venda, '
      '  total_venda = :new_total_venda'
      'WHERE id_venda = :old_id_venda')
    DeleteSQL.Strings = (
      'DELETE FROM sismaster.vendas'
      'WHERE id_venda = :old_id_venda')
    FetchRowSQL.Strings = (
      'SELECT id_venda, id_cliente, data_venda, total_venda'
      'FROM sismaster.vendas'
      'WHERE id_venda = :old_id_venda')
    Left = 192
    Top = 118
  end
  object ItensVendas: TFDQuery
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
      Origin = 'id_item'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ItensVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'id_venda'
      Required = True
    end
    object ItensVendasID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'id_produto'
      Required = True
    end
    object ItensVendasQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'quantidade'
      Required = True
    end
    object ItensVendasVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'valor_unitario'
      Required = True
      Precision = 10
      Size = 2
    end
    object ItensVendasSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'subtotal'
      Required = True
      Precision = 10
      Size = 2
    end
    object ItensVendasVIRTUAL_NOME_PRODUTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'VIRTUAL_NOME_PRODUTO'
      LookupDataSet = dtSelecoes.ConsProdutos
      LookupKeyFields = 'ID_PRODUTO'
      LookupResultField = 'NOME_PRODUTO'
      Calculated = True
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
      'INSERT INTO sismaster.itens_venda'
      '(id_venda, id_produto, quantidade, valor_unitario, '
      '  subtotal)'
      
        'VALUES (:new_id_venda, :new_id_produto, :new_quantidade, :new_va' +
        'lor_unitario, '
      '  :new_subtotal)')
    ModifySQL.Strings = (
      'UPDATE sismaster.itens_venda'
      
        'SET id_venda = :new_id_venda, id_produto = :new_id_produto, quan' +
        'tidade = :new_quantidade, '
      '  valor_unitario = :new_valor_unitario, subtotal = :new_subtotal'
      'WHERE id_item = :old_id_item')
    DeleteSQL.Strings = (
      'DELETE FROM sismaster.itens_venda'
      'WHERE id_item = :old_id_item')
    FetchRowSQL.Strings = (
      
        'SELECT id_item, id_venda, id_produto, quantidade, valor_unitario' +
        ', subtotal'
      'FROM sismaster.itens_venda'
      'WHERE id_item = :old_id_item')
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
      'FROM USER')
    Left = 424
    Top = 24
    object UserID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object UserNOME: TStringField
      FieldName = 'NOME'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object UserCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'cpf'
      FixedChar = True
      Size = 11
    end
    object UserRG: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RG'
      Origin = 'rg'
    end
    object UserEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'email'
      Size = 100
    end
    object UserCEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEL'
      Origin = 'cel'
      Size = 15
    end
    object UserTEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TEL'
      Origin = 'tel'
      Size = 15
    end
    object UserLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'login'
      Required = True
      Size = 50
    end
    object UserSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'senha'
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
      'INSERT INTO sismaster.`user`'
      '(nome, cpf, rg, email, cel, tel, '
      '  login, senha)'
      
        'VALUES (:new_nome, :new_cpf, :new_rg, :new_email, :new_cel, :new' +
        '_tel, '
      '  :new_login, :new_senha)')
    ModifySQL.Strings = (
      'UPDATE sismaster.`user`'
      
        'SET nome = :new_nome, cpf = :new_cpf, rg = :new_rg, email = :new' +
        '_email, '
      
        '  cel = :new_cel, tel = :new_tel, login = :new_login, senha = :n' +
        'ew_senha'
      'WHERE id = :old_id')
    DeleteSQL.Strings = (
      'DELETE FROM sismaster.`user`'
      'WHERE id = :old_id')
    FetchRowSQL.Strings = (
      'SELECT id, nome, cpf, rg, email, cel, tel, login, senha'
      'FROM sismaster.`user`'
      'WHERE id = :old_id')
    Left = 427
    Top = 120
  end
end

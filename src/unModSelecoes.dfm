object dtSelecoes: TdtSelecoes
  Height = 530
  Width = 799
  object ConsProdutos: TFDQuery
    Connection = DMPrincipal.FireDacCon
    SQL.Strings = (
      
        'SELECT ID_PRODUTO, NOME_PRODUTO, PRECO_UNITARIO, ESTOQUE_DISPONI' +
        'VEL'
      '  FROM PRODUTOS'
      ' WHERE 1=1')
    Left = 168
    Top = 8
    object ConsProdutosID_PRODUTO: TFDAutoIncField
      FieldName = 'ID_PRODUTO'
      Origin = 'id_produto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsProdutosNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'nome_produto'
      Required = True
      Size = 255
    end
    object ConsProdutosPRECO_UNITARIO: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Origin = 'preco_unitario'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsProdutosESTOQUE_DISPONIVEL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE_DISPONIVEL'
      Origin = 'estoque_disponivel'
    end
  end
  object dsConsProdutos: TDataSource
    DataSet = ConsProdutos
    Left = 72
    Top = 88
  end
  object ConsClientes: TFDQuery
    Connection = DMPrincipal.FireDacCon
    SQL.Strings = (
      
        'SELECT ID_CLIENTE, NOME_COMPLETO, CPF_CNPJ, TELEFONE, EMAIL, END' +
        'ERECO_COMPLETO'
      '  FROM CLIENTES'
      '  WHERE 1=1')
    Left = 80
    Top = 8
    object ConsClientesID_CLIENTE: TFDAutoIncField
      FieldName = 'ID_CLIENTE'
      ReadOnly = True
    end
    object ConsClientesNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Required = True
      Size = 255
    end
    object ConsClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Required = True
      Size = 18
    end
    object ConsClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object ConsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object ConsClientesENDERECO_COMPLETO: TStringField
      FieldName = 'ENDERECO_COMPLETO'
      Size = 255
    end
  end
  object dsConsClientes: TDataSource
    DataSet = ConsClientes
    Left = 168
    Top = 80
  end
  object ConsUser: TFDQuery
    Connection = DMPrincipal.FireDacCon
    SQL.Strings = (
      
        'SELECT ID, NOME, CPF, RG, EMAIL, CEL, TEL, LOGIN, SENHA, ADMINIS' +
        'TRADOR'
      '  FROM USER'
      ' WHERE (LOGIN = :LOGIN OR :LOGIN = '#39'?'#39')')
    Left = 104
    Top = 200
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object ConsUserID: TFDAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object ConsUserNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object ConsUserCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 11
    end
    object ConsUserRG: TStringField
      FieldName = 'RG'
    end
    object ConsUserEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object ConsUserCEL: TStringField
      FieldName = 'CEL'
      Size = 15
    end
    object ConsUserTEL: TStringField
      FieldName = 'TEL'
      Size = 15
    end
    object ConsUserLOGIN: TStringField
      FieldName = 'LOGIN'
      Required = True
      Size = 50
    end
    object ConsUserSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
      Size = 100
    end
    object ConsUserADMINISTRADOR: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'ADMINISTRADOR'
      Origin = 'administrador'
    end
  end
  object dsConsUser: TDataSource
    DataSet = ConsUser
    Left = 176
    Top = 200
  end
  object ConsVendas: TFDQuery
    Connection = DMPrincipal.FireDacCon
    SQL.Strings = (
      'SELECT ID_VENDA, ID_CLIENTE, DATA_VENDA, TOTAL_VENDA,  '
      
        '(SELECT NOME_COMPLETO FROM CLIENTES WHERE CLIENTES.ID_CLIENTE = ' +
        'VENDAS.ID_CLIENTE) AS NOME_COMPLETO'
      'FROM VENDAS'
      'WHERE 1=1 ')
    Left = 259
    Top = 4
    object ConsVendasID_VENDA: TFDAutoIncField
      FieldName = 'ID_VENDA'
      Origin = 'id_venda'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsVendasID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'id_cliente'
      Required = True
    end
    object ConsVendasDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
      Origin = 'data_venda'
      Required = True
    end
    object ConsVendasTOTAL_VENDA: TBCDField
      FieldName = 'TOTAL_VENDA'
      Origin = 'total_venda'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsVendasNOME_COMPLETO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_COMPLETO'
      Origin = 'NOME_COMPLETO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
  end
  object dsConsVendas: TDataSource
    DataSet = ConsVendas
    Left = 259
    Top = 84
  end
  object ConsVendasItens: TFDQuery
    IndexFieldNames = 'ID_VENDA'
    MasterSource = dsConsVendas
    MasterFields = 'ID_VENDA'
    Connection = DMPrincipal.FireDacCon
    SQL.Strings = (
      
        'SELECT ID_ITEM, ID_VENDA, ID_PRODUTO, QUANTIDADE, VALOR_UNITARIO' +
        ', SUBTOTAL,'
      
        '  (SELECT NOME_PRODUTO FROM PRODUTOS WHERE PRODUTOS.ID_PRODUTO =' +
        ' ITENS_VENDA.ID_PRODUTO) AS NOME_PRODUTO'
      'FROM ITENS_VENDA'
      'WHERE 1=1;')
    Left = 328
    Top = 168
    object ConsVendasItensID_ITEM: TFDAutoIncField
      FieldName = 'ID_ITEM'
      Origin = 'id_item'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsVendasItensID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'id_venda'
      Required = True
    end
    object ConsVendasItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'id_produto'
      Required = True
    end
    object ConsVendasItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'quantidade'
      Required = True
    end
    object ConsVendasItensVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'valor_unitario'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsVendasItensSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'subtotal'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsVendasItensNOME_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
  end
  object dsConsVendasItens: TDataSource
    DataSet = ConsVendasItens
    Left = 328
    Top = 232
  end
  object ConsInsereVendasItens: TFDQuery
    Connection = DMPrincipal.FireDacCon
    SQL.Strings = (
      
        'SELECT ID_ITEM, ID_VENDA, ID_PRODUTO, QUANTIDADE, VALOR_UNITARIO' +
        ', SUBTOTAL,'
      
        '  (SELECT NOME_PRODUTO FROM PRODUTOS WHERE PRODUTOS.ID_PRODUTO =' +
        ' ITENS_VENDA.ID_PRODUTO) AS NOME_PRODUTO'
      'FROM ITENS_VENDA'
      'WHERE 1=1;')
    Left = 595
    Top = 156
    object ConsInsereVendasItensID_ITEM: TFDAutoIncField
      FieldName = 'ID_ITEM'
      Origin = 'id_item'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsInsereVendasItensID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'id_venda'
      Required = True
    end
    object ConsInsereVendasItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'id_produto'
      Required = True
    end
    object ConsInsereVendasItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'quantidade'
      Required = True
    end
    object ConsInsereVendasItensVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'valor_unitario'
      Required = True
      Precision = 10
      Size = 2
    end
    object ConsInsereVendasItensSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'subtotal'
      Required = True
      Precision = 10
      Size = 2
    end
    object ConsInsereVendasItensNOME_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
  end
  object dsConsInsereVendasItens: TDataSource
    DataSet = ConsInsereVendasItens
    Left = 595
    Top = 220
  end
end

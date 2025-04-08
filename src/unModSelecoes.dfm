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
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsProdutosNOME_PRODUTO: TWideStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      Required = True
      Size = 255
    end
    object ConsProdutosPRECO_UNITARIO: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Origin = 'PRECO_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsProdutosESTOQUE_DISPONIVEL: TIntegerField
      FieldName = 'ESTOQUE_DISPONIVEL'
      Origin = 'ESTOQUE_DISPONIVEL'
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
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsClientesNOME_COMPLETO: TWideStringField
      FieldName = 'NOME_COMPLETO'
      Origin = 'NOME_COMPLETO'
      Required = True
      Size = 255
    end
    object ConsClientesCPF_CNPJ: TWideStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      Size = 18
    end
    object ConsClientesTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
    object ConsClientesEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object ConsClientesENDERECO_COMPLETO: TWideStringField
      FieldName = 'ENDERECO_COMPLETO'
      Origin = 'ENDERECO_COMPLETO'
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
      '  FROM [USER]'
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
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsUserNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object ConsUserCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      FixedChar = True
      Size = 11
    end
    object ConsUserRG: TWideStringField
      FieldName = 'RG'
      Origin = 'RG'
    end
    object ConsUserEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object ConsUserCEL: TWideStringField
      FieldName = 'CEL'
      Origin = 'CEL'
      Size = 15
    end
    object ConsUserTEL: TWideStringField
      FieldName = 'TEL'
      Origin = 'TEL'
      Size = 15
    end
    object ConsUserLOGIN: TWideStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
      Size = 50
    end
    object ConsUserSENHA: TWideStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
    object ConsUserADMINISTRADOR: TBooleanField
      FieldName = 'ADMINISTRADOR'
      Origin = 'ADMINISTRADOR'
      Required = True
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
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsVendasID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object ConsVendasDATA_VENDA: TSQLTimeStampField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
      Required = True
    end
    object ConsVendasTOTAL_VENDA: TBCDField
      FieldName = 'TOTAL_VENDA'
      Origin = 'TOTAL_VENDA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsVendasNOME_COMPLETO: TWideStringField
      FieldName = 'NOME_COMPLETO'
      Origin = 'NOME_COMPLETO'
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
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsVendasItensID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      Required = True
    end
    object ConsVendasItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object ConsVendasItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object ConsVendasItensVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsVendasItensSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsVendasItensNOME_PRODUTO: TWideStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
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
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ConsInsereVendasItensID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      Required = True
    end
    object ConsInsereVendasItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object ConsInsereVendasItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object ConsInsereVendasItensVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsInsereVendasItensSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ConsInsereVendasItensNOME_PRODUTO: TWideStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
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

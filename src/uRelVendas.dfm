object frmRelVendas: TfrmRelVendas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Rel'#225'torio de Vendas'
  ClientHeight = 196
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 196
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 486
    ExplicitHeight = 195
    object gpbBotoes: TGroupBox
      Left = 1
      Top = 155
      Width = 488
      Height = 40
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 154
      ExplicitWidth = 484
      object btnImprimir: TBitBtn
        Left = 184
        Top = 6
        Width = 105
        Height = 30
        Caption = '&Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F0030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF9F9F9F3F3F3F3F3F3F3F
          3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000003F3F3F3F3F3F3F3F3F3F3F3F
          3F3F3F3F3F3F0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF9F9F9F3F3F3F3F3F3F1F1F
          1F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000001F1F1F3F3F3F3F
          3F3F9F9F9FFFFFFF0000FFFFFF7F7F7F000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000007F7F7FFFFFFF
          0000FFFFFF7F7F7F0000000000000000000000007F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F0000000000000000000000007F7F7FFFFFFF0000FFFFFF7F7F7F
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000007F7F7FFFFFFF0000FFFFFF8080800000000000000000
          00000000000000000000000000000000000000000000000000616161DCDCDC00
          0000808080FFFFFF0000FFFFFFA7A7A700000000000000000000000000000000
          0000000000000000000000000000000000242424616161000000A8A8A8FFFFFF
          0000FFFFFFFDFDFD6A6A6A090909000000000000000000000000000000000000
          0000000000000000000000000808086A6A6AFDFDFDFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF7F7F
          7F0000000000000000000000000000000000000000000000007F7F7FFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000000000
          00000000000000000000000000000000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFF9F9F9F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
          3F3F3F3F3F3F3F3F3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
        ParentFont = False
        TabOrder = 0
        OnClick = btnImprimirClick
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 488
      Height = 154
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 484
      ExplicitHeight = 153
      object gpbPeriodo: TGroupBox
        Left = 10
        Top = 2
        Width = 225
        Height = 45
        Caption = 'Per'#237'odo'
        TabOrder = 0
        object lblA: TLabel
          Left = 108
          Top = 21
          Width = 7
          Height = 13
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtPeriodoInicio: TDateTimePicker
          Left = 6
          Top = 17
          Width = 91
          Height = 23
          Date = 45736.000000000000000000
          Time = 0.684087025460030400
          TabOrder = 0
        end
        object edtPeriodoFim: TDateTimePicker
          Left = 126
          Top = 17
          Width = 91
          Height = 23
          Date = 45777.000000000000000000
          Time = 0.684087025460030400
          TabOrder = 1
        end
      end
      object gpbProduto: TGroupBox
        Left = 10
        Top = 53
        Width = 471
        Height = 44
        Caption = 'Produto ( F9 Consulta Produto/Mercadoria )'
        TabOrder = 1
        object btnConsProduto: TSpeedButton
          Left = 435
          Top = 15
          Width = 31
          Height = 26
          Glyph.Data = {
            9E050000424D9E05000000000000360400002800000012000000120000000100
            08000000000068010000120B0000120B00000001000000000000000000000101
            0100020202000303030004040400050505000606060007070700080808000909
            09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
            1100121212001313130014141400151515001616160017171700181818001919
            19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
            2100222222002323230024242400252525002626260027272700282828002929
            29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
            3100323232003333330034343400353535003636360037373700383838003939
            39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
            4100424242004343430044444400454545004646460047474700484848004949
            49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
            5100525252005353530054545400555555005656560057575700585858005959
            59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
            6100626262006363630064646400656565006666660067676700686868006969
            69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
            7100727272007373730074747400757575007676760077777700787878007979
            79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
            8100828282008383830084848400858585008686860087878700888888008989
            89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
            9100929292009393930094949400959595009696960097979700989898009999
            99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
            A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
            A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
            B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
            B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
            C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
            C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
            D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
            D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
            E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
            E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
            F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
            F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFE0FFFFFF0000FFFFFFFFFFFFFFFFFFFF
            FFFFFF6413E0FFFF0000FFFFFFFFFFFFFFFFFFFFFFFF630064FFFFFF0000FFFF
            FFFFFFFFFFFFFFFFFF620063FFFFFFFF0000FFFFFFFFC64A0D0737A6910062FF
            FFFFFFFF0000FFFFFF9F021A6C752F001491FFFFFFFFFFFF0000FFFFDA0647F4
            FFFFFE7A00A6FFFFFFFFFFFF0000FFFF7407E9FFFFFFFFFF2F37FFFFFFFFFFFF
            0000FFFF4637FFFFFFFFFFFF7507FFFFFFFFFFFF0000FFFF4C2BFFFFFFFFFFFF
            6C0DFFFFFFFFFFFF0000FFFF8801CEFFFFFFFFFF1A4AFFFFFFFFFFFF0000FFFF
            FF1721CEFFFFE94702C6FFFFFFFFFFFF0000FFFFFFCA17012B3707069FFFFFFF
            FFFFFFFF0000FFFFFFFFFF884C4674DAFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000}
          OnClick = btnConsProdutoClick
        end
        object edtCodigoProduto: TEdit
          Left = 6
          Top = 16
          Width = 57
          Height = 23
          TabOrder = 0
          OnExit = edtCodigoProdutoExit
          OnKeyDown = edtCodigoProdutoKeyDown
        end
        object edtNomeProduto: TEdit
          Left = 69
          Top = 16
          Width = 360
          Height = 23
          TabOrder = 1
        end
      end
      object gpbCliente: TGroupBox
        Left = 10
        Top = 98
        Width = 471
        Height = 44
        Caption = 'Cliente ( F9 Consulta Cliente )'
        TabOrder = 2
        object btnConsCliente: TSpeedButton
          Left = 435
          Top = 14
          Width = 31
          Height = 26
          Glyph.Data = {
            9E050000424D9E05000000000000360400002800000012000000120000000100
            08000000000068010000120B0000120B00000001000000000000000000000101
            0100020202000303030004040400050505000606060007070700080808000909
            09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
            1100121212001313130014141400151515001616160017171700181818001919
            19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
            2100222222002323230024242400252525002626260027272700282828002929
            29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
            3100323232003333330034343400353535003636360037373700383838003939
            39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
            4100424242004343430044444400454545004646460047474700484848004949
            49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
            5100525252005353530054545400555555005656560057575700585858005959
            59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
            6100626262006363630064646400656565006666660067676700686868006969
            69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
            7100727272007373730074747400757575007676760077777700787878007979
            79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
            8100828282008383830084848400858585008686860087878700888888008989
            89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
            9100929292009393930094949400959595009696960097979700989898009999
            99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
            A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
            A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
            B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
            B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
            C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
            C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
            D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
            D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
            E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
            E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
            F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
            F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFE0FFFFFF0000FFFFFFFFFFFFFFFFFFFF
            FFFFFF6413E0FFFF0000FFFFFFFFFFFFFFFFFFFFFFFF630064FFFFFF0000FFFF
            FFFFFFFFFFFFFFFFFF620063FFFFFFFF0000FFFFFFFFC64A0D0737A6910062FF
            FFFFFFFF0000FFFFFF9F021A6C752F001491FFFFFFFFFFFF0000FFFFDA0647F4
            FFFFFE7A00A6FFFFFFFFFFFF0000FFFF7407E9FFFFFFFFFF2F37FFFFFFFFFFFF
            0000FFFF4637FFFFFFFFFFFF7507FFFFFFFFFFFF0000FFFF4C2BFFFFFFFFFFFF
            6C0DFFFFFFFFFFFF0000FFFF8801CEFFFFFFFFFF1A4AFFFFFFFFFFFF0000FFFF
            FF1721CEFFFFE94702C6FFFFFFFFFFFF0000FFFFFFCA17012B3707069FFFFFFF
            FFFFFFFF0000FFFFFFFFFF884C4674DAFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000}
          OnClick = btnConsClienteClick
        end
        object edtNomeCliente: TEdit
          Left = 69
          Top = 16
          Width = 360
          Height = 23
          ReadOnly = True
          TabOrder = 0
        end
        object edtCodigoCliente: TEdit
          Left = 6
          Top = 16
          Width = 57
          Height = 23
          TabOrder = 1
          OnExit = edtCodigoClienteExit
          OnKeyDown = edtCodigoClienteKeyDown
        end
      end
    end
  end
  object frxRelVendas: TfrxReport
    Version = '2025.1.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42693.779731423600000000
    ReportOptions.LastChange = 45736.815774537000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '  '
      ''
      'begin'
      '  '
      'end.')
    Left = 449
    Top = 9
    Datasets = <
      item
        DataSet = frxVendas
        DataSetName = 'frxVendas'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'fTOTAL_GERAL'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 30.236240386962890000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE VENDAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoDate: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 578.488560000000000000
          Top = -15.118120000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object MemoTime: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 675.535870000000000000
          Top = -15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 19.897650000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = frxVendas
        DataSetName = 'frxVendas'
        RowCount = 0
        object frxDBDataset1Codigo: TfrxMemoView
          AllowVectorExport = True
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DATA_VENDA'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxVendas."DATA_VENDA"]')
        end
        object frxDBDataset1Data: TfrxMemoView
          AllowVectorExport = True
          Left = 69.811070000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'ID_VENDA'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxVendas."ID_VENDA"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 548.811380000000000000
          Top = 1.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'VALOR_UNITARIO'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxVendas."VALOR_UNITARIO"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 627.401980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'SUBTOTAL'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxVendas."SUBTOTAL"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 313.700990000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'PRODUTO'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxVendas."PRODUTO"]')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'ID_PRODUTO'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxVendas."ID_PRODUTO"]')
          ParentFont = False
        end
        object frxDBDataset1Valor: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'QUANTIDADE'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxVendas."QUANTIDADE"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 23.456710000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 3.779530000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 0.779530000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'TOTAL_VENDA'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxVendas."TOTAL_VENDA"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 42.354360000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        Condition = '<frxVendas."CLIENTE">'
        object Memo3: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 0.220470000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 0.220470000000000000
          Width = 574.488560000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'CLIENTE'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxVendas."CLIENTE"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 23.456710000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 12615680
          Memo.UTF8W = (
            'Data')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 23.456710000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 12615680
          Memo.UTF8W = (
            'N'#176' Venda')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 23.456710000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 12615680
          Memo.UTF8W = (
            'C'#243'd. Produto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 23.456710000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 12615680
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Unit'#225'rio')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 627.401980000000000000
          Top = 23.456710000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 12615680
          HAlign = haRight
          Memo.UTF8W = (
            'Sub Total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 23.456710000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 12615680
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 313.700990000000000000
          Top = 23.456710000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 12615680
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxVendas."ID_CLIENTE"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        object Memo23: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 12615680
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral de Vendas')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoPage: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina: [Page]')
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 22.677180000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'TOTAL_GERAL'
          DataSet = frxVendas
          DataSetName = 'frxVendas'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxVendas."TOTAL_GERAL"]')
          ParentFont = False
        end
      end
    end
  end
  object frxVendas: TfrxDBDataset
    UserName = 'frxVendas'
    CloseDataSource = False
    DataSet = Vendas
    BCDToCurrency = False
    DataSetOptions = []
    Left = 393
    Top = 9
  end
  object Vendas: TFDQuery
    Connection = DMPrincipal.FireDacCon
    SQL.Strings = (
      'SELECT '
      '    v.ID_VENDA, '
      '    v.DATA_VENDA, '
      '    v.TOTAL_VENDA, '
      '    C.ID_CLIENTE,'
      '    c.NOME_COMPLETO AS CLIENTE, '
      '    iv.ID_PRODUTO, '
      '    iv.QUANTIDADE, '
      '    iv.VALOR_UNITARIO, '
      '    iv.SUBTOTAL, '
      '    p.NOME_PRODUTO AS PRODUTO,'
      '    (SELECT SUM(v2.TOTAL_VENDA) '
      '     FROM Vendas v2'
      #9'WHERE v2.DATA_VENDA BETWEEN :DataInicio AND :DataFim '
      #9'  AND (:Cliente = 9999 OR v2.ID_CLIENTE = :Cliente)'
      
        #9'  AND (:Produto = 9999 OR v2.ID_CLIENTE = :Produto)) AS TOTAL_G' +
        'ERAL'
      'FROM Vendas v'
      'JOIN Clientes c ON v.ID_CLIENTE = c.ID_CLIENTE'
      'JOIN Itens_Venda iv ON v.ID_VENDA = iv.ID_VENDA'
      'JOIN Produtos p ON iv.ID_PRODUTO = p.ID_PRODUTO'
      'WHERE v.DATA_VENDA BETWEEN :DataInicio AND :DataFim '
      '  AND (:Cliente = 9999 OR v.ID_CLIENTE = :Cliente)'
      '  AND (:Produto = 9999 OR iv.ID_PRODUTO = :Produto)'
      '')
    Left = 419
    Top = 142
    ParamData = <
      item
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object VendasID_VENDA: TFDAutoIncField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
    object VendasID_CLIENTE: TFDAutoIncField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ReadOnly = True
    end
    object VendasCLIENTE: TWideStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Required = True
      Size = 255
    end
    object VendasID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object VendasQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object VendasVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object VendasSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object VendasPRODUTO: TWideStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
      Size = 255
    end
    object VendasTOTAL_GERAL: TFMTBCDField
      FieldName = 'TOTAL_GERAL'
      Origin = 'TOTAL_GERAL'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 38
      Size = 2
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 323
    Top = 14
  end
  object dsVendas: TDataSource
    DataSet = Vendas
    Left = 363
    Top = 150
  end
end

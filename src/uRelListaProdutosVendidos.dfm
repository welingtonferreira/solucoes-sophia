object frmRelListaProdutosVendidos: TfrmRelListaProdutosVendidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Rel'#225'torio Listagem de Produtos Mais Vendidos'
  ClientHeight = 172
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
    Height = 172
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 486
    ExplicitHeight = 171
    object gpbBotoes: TGroupBox
      Left = 1
      Top = 131
      Width = 488
      Height = 40
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 130
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
      Height = 130
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 484
      ExplicitHeight = 129
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
    end
  end
  object frxRelListaProdutosVendidos: TfrxReport
    Version = '2025.1.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42693.779731423600000000
    ReportOptions.LastChange = 45737.945909004630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 449
    Top = 17
    Datasets = <
      item
        DataSet = frxProdutos
        DataSetName = 'frxProdutos'
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
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 52.913421630859380000
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
            'LISTAGEM DE PRODUTOS MAIS VENDIDOS')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoDate: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 578.488560000000000000
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
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = frxProdutos
        DataSetName = 'frxProdutos'
        RowCount = 0
        object frxDBDataset1Codigo: TfrxMemoView
          AllowVectorExport = True
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'ID_PRODUTO'
          DataSet = frxProdutos
          DataSetName = 'frxProdutos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxProdutos."ID_PRODUTO"]')
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'VALOR_TOTAL'
          DataSet = frxProdutos
          DataSetName = 'frxProdutos'
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
            '[frxProdutos."VALOR_TOTAL"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NOME_PRODUTO'
          DataSet = frxProdutos
          DataSetName = 'frxProdutos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxProdutos."NOME_PRODUTO"]')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NUM_VENDAS'
          DataSet = frxProdutos
          DataSetName = 'frxProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxProdutos."NUM_VENDAS"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 355.275820000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'QUANTIDADE_VENDIDA'
          DataSet = frxProdutos
          DataSetName = 'frxProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxProdutos."QUANTIDADE_VENDIDA"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 629.401980000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'ULTIMA_VENDA'
          DataSet = frxProdutos
          DataSetName = 'frxProdutos'
          DisplayFormat.FormatStr = 'dd/mm/yyyy hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxProdutos."ULTIMA_VENDA"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 457.323130000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'PRECO_UNITARIO'
          DataSet = frxProdutos
          DataSetName = 'frxProdutos'
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
            '[frxProdutos."PRECO_UNITARIO"]')
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
        Height = 3.779530000000000000
        Top = 241.889920000000000000
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
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        object MemoPage: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina: [Page]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677182440000000000
        Top = 94.488250000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 3.779532440000000000
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
        object Memo6: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 3.779532440000000000
          Width = 79.370130000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#176' de Vendas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 3.779532440000000000
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
            'Quantidade Vendida')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 3.779532440000000000
          Width = 86.929190000000000000
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
            'Valor Total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 3.779532440000000000
          Width = 204.094620000000000000
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
          Left = 631.181510000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            'Ultima Venda')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 457.323130000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
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
            'Pre'#231'o Unit'#225'rio')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Condition = '<frxProdutos."ID_PRODUTO">'
      end
    end
  end
  object frxProdutos: TfrxDBDataset
    UserName = 'frxProdutos'
    CloseDataSource = False
    DataSet = Produtos
    BCDToCurrency = False
    DataSetOptions = []
    Left = 369
    Top = 9
    FieldDefs = <
      item
        FieldName = 'ID_PRODUTO'
      end
      item
        FieldName = 'NOME_PRODUTO'
        FieldType = fftString
        Size = 255
      end
      item
        FieldName = 'NUM_VENDAS'
      end
      item
        FieldName = 'QUANTIDADE_VENDIDA'
      end
      item
        FieldName = 'VALOR_TOTAL'
      end
      item
        FieldName = 'PRIMEIRA_VENDA'
        FieldType = fftDateTime
      end
      item
        FieldName = 'ULTIMA_VENDA'
        FieldType = fftDateTime
      end
      item
        FieldName = 'PRECO_UNITARIO'
      end>
  end
  object Produtos: TFDQuery
    Connection = DMPrincipal.FireDacCon
    SQL.Strings = (
      'SELECT '
      '    p.ID_PRODUTO, '
      '    p.NOME_PRODUTO, '
      '    p.PRECO_UNITARIO,'
      
        '    COUNT(v.ID_VENDA) AS NUM_VENDAS,  -- N'#250'mero de vendas realiz' +
        'adas'
      
        '    SUM(iv.QUANTIDADE) AS QUANTIDADE_VENDIDA,  -- Total de unida' +
        'des vendidas'
      '    SUM(iv.SUBTOTAL) AS VALOR_TOTAL,  -- Total do valor gerado'
      
        '    MIN(v.DATA_VENDA) AS PRIMEIRA_VENDA,  -- Data da primeira ve' +
        'nda'
      '    MAX(v.DATA_VENDA) AS ULTIMA_VENDA  -- Data da '#250'ltima venda'
      ' FROM Itens_Venda iv'
      ' JOIN Produtos p ON iv.ID_PRODUTO = p.ID_PRODUTO'
      ' JOIN Vendas v ON iv.ID_VENDA = v.ID_VENDA    '
      'WHERE v.DATA_VENDA BETWEEN :DataInicio AND :DataFim'
      '  AND (:Produto = 9999 OR iv.ID_PRODUTO = :Produto)'
      'GROUP BY p.ID_PRODUTO, p.NOME_PRODUTO'
      
        'ORDER BY ID_PRODUTO DESC;  -- Ordenar pela quantidade vendida, d' +
        'o maior para o menor')
    Left = 427
    Top = 78
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
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object ProdutosID_PRODUTO: TFDAutoIncField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ReadOnly = True
    end
    object ProdutosNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      Required = True
      Size = 255
    end
    object ProdutosNUM_VENDAS: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NUM_VENDAS'
      Origin = 'NUM_VENDAS'
    end
    object ProdutosQUANTIDADE_VENDIDA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE_VENDIDA'
      Origin = 'QUANTIDADE_VENDIDA'
      Precision = 32
      Size = 0
    end
    object ProdutosVALOR_TOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 32
      Size = 2
    end
    object ProdutosPRIMEIRA_VENDA: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'PRIMEIRA_VENDA'
      Origin = 'PRIMEIRA_VENDA'
    end
    object ProdutosULTIMA_VENDA: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'ULTIMA_VENDA'
      Origin = 'ULTIMA_VENDA'
    end
    object ProdutosPRECO_UNITARIO: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Origin = 'PRECO_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
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
    Left = 283
    Top = 14
  end
  object dsProdutos: TDataSource
    DataSet = Produtos
    Left = 347
    Top = 70
  end
end

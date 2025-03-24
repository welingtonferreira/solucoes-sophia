object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastrar'
  ClientHeight = 615
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 615
    Align = alClient
    BevelOuter = bvNone
    Color = 16119285
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 554
    ExplicitHeight = 614
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 95
      Height = 17
      Caption = 'Dados Pessoais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 40
      Top = 64
      Width = 465
      Height = 49
      Brush.Style = bsClear
      Pen.Color = clSilver
    end
    object Shape2: TShape
      Left = 40
      Top = 136
      Width = 217
      Height = 49
      Brush.Style = bsClear
      Pen.Color = clSilver
    end
    object Shape3: TShape
      Left = 288
      Top = 136
      Width = 217
      Height = 49
      Brush.Style = bsClear
      Pen.Color = clSilver
    end
    object Shape4: TShape
      Left = 40
      Top = 208
      Width = 465
      Height = 49
      Brush.Style = bsClear
      Pen.Color = clSilver
    end
    object Shape5: TShape
      Left = 40
      Top = 280
      Width = 217
      Height = 49
      Brush.Style = bsClear
      Pen.Color = clSilver
    end
    object Shape6: TShape
      Left = 288
      Top = 280
      Width = 217
      Height = 49
      Brush.Style = bsClear
      Pen.Color = clSilver
    end
    object Shape7: TShape
      Left = 40
      Top = 362
      Width = 465
      Height = 1
      Brush.Style = bsClear
      Pen.Color = clSilver
      Pen.Style = psDot
    end
    object Label2: TLabel
      Left = 40
      Top = 384
      Width = 104
      Height = 17
      Caption = 'Dados de Acesso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape8: TShape
      Left = 40
      Top = 496
      Width = 217
      Height = 49
      Brush.Style = bsClear
      Pen.Color = clSilver
    end
    object Shape9: TShape
      Left = 288
      Top = 496
      Width = 217
      Height = 49
      Brush.Style = bsClear
      Pen.Color = clSilver
    end
    object Shape10: TShape
      Left = 40
      Top = 424
      Width = 217
      Height = 49
      Brush.Style = bsClear
      Pen.Color = clSilver
    end
    object Shape11: TShape
      Left = 376
      Top = 571
      Width = 129
      Height = 34
      Brush.Color = 6530786
      Pen.Style = psClear
    end
    object btnSalvar: TSpeedButton
      Left = 375
      Top = 569
      Width = 130
      Height = 35
      Caption = 'Salvar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnSalvarClick
    end
    object Shape12: TShape
      Left = 40
      Top = 570
      Width = 129
      Height = 34
      Brush.Style = bsClear
      Pen.Color = 10225193
    end
    object btnFechar: TSpeedButton
      Left = 40
      Top = 569
      Width = 130
      Height = 35
      Caption = 'Fechar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10225193
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnFecharClick
    end
    object edtNome: TEdit
      Left = 48
      Top = 80
      Width = 449
      Height = 25
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TextHint = 'Nome'
    end
    object edtCPF: TEdit
      Left = 48
      Top = 154
      Width = 201
      Height = 25
      BorderStyle = bsNone
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      TextHint = 'CPF'
    end
    object edtRG: TEdit
      Left = 296
      Top = 154
      Width = 201
      Height = 25
      BorderStyle = bsNone
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TextHint = 'RG'
    end
    object edtEmail: TEdit
      Left = 48
      Top = 224
      Width = 449
      Height = 25
      BorderStyle = bsNone
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TextHint = 'Email'
    end
    object edtCelular: TEdit
      Left = 48
      Top = 296
      Width = 201
      Height = 25
      BorderStyle = bsNone
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      TextHint = 'Celular'
    end
    object edtTelefone: TEdit
      Left = 296
      Top = 297
      Width = 201
      Height = 25
      BorderStyle = bsNone
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      TextHint = 'Telefone'
    end
    object edtSenha: TEdit
      Left = 48
      Top = 513
      Width = 201
      Height = 25
      BorderStyle = bsNone
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 1
      TextHint = 'Senha'
    end
    object edtConfirmarSenha: TEdit
      Left = 296
      Top = 513
      Width = 201
      Height = 25
      BorderStyle = bsNone
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 2
      TextHint = 'Confirme sua senha'
    end
    object edtLogin: TEdit
      Left = 48
      Top = 442
      Width = 201
      Height = 25
      BorderStyle = bsNone
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'Login'
    end
  end
end

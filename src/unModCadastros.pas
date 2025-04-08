unit unModCadastros;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtCadastros = class(TDataModule)
    Produtos: TFDQuery;
    dsProdutos: TDataSource;
    Clientes: TFDQuery;
    dsClientes: TDataSource;
    upProdutos: TFDUpdateSQL;
    upClientes: TFDUpdateSQL;
    Vendas: TFDQuery;
    dsVendas: TDataSource;
    upVendas: TFDUpdateSQL;
    ItensVendas: TFDQuery;
    dsItensVendas: TDataSource;
    upItensVendas: TFDUpdateSQL;
    User: TFDQuery;
    dsUser: TDataSource;
    upUser: TFDUpdateSQL;
    ClientesID_CLIENTE: TFDAutoIncField;
    ClientesNOME_COMPLETO: TWideStringField;
    ClientesCPF_CNPJ: TWideStringField;
    ClientesTELEFONE: TWideStringField;
    ClientesEMAIL: TWideStringField;
    ClientesENDERECO_COMPLETO: TWideStringField;
    ProdutosID_PRODUTO: TFDAutoIncField;
    ProdutosNOME_PRODUTO: TWideStringField;
    ProdutosPRECO_UNITARIO: TBCDField;
    ProdutosESTOQUE_DISPONIVEL: TIntegerField;
    VendasID_VENDA: TFDAutoIncField;
    VendasID_CLIENTE: TIntegerField;
    VendasDATA_VENDA: TSQLTimeStampField;
    VendasTOTAL_VENDA: TBCDField;
    ItensVendasID_ITEM: TFDAutoIncField;
    ItensVendasID_VENDA: TIntegerField;
    ItensVendasID_PRODUTO: TIntegerField;
    ItensVendasQUANTIDADE: TIntegerField;
    ItensVendasVALOR_UNITARIO: TBCDField;
    ItensVendasSUBTOTAL: TBCDField;
    UserID: TFDAutoIncField;
    UserNOME: TWideStringField;
    UserCPF: TStringField;
    UserRG: TWideStringField;
    UserEMAIL: TWideStringField;
    UserCEL: TWideStringField;
    UserTEL: TWideStringField;
    UserLOGIN: TWideStringField;
    UserSENHA: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtCadastros: TdtCadastros;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  unModPrincipal, unModSelecoes;


end.

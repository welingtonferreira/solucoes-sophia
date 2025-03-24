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
    VendasID_VENDA: TFDAutoIncField;
    VendasID_CLIENTE: TIntegerField;
    VendasDATA_VENDA: TDateTimeField;
    VendasTOTAL_VENDA: TBCDField;
    ItensVendas: TFDQuery;
    dsItensVendas: TDataSource;
    upItensVendas: TFDUpdateSQL;
    ItensVendasID_ITEM: TFDAutoIncField;
    ItensVendasID_VENDA: TIntegerField;
    ItensVendasID_PRODUTO: TIntegerField;
    ItensVendasQUANTIDADE: TIntegerField;
    ItensVendasVALOR_UNITARIO: TBCDField;
    ItensVendasSUBTOTAL: TBCDField;
    ProdutosID_PRODUTO: TFDAutoIncField;
    ProdutosNOME_PRODUTO: TStringField;
    ProdutosPRECO_UNITARIO: TBCDField;
    ProdutosESTOQUE_DISPONIVEL: TIntegerField;
    ClientesID_CLIENTE: TFDAutoIncField;
    ClientesNOME_COMPLETO: TStringField;
    ClientesCPF_CNPJ: TStringField;
    ClientesTELEFONE: TStringField;
    ClientesEMAIL: TStringField;
    ClientesENDERECO_COMPLETO: TStringField;
    User: TFDQuery;
    dsUser: TDataSource;
    upUser: TFDUpdateSQL;
    UserID: TFDAutoIncField;
    UserNOME: TStringField;
    UserCPF: TStringField;
    UserRG: TStringField;
    UserEMAIL: TStringField;
    UserCEL: TStringField;
    UserTEL: TStringField;
    UserLOGIN: TStringField;
    UserSENHA: TStringField;
    ItensVendasVIRTUAL_NOME_PRODUTO: TStringField;
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

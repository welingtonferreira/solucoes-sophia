unit unModSelecoes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtSelecoes = class(TDataModule)
    ConsProdutos: TFDQuery;
    dsConsProdutos: TDataSource;
    ConsClientes: TFDQuery;
    dsConsClientes: TDataSource;
    ConsUser: TFDQuery;
    dsConsUser: TDataSource;
    ConsUserID: TFDAutoIncField;
    ConsUserNOME: TStringField;
    ConsUserCPF: TStringField;
    ConsUserRG: TStringField;
    ConsUserEMAIL: TStringField;
    ConsUserCEL: TStringField;
    ConsUserTEL: TStringField;
    ConsUserLOGIN: TStringField;
    ConsUserSENHA: TStringField;
    ConsClientesID_CLIENTE: TFDAutoIncField;
    ConsClientesNOME_COMPLETO: TStringField;
    ConsClientesCPF_CNPJ: TStringField;
    ConsClientesTELEFONE: TStringField;
    ConsClientesEMAIL: TStringField;
    ConsClientesENDERECO_COMPLETO: TStringField;
    ConsProdutosID_PRODUTO: TFDAutoIncField;
    ConsProdutosNOME_PRODUTO: TStringField;
    ConsProdutosPRECO_UNITARIO: TBCDField;
    ConsProdutosESTOQUE_DISPONIVEL: TIntegerField;
    ConsVendas: TFDQuery;
    dsConsVendas: TDataSource;
    ConsVendasID_VENDA: TFDAutoIncField;
    ConsVendasID_CLIENTE: TIntegerField;
    ConsVendasDATA_VENDA: TDateTimeField;
    ConsVendasTOTAL_VENDA: TBCDField;
    ConsVendasNOME_COMPLETO: TStringField;
    ConsVendasItens: TFDQuery;
    dsConsVendasItens: TDataSource;
    ConsVendasItensID_ITEM: TFDAutoIncField;
    ConsVendasItensID_VENDA: TIntegerField;
    ConsVendasItensID_PRODUTO: TIntegerField;
    ConsVendasItensQUANTIDADE: TIntegerField;
    ConsVendasItensVALOR_UNITARIO: TBCDField;
    ConsVendasItensSUBTOTAL: TBCDField;
    ConsVendasItensNOME_PRODUTO: TStringField;
    ConsInsereVendasItens: TFDQuery;
    dsConsInsereVendasItens: TDataSource;
    ConsInsereVendasItensID_ITEM: TFDAutoIncField;
    ConsInsereVendasItensID_VENDA: TIntegerField;
    ConsInsereVendasItensID_PRODUTO: TIntegerField;
    ConsInsereVendasItensQUANTIDADE: TIntegerField;
    ConsInsereVendasItensVALOR_UNITARIO: TBCDField;
    ConsInsereVendasItensSUBTOTAL: TBCDField;
    ConsInsereVendasItensNOME_PRODUTO: TStringField;
    ConsUserADMINISTRADOR: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtSelecoes: TdtSelecoes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  unModPrincipal;


end.

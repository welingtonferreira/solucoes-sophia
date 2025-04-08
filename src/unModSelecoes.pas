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
    ConsVendas: TFDQuery;
    dsConsVendas: TDataSource;
    ConsVendasItens: TFDQuery;
    dsConsVendasItens: TDataSource;
    ConsInsereVendasItens: TFDQuery;
    dsConsInsereVendasItens: TDataSource;
    ConsClientesID_CLIENTE: TFDAutoIncField;
    ConsClientesNOME_COMPLETO: TWideStringField;
    ConsClientesCPF_CNPJ: TWideStringField;
    ConsClientesTELEFONE: TWideStringField;
    ConsClientesEMAIL: TWideStringField;
    ConsClientesENDERECO_COMPLETO: TWideStringField;
    ConsProdutosID_PRODUTO: TFDAutoIncField;
    ConsProdutosNOME_PRODUTO: TWideStringField;
    ConsProdutosPRECO_UNITARIO: TBCDField;
    ConsProdutosESTOQUE_DISPONIVEL: TIntegerField;
    ConsVendasID_VENDA: TFDAutoIncField;
    ConsVendasID_CLIENTE: TIntegerField;
    ConsVendasDATA_VENDA: TSQLTimeStampField;
    ConsVendasTOTAL_VENDA: TBCDField;
    ConsVendasNOME_COMPLETO: TWideStringField;
    ConsUserID: TFDAutoIncField;
    ConsUserNOME: TWideStringField;
    ConsUserCPF: TStringField;
    ConsUserRG: TWideStringField;
    ConsUserEMAIL: TWideStringField;
    ConsUserCEL: TWideStringField;
    ConsUserTEL: TWideStringField;
    ConsUserLOGIN: TWideStringField;
    ConsUserSENHA: TWideStringField;
    ConsUserADMINISTRADOR: TBooleanField;
    ConsInsereVendasItensID_ITEM: TFDAutoIncField;
    ConsInsereVendasItensID_VENDA: TIntegerField;
    ConsInsereVendasItensID_PRODUTO: TIntegerField;
    ConsInsereVendasItensQUANTIDADE: TIntegerField;
    ConsInsereVendasItensVALOR_UNITARIO: TBCDField;
    ConsInsereVendasItensSUBTOTAL: TBCDField;
    ConsInsereVendasItensNOME_PRODUTO: TWideStringField;
    ConsVendasItensID_ITEM: TFDAutoIncField;
    ConsVendasItensID_VENDA: TIntegerField;
    ConsVendasItensID_PRODUTO: TIntegerField;
    ConsVendasItensQUANTIDADE: TIntegerField;
    ConsVendasItensVALOR_UNITARIO: TBCDField;
    ConsVendasItensSUBTOTAL: TBCDField;
    ConsVendasItensNOME_PRODUTO: TWideStringField;
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

unit bkp_unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    btnClientes: TBitBtn;
    btnProdutos: TBitBtn;
    btnPedidosVenda: TBitBtn;
    btnFinalizar: TBitBtn;
    btnRelVendas: TBitBtn;
    btnParametros: TBitBtn;
    btnRelProdutos: TBitBtn;
    mnPrincipal: TMainMenu;
    mnCadastro: TMenuItem;
    mniCadastroCliente: TMenuItem;
    N25: TMenuItem;
    mniProduto: TMenuItem;
    N35: TMenuItem;
    mniCadastroParametros: TMenuItem;
    N4: TMenuItem;
    mniCadastroUsuario: TMenuItem;
    mniControleAcessoUsuario: TMenuItem;
    N31: TMenuItem;
    mnLancamento: TMenuItem;
    pmiVendaProdutos: TMenuItem;
    N19: TMenuItem;
    mnImpressao: TMenuItem;
    mniRelatorioVendas: TMenuItem;
    N28: TMenuItem;
    mniProdutosVendidos: TMenuItem;
    N18: TMenuItem;
    mniRelatorioEstoqueProdutos: TMenuItem;
    mniAjuda: TMenuItem;
    mniSobre: TMenuItem;
    N9: TMenuItem;
    mniSair: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Application.Terminate;
end;

procedure TfrmPrincipal.btnFinalizarClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

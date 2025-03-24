unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Mask, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Menus, Vcl.ComCtrls, Grids, DBGrids, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Themes, DB;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    btnClientes: TSpeedButton;
    btnVendas: TSpeedButton;
    Panel7: TPanel;
    Panel10: TPanel;
    Panel8: TPanel;
    Panel3: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel6: TPanel;
    Timer1: TTimer;
    Panel5: TPanel;
    btnProdutos: TSpeedButton;
    Panel4: TPanel;
    Panel2: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    btnSair: TSpeedButton;
    StatusBar1: TStatusBar;
    Panel14: TPanel;
    Panel15: TPanel;
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
    mniVendas: TMenuItem;
    N28: TMenuItem;
    mniProdutosVendidos: TMenuItem;
    N18: TMenuItem;
    mniRelatorioEstoqueProdutos: TMenuItem;
    mniAjuda: TMenuItem;
    mniSobre: TMenuItem;
    N9: TMenuItem;
    mniSair: TMenuItem;
    Image1: TImage;
    objectN18TMenuItem1: TMenuItem;
    mniRelatorioVendasClick: TMenuItem;
    RelatrioGrficodeVendas1: TMenuItem;
    mniRelatorioGraficoVendas: TMenuItem;
    procedure btnClientesClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure mniCadastroClienteClick(Sender: TObject);
    procedure mniProdutoClick(Sender: TObject);
    procedure pmiVendaProdutosClick(Sender: TObject);
    procedure mniProdutosVendidosClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mniCadastroParametrosClick(Sender: TObject);
    procedure mniSobreClick(Sender: TObject);
    procedure mniControleAcessoUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniSairClick(Sender: TObject);
    procedure mniRelatorioEstoqueProdutosClick(Sender: TObject);
    procedure mniRelatorioGraficoVendasClick(Sender: TObject);
    procedure mniRelatorioVendasClickClick(Sender: TObject);
    procedure mniCadastroUsuarioClick(Sender: TObject);
  private
    procedure SincronizarMenuComPermissoes;
    procedure PercorrerMenu(MenuItem: TMenuItem);
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModCadastros, unModSelecoes, unCadastroClientes0, unCadastroProdutos0, unPedidosVenda0, unParametros,
  uRelListaProdutosVendidos, uRelVendas, uSobre, unControleAcesso, uRelEstoqueProdutos, uRelGraficoVendas0, uUtil;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Application.MainFormOnTaskbar := True;
  // Garantir que o formulário esteja maximizado
  WindowState := wsMaximized;
  BringToFront;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   if not GLOBAL_USER.ADMINISTRADOR then
     SincronizarMenuComPermissoes;

  mniControleAcessoUsuario.Enabled := GLOBAL_USER.ADMINISTRADOR;
end;

procedure TfrmPrincipal.mniCadastroClienteClick(Sender: TObject);
begin
  frmCadastroClientes0 := TfrmCadastroClientes0.Create(Self);
  frmCadastroClientes0.ShowModal;

  FreeAndNil(frmCadastroClientes0);
end;

procedure TfrmPrincipal.mniCadastroParametrosClick(Sender: TObject);
begin
  frmParametros := TfrmParametros.Create(Self);
  frmParametros.ShowModal;

  FreeAndNil(frmParametros);
end;

procedure TfrmPrincipal.mniCadastroUsuarioClick(Sender: TObject);
begin
  MsgBox('"Prezado Cliente"'#13'Módulo não disponivel no momento.', MB_OK + MB_ICONINFORMATION);
  Exit;
end;

procedure TfrmPrincipal.mniControleAcessoUsuarioClick(Sender: TObject);
begin
  frmControleAcesso := TfrmControleAcesso.Create(Self);
  frmControleAcesso.ShowModal;

  if not GLOBAL_USER.ADMINISTRADOR then
   SincronizarMenuComPermissoes;

  mniControleAcessoUsuario.Enabled := GLOBAL_USER.ADMINISTRADOR;
  FreeAndNil(frmControleAcesso);
end;

procedure TfrmPrincipal.mniProdutoClick(Sender: TObject);
begin
  frmCadastroProdutos0 := TfrmCadastroProdutos0.Create(Self);
  frmCadastroProdutos0.ShowModal;

  FreeAndNil(frmCadastroProdutos0);
end;

procedure TfrmPrincipal.mniProdutosVendidosClick(Sender: TObject);
begin
  frmRelListaProdutosVendidos := TfrmRelListaProdutosVendidos.Create(Self);
  frmRelListaProdutosVendidos.ShowModal;

  FreeAndNil(frmRelListaProdutosVendidos);
end;

procedure TfrmPrincipal.mniRelatorioEstoqueProdutosClick(Sender: TObject);
begin
  frmRelEstoqueProdutos := TfrmRelEstoqueProdutos.Create(Self);
  frmRelEstoqueProdutos.ShowModal;

  FreeAndNil(frmRelEstoqueProdutos);
end;

procedure TfrmPrincipal.mniRelatorioGraficoVendasClick(Sender: TObject);
begin
  frmRelGraficoVendas0 := TfrmRelGraficoVendas0.Create(Self);
  frmRelGraficoVendas0.ShowModal;

  FreeAndNil(frmRelGraficoVendas0);
end;

procedure TfrmPrincipal.mniRelatorioVendasClickClick(Sender: TObject);
begin
  frmRelVendas := TfrmRelVendas.Create(Self);
  frmRelVendas.ShowModal;

  FreeAndNil(frmRelVendas);
end;

procedure TfrmPrincipal.mniSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.mniSobreClick(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Self);
  frmSobre.ShowModal;

  FreeAndNil(frmSobre);
end;

procedure TfrmPrincipal.pmiVendaProdutosClick(Sender: TObject);
begin
  frmPedidosVenda0 := TfrmPedidosVenda0.Create(Self);
  frmPedidosVenda0.ShowModal;

  FreeAndNil(frmPedidosVenda0);
end;

procedure TfrmPrincipal.btnVendasClick(Sender: TObject);
begin
  pmiVendaProdutosClick(pmiVendaProdutos);
end;

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin
  mniCadastroClienteClick(mniCadastroCliente);
end;

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
  mniProdutoClick(mniProduto);
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  frmPrincipal.StatusBar1.Panels [0].Text := ' ' + DateToStr(Date); // para data
  frmPrincipal.StatusBar1.Panels [1].Text := ' ' + TimeToStr(Now);  //para hora
end;

procedure TfrmPrincipal.PercorrerMenu(MenuItem: TMenuItem);
var
  vQuery: TFDQuery;
  SubItem: TMenuItem;
  CodigoMenu: Integer;
  I: Integer;
  PermissaoCliente, PermissaoProduto, PermissaoVenda: Boolean; // Declarando as variáveis de permissão
begin
  // Inicializa as variáveis de permissão
  PermissaoCliente := False;
  PermissaoProduto := False;
  PermissaoVenda := False;

  // Criar a consulta para verificar permissões do menu
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := DMPrincipal.FireDacCon; // Definindo a conexão do FireDAC

    vQuery.Close;
    vQuery.SQL.Clear;
    vQuery.SQL.Text := 'SELECT codigo_menu, menu, permitir ' +
                       'FROM controle_acesso ' +
                       'WHERE id_usuario = :id_usuario';
    vQuery.ParamByName('id_usuario').AsInteger := GLOBAL_USER.ID_USUARIO; // ID do usuário
    vQuery.Open;


    // Verificar se o menu atual está no banco de dados
    if vQuery.Locate('menu', MenuItem.Name, [loCaseInsensitive]) then
    begin
      CodigoMenu := vQuery.FieldByName('codigo_menu').AsInteger;
      // Se permitir for 1, habilita o item, caso contrário desabilita
      if vQuery.FieldByName('permitir').AsInteger = 1 then
        MenuItem.Enabled := True
      else
        MenuItem.Enabled := False;

      // Validar se o usuário tem permissão específica para os botões
      if AnsiCompareText(MenuItem.Name, 'mniCadastroCliente') = 0 then
        PermissaoCliente := (vQuery.FieldByName('permitir').AsInteger = 1);

      if AnsiCompareText(MenuItem.Name, 'mniProduto') = 0 then
        PermissaoProduto := (vQuery.FieldByName('permitir').AsInteger = 1);

      if AnsiCompareText(MenuItem.Name, 'pmiVendaProdutos') = 0 then
        PermissaoVenda := (vQuery.FieldByName('permitir').AsInteger = 1);
    end;
  finally
    vQuery.Free;
  end;

  // Percorrer os itens de submenus usando um loop tradicional
  for I := 0 to MenuItem.Count - 1 do
  begin
    SubItem := MenuItem.Items[I];

    // Criar uma nova consulta para os submenus
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Connection := DMPrincipal.FireDacCon; // Definindo a conexão do FireDAC
      vQuery.Close;
      vQuery.SQL.Clear;
      vQuery.SQL.Text := 'SELECT codigo_menu, menu, permitir ' +
                         'FROM controle_acesso ' +
                         'WHERE id_usuario = :id_usuario';
      vQuery.ParamByName('id_usuario').AsInteger := GLOBAL_USER.ID_USUARIO; // ID do usuário
      vQuery.Open;

      // Verificar se o submenu está no banco de dados
      if vQuery.Locate('menu', SubItem.Name, [loCaseInsensitive]) then
      begin
        CodigoMenu := vQuery.FieldByName('codigo_menu').AsInteger;
        // Se permitir for 1, habilita o item, caso contrário desabilita
        if vQuery.FieldByName('permitir').AsInteger = 1 then
          SubItem.Enabled := True
        else
          SubItem.Enabled := False;

        // Validar se o usuário tem permissão específica para os submenus
        if AnsiCompareText(SubItem.Name, 'mniCadastroCliente') = 0 then
        begin
          PermissaoCliente := (vQuery.FieldByName('permitir').AsInteger = 1);
          btnClientes.Enabled := PermissaoCliente;
        end;

        if AnsiCompareText(SubItem.Name, 'mniProduto') = 0 then
        begin
          PermissaoProduto := (vQuery.FieldByName('permitir').AsInteger = 1);
          btnProdutos.Enabled := PermissaoProduto;
        end;

        if AnsiCompareText(SubItem.Name, 'pmiVendaProdutos') = 0 then
        begin
          PermissaoVenda := (vQuery.FieldByName('permitir').AsInteger = 1);
          btnVendas.Enabled := PermissaoVenda;
        end;
      end;
    finally
      vQuery.Free;
    end;

    // Chama a função recursivamente para submenus
    PercorrerMenu(SubItem);
  end;
end;

procedure TfrmPrincipal.SincronizarMenuComPermissoes;
var
  I: Integer;
  MenuItem: TMenuItem;
begin
  // Percorrer todos os itens de menu principais e subitens
  for I := 0 to mnPrincipal.Items.Count - 1 do
  begin
    MenuItem := mnPrincipal.Items[I];
    PercorrerMenu(MenuItem);  // Chama a função para percorrer todos os itens de menu e subitens
  end;
end;



end.

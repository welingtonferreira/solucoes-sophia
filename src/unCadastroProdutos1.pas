unit unCadastroProdutos1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB;

type
  TfrmCadastroProdutos1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Valor: TLabel;
    edtValor: TEdit;
    Label4: TLabel;
    edtEstoque: TEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    Fechar: Boolean;
    Cancelou: Boolean;
    function ValidarGravar: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProdutos1: TfrmCadastroProdutos1;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModCadastros, uUtil;

procedure TfrmCadastroProdutos1.btnCancelarClick(Sender: TObject);
begin
  if DMPrincipal.FireDacCon.InTransaction then
    RollBackRFD;

  with dtCadastros do
  begin
    Produtos.Cancel;
    Produtos.CancelUpdates;
  end;

  Self.Cancelou := True;
  Fechar := True;
  Self.Close;
end;

procedure TfrmCadastroProdutos1.btnGravarClick(Sender: TObject);
begin
  if (ValidarGravar) then
  begin
    with dtCadastros do
    begin
      try
        // Iniciar a transação
        DMPrincipal.FireTransCon.StartTransaction;

        Produtos.Edit;
        ProdutosNOME_PRODUTO.Value := edtDescricao.Text;
        ProdutosPRECO_UNITARIO.AsFloat := StrToFloat(edtValor.Text);
        ProdutosESTOQUE_DISPONIVEL.Value := StrToInt(edtEstoque.Text);
        Produtos.Post;

        if (Produtos.CachedUpdates) then
        begin
          AplicarDados(Produtos);
        end;

        edtCodigo.Clear;
        edtDescricao.Clear;
        edtValor.Clear;

        CommitRFD;
        Fechar := True;
        Self.Close;
      except
        on E: Exception do
        begin
          MsgBox('"Prezado Cliente"'#13'Não foi possível gravar o registro.' + #13, MB_OK + MB_ICONERROR);
          RollBackRFD;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadastroProdutos1.edtValorExit(Sender: TObject);
begin
  edtValor.Text := CurrToStrF(StrToCurrDef(Trim(edtValor.Text), 0), ffNumber, 2);
end;

procedure TfrmCadastroProdutos1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not Fechar then
  begin
    btnCancelar.OnClick(Sender);
    CanClose := Fechar;
  end;
end;

procedure TfrmCadastroProdutos1.FormShow(Sender: TObject);
begin
  with dtCadastros do
  begin
    if Produtos.State = dsEdit then
    begin
      edtCodigo.Text := IntToStr(ProdutosID_PRODUTO.Value);
      edtDescricao.Text := ProdutosNOME_PRODUTO.Value;
      edtValor.Text := FormatFloat('#,##0.00', ProdutosPRECO_UNITARIO.AsFloat);
      edtEstoque.Text := IntToStr(ProdutosESTOQUE_DISPONIVEL.Value);
    end;
  end;

  edtDescricao.SetFocus;
end;

function TfrmCadastroProdutos1.ValidarGravar: Boolean;
var
  Estoque: Integer;
begin
  Result := False;

  if Trim(edtDescricao.Text) = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'Descrição do produto deve ser informado.', MB_OK + MB_ICONINFORMATION);
    edtDescricao.SetFocus;
    Exit;
  end;

  if Trim(edtValor.Text) = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'Valor do produto deve ser informado.', MB_OK + MB_ICONINFORMATION);
    edtValor.SetFocus;
    Exit;
  end;

  // Verifica se o campo contém um número válido
  if TryStrToInt(edtEstoque.Text, Estoque) then
  begin
    // Verifica se o valor é negativo
    if Estoque < 0 then
    begin
      MsgBox('"Prezado Cliente"'#13'O valor do estoque não pode ser negativo.', MB_OK + MB_ICONINFORMATION);
      edtEstoque.SetFocus;
      Exit;
    end;
  end
  else
  begin
    MsgBox('"Prezado Cliente"'#13'Valor inválido. Insira um número inteiro.', MB_OK + MB_ICONINFORMATION);
    edtEstoque.SetFocus;
    Exit;
  end;

  Result := True;
end;

end.

unit unCadastroProdutos0;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Error, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Error, FireDAC.Comp.Client;

type
  TfrmCadastroProdutos0 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnRemover: TBitBtn;
    btnFechar: TBitBtn;
    gridProdutos: TDBGrid;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    btnPesquisar: TBitBtn;
    grpPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    DataSource1: TDataSource;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gridProdutosTitleClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridProdutosCellClick(Column: TColumn);
  private
    procedure Pesquisar(pSQL: String);
    { Private declarations }
  public
    sDefaultSQL: String;
    sFiltro: String;
    { Public declarations }
  end;

var
  frmCadastroProdutos0: TfrmCadastroProdutos0;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModSelecoes, unModCadastros, unCadastroProdutos1, uUtil;

procedure TfrmCadastroProdutos0.btnAlterarClick(Sender: TObject);
begin
  with dtCadastros do
  begin
    if (Produtos.RecordCount > 0) then
    begin
      Produtos.IndexFieldNames := 'ID_PRODUTO';
      if Produtos.FindKey([dtSelecoes.ConsProdutos.FieldByName('ID_PRODUTO').Value]) then
        Produtos.Edit;

      frmCadastroProdutos1 := TfrmCadastroProdutos1.Create(Self);
      frmCadastroProdutos1.ShowModal;
    end
    else
    begin
      MsgBox('"Prezado Cliente"'#13'Nenhum registro selecionado para alterar.', MB_OK + MB_ICONINFORMATION);
    end;
  end;

  Pesquisar(EmptyStr);
end;

procedure TfrmCadastroProdutos0.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroProdutos0.btnIncluirClick(Sender: TObject);
begin
  with dtCadastros do
  begin
    Produtos.Insert;
  end;

  frmCadastroProdutos1 := TfrmCadastroProdutos1.Create(Self);
  frmCadastroProdutos1.ShowModal;

  Pesquisar(EmptyStr);
end;

procedure TfrmCadastroProdutos0.btnPesquisarClick(Sender: TObject);
var
  Key: Word;
  Shift: TShiftState;
begin
  Key := VK_F5; // A tecla F5
  Shift := [];  // Nenhuma tecla modificadora, você pode ajustar conforme necessário
  FormKeyDown(Self, Key, Shift);
end;

procedure TfrmCadastroProdutos0.btnRemoverClick(Sender: TObject);
var
  vQuery: TFDQuery;
  IDProduto: Integer;
begin
  with dtCadastros do
  begin
    // Verificar se o DataSet não está vazio
    if not dtSelecoes.dsConsProdutos.DataSet.IsEmpty then
    begin
      // A partir deste momento, o DataSet já deve estar no registro correto devido ao OnCellClick
      IDProduto := dtSelecoes.dsConsProdutos.DataSet.FieldByName('ID_PRODUTO').AsInteger;

      // Confirmar exclusão
      if Messagedlg('Confirma excluir o produto: ' + dtSelecoes.dsConsProdutos.DataSet.FieldByName('NOME_PRODUTO').AsString + ' ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMPrincipal.FireTransCon.StartTransaction;
        try
          vQuery := TFDQuery.Create(nil);
          try
            vQuery.Close;
            vQuery.SQL.Clear;
            vQuery.Connection := DMPrincipal.FireDacCon; // Associe ao componente TFDConnection configurado no seu projeto
            vQuery.SQL.Text := 'DELETE FROM produtos WHERE id_produto = :id';
            vQuery.Params[0].AsInteger := IDProduto; // Define o valor do parâmetro `:id`

            // Executa o comando de exclusão
            vQuery.ExecSQL;
          finally
            FreeAndNil(vQuery);
          end;

          DMPrincipal.FireTransCon.CommitRetaining;
          MsgBox('"Prezado Cliente"'#13'Produto excluido com sucesso!', MB_OK + MB_ICONINFORMATION);
        except
          on E: EFDException do
          begin
            MsgBox('"Prezado Cliente"'#13'Não foi possível excluir o registro.' + #13 + TratarErroBanco(E), MB_OK + MB_ICONERROR);
            DMPrincipal.FireTransCon.Rollback;
            Exit;
          end;
        end;
      end;
    end
    else
    begin
      MsgBox('"Prezado Cliente"'#13'Nenhum registro selecionado para excluir.', MB_OK + MB_ICONINFORMATION);
    end;
  end;

  Pesquisar(EmptyStr);
end;


procedure TfrmCadastroProdutos0.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dtCadastros do
  begin
    Produtos.Close;
  end;

  FreeAndNil(dtCadastros);
  FreeAndNil(dtSelecoes);
  Action := caFree;
end;

procedure TfrmCadastroProdutos0.FormCreate(Sender: TObject);
begin
  dtCadastros := TdtCadastros.Create(nil);
  dtSelecoes := TdtSelecoes.Create(nil);

  //Produtos
  DMPrincipal.FireDacCon.Connected := True;              // Ative a conexão
  gridProdutos.DataSource := dtSelecoes.dsConsProdutos;  // Vincule ao Grid
  dtSelecoes.ConsProdutos.Open;
end;

procedure TfrmCadastroProdutos0.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sSQL: String;
begin
  if Key = VK_F5 then
  begin
    if edtPesquisa.Text <> EmptyStr then
    begin
      sSQL := EmptyStr;
      if ( sFiltro = 'ID_PRODUTO' ) then
        sSQL := ' AND ' + sFiltro + ' LIKE ( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';

      if ( sFiltro = 'NOME_PRODUTO' ) then
        sSQL := ' AND UPPER( ' + sFiltro + ' ) LIKE UPPER( '+ QuotedStr('%' + edtPesquisa.Text + '%') +' )';

      Pesquisar(sSQL);
    end
    else
      Pesquisar(EmptyStr);
  end;
end;

procedure TfrmCadastroProdutos0.FormShow(Sender: TObject);
begin
  with dtCadastros do
  begin
    Produtos.Close;
    Produtos.Open;
  end;

  with dtSelecoes do
  begin
    ConsProdutos.Close;
    ConsProdutos.Open;
  end;

  sFiltro := 'ID_PRODUTO';
  Pesquisar(EmptyStr);
  gridProdutosTitleClick(Self.gridProdutos.Columns.Items[0]);
end;

procedure TfrmCadastroProdutos0.gridProdutosCellClick(Column: TColumn);
begin
  // Atualiza a posição do DataSet para o registro selecionado
  if dtSelecoes.dsConsProdutos.DataSet.Active then
  begin
    dtSelecoes.dsConsProdutos.DataSet.RecNo := gridProdutos.DataSource.DataSet.RecNo;
  end;
end;

procedure TfrmCadastroProdutos0.gridProdutosTitleClick(Column: TColumn);
begin
  edtPesquisa.Clear;
  if ( Column.FieldName = 'ID_PRODUTO' ) then
  begin
    sFiltro := 'ID_PRODUTO';
    edtPesquisa.MaxLength   := 11;
    edtPesquisa.NumbersOnly := True;
    grpPesquisa.Caption     := 'Pesquisa pelo Código. (Clique no título para mudar o campo de pesquisa)';
  end
  else
  begin
    if ( Column.FieldName = 'NOME_PRODUTO' ) then
    begin
      sFiltro := 'NOME_PRODUTO';
      edtPesquisa.CharCase    := ecUpperCase;
      edtPesquisa.MaxLength   := 255;
      edtPesquisa.NumbersOnly := False;
      grpPesquisa.Caption     := 'Pesquisa pela Descrição. (Clique no título para mudar o campo de pesquisa)';
    end
  end;

  if ( Column.FieldName = 'ID_PRODUTO' ) then
    uUtil.OrdenaGrid(gridProdutos, Column, 'PRODUTOS', 'ASC')
  else
    uUtil.OrdenaGrid(gridProdutos, Column, 'PRODUTOS');
end;

procedure TfrmCadastroProdutos0.Pesquisar(pSQL: String);
var
  sSQL: String;
begin
  if dtCadastros.Produtos.Active then
    dtCadastros.Produtos.Close;

  dtCadastros.Produtos.Open;

  sSQL := EmptyStr;
  sSQL := sDefaultSQL;
  with dtSelecoes do
  begin
    if sDefaultSQL = EmptyStr then
      sDefaultSQL := ConsProdutos.SQL.Text;

    if pSQL = EmptyStr then
    begin
      ConsProdutos.Close;
      ConsProdutos.SQL.Text := sDefaultSQL;
      ConsProdutos.Open;
    end
    else
    begin
      sSQL := sSQL + pSQL;
      ConsProdutos.Close;
      ConsProdutos.SQL.Text := sSQL;
      ConsProdutos.Open;
    end;
  end;
end;


end.

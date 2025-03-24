unit unCadastroClientes0;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Error, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Error, FireDAC.Comp.Client;

type
  TfrmCadastroClientes0 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnRemover: TBitBtn;
    btnFechar: TBitBtn;
    Panel2: TPanel;
    gridClientes: TDBGrid;
    GroupBox2: TGroupBox;
    btnPesquisar: TBitBtn;
    grpPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gridClientesTitleClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridClientesCellClick(Column: TColumn);
  private
    procedure Pesquisar(pSQL: String);
    { Private declarations }
  public
    sDefaultSQL: String;
    sFiltro: String;
    { Public declarations }
  end;

var
  frmCadastroClientes0: TfrmCadastroClientes0;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModCadastros, unModSelecoes, unCadastroClientes1, uUtil;

procedure TfrmCadastroClientes0.btnAlterarClick(Sender: TObject);
begin
  with dtCadastros do
  begin
    if (Clientes.RecordCount > 0) then
    begin
      Clientes.IndexFieldNames := 'ID_CLIENTE';
      if Clientes.FindKey([dtSelecoes.ConsClientes.FieldByName('ID_CLIENTE').Value]) then
        Clientes.Edit;

      frmCadastroClientes1 := TfrmCadastroClientes1.Create(Self);
      frmCadastroClientes1.ShowModal;

      Pesquisar(EmptyStr);
    end
    else
    begin
      MsgBox('"Prezado Cliente"'#13'Nenhum registro selecionado para alterar.', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmCadastroClientes0.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroClientes0.btnIncluirClick(Sender: TObject);
begin
  with dtCadastros do
  begin
    Clientes.Insert;
  end;

  frmCadastroClientes1 := TfrmCadastroClientes1.Create(Self);
  frmCadastroClientes1.ShowModal;

  Pesquisar(EmptyStr);
end;

procedure TfrmCadastroClientes0.btnPesquisarClick(Sender: TObject);
var
  Key: Word;
  Shift: TShiftState;
begin
  Key := VK_F5; // A tecla F5
  Shift := [];  // Nenhuma tecla modificadora, você pode ajustar conforme necessário
  FormKeyDown(Self, Key, Shift);
end;

procedure TfrmCadastroClientes0.btnRemoverClick(Sender: TObject);
var
  vQuery: TFDQuery;
  IDCliente: Integer;
begin
  with dtCadastros do
  begin
    // Verificar se o DataSet não está vazio
    if not dtSelecoes.dsConsClientes.DataSet.IsEmpty then
    begin
      // A partir deste momento, o DataSet já deve estar no registro correto devido ao OnCellClick
      IDCliente := dtSelecoes.dsConsClientes.DataSet.FieldByName('ID_CLIENTE').AsInteger;

      // Confirmar exclusão
      if Messagedlg('Confirma excluir o cliente: ' + dtSelecoes.dsConsClientes.DataSet.FieldByName('NOME_COMPLETO').AsString + ' ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMPrincipal.FireTransCon.StartTransaction;
        try
          vQuery := TFDQuery.Create(nil);
          try
            vQuery.Close;
            vQuery.SQL.Clear;
            vQuery.Connection := DMPrincipal.FireDacCon; // Associe ao componente TFDConnection configurado no seu projeto
            vQuery.SQL.Text := 'DELETE FROM clientes WHERE id_cliente = :id_cliente';
            vQuery.Params[0].AsInteger := IDCliente; // Define o valor do parâmetro `:id`

            // Executa o comando de exclusão
            vQuery.ExecSQL;
          finally
            FreeAndNil(vQuery);
          end;

          DMPrincipal.FireTransCon.CommitRetaining;
          MsgBox('"Prezado Cliente"'#13'Cliente excluido com sucesso!', MB_OK + MB_ICONINFORMATION);
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

procedure TfrmCadastroClientes0.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dtCadastros do
  begin
    Clientes.Close;
  end;

  FreeAndNil(dtCadastros);
  FreeAndNil(dtSelecoes);
  Action := caFree;
end;

procedure TfrmCadastroClientes0.FormCreate(Sender: TObject);
begin
  dtCadastros := TdtCadastros.Create(nil);
  dtSelecoes := TdtSelecoes.Create(nil);

  //Produtos
  DMPrincipal.FireDacCon.Connected := True;              // Ative a conexão
  gridClientes.DataSource := dtSelecoes.dsConsClientes;  // Vincule ao Grid
  dtSelecoes.ConsClientes.Open;
end;

procedure TfrmCadastroClientes0.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sSQL: String;
begin
  if Key = VK_F5 then
  begin
    if edtPesquisa.Text <> EmptyStr then
    begin
      sSQL := EmptyStr;
      if ( sFiltro = 'ID_CLIENTE' ) then
        sSQL := ' AND ' + sFiltro + ' LIKE ( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';

      if ( sFiltro = 'CPF_CNPJ' ) then
        sSQL := ' AND ' + sFiltro + ' LIKE ( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';

      if ( sFiltro = 'NOME_COMPLETO' ) then
        sSQL := ' AND UPPER( ' + sFiltro + ' ) LIKE UPPER( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';

      if ( sFiltro = 'ENDERECO_COMPLETO' ) then
        sSQL := ' AND UPPER( ' + sFiltro + ' ) LIKE UPPER( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';

      if ( sFiltro = 'TELEFONE' ) then
        sSQL := ' AND ' + sFiltro + ' ) LIKE ( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';

      Pesquisar(sSQL);
    end
    else
      Pesquisar(EmptyStr);
  end;
end;

procedure TfrmCadastroClientes0.FormShow(Sender: TObject);
begin
  with dtCadastros do
  begin
    Clientes.Close;
    Clientes.Open;
  end;

  sFiltro := 'CPF_CNPJ';
  Pesquisar(EmptyStr);
  gridClientesTitleClick(Self.gridClientes.Columns.Items[1]);
end;

procedure TfrmCadastroClientes0.gridClientesCellClick(Column: TColumn);
begin
  // Atualiza a posição do DataSet para o registro selecionado
  if dtSelecoes.dsConsClientes.DataSet.Active then
  begin
    dtSelecoes.dsConsClientes.DataSet.RecNo := gridClientes.DataSource.DataSet.RecNo;
  end;
end;

procedure TfrmCadastroClientes0.gridClientesTitleClick(Column: TColumn);
begin
  edtPesquisa.Clear;
  if ( Column.FieldName = 'CPF_CNPJ' ) then
  begin
    sFiltro := 'CPF_CNPJ';
    edtPesquisa.MaxLength   := 18;
    edtPesquisa.NumbersOnly := True;
    grpPesquisa.Caption     := 'Pesquisa por CPF / CNPJ. (Clique no título para mudar o campo de pesquisa)';
  end
  else
  begin
    if ( Column.FieldName = 'NOME_COMPLETO' ) then
    begin
      sFiltro := 'NOME_COMPLETO';
      edtPesquisa.CharCase    := ecUpperCase;
      edtPesquisa.MaxLength   := 255;
      edtPesquisa.NumbersOnly := False;
      grpPesquisa.Caption     := 'Pesquisa pelo Nome. (Clique no título para mudar o campo de pesquisa)';
    end
    else
    begin
      if ( Column.FieldName = 'ENDERECO_COMPLETO' ) then
      begin
        sFiltro := 'ENDERECO_COMPLETO';
        edtPesquisa.MaxLength   := 100;
        edtPesquisa.NumbersOnly := False;
        grpPesquisa.Caption     := 'Pesquisa por Endereço. (Clique no título para mudar o campo de pesquisa)';
      end
      else
      begin
        if ( Column.FieldName = 'TELEFONE' ) then
        begin
          sFiltro := 'TELEFONE';
          edtPesquisa.MaxLength   := 15;
          edtPesquisa.NumbersOnly := True;
          grpPesquisa.Caption     := 'Pesquisa por Telefone. (Clique no título para mudar o campo de pesquisa)';
        end
        else
        begin
          if ( Column.FieldName = 'ID_CLIENTE' ) then
          begin
            sFiltro := 'ID_CLIENTE';
            edtPesquisa.MaxLength   := 11;
            edtPesquisa.NumbersOnly := True;
            grpPesquisa.Caption     := 'Pesquisa pelo Código. (Clique no título para mudar o campo de pesquisa)';
          end
        end;
      end;
    end;
  end;

  if ( Column.FieldName = 'CPF_CNPJ' ) then
    uUtil.OrdenaGrid(gridClientes, Column, 'CLIENTES', 'ASC')
  else
    uUtil.OrdenaGrid(gridClientes, Column, 'CLIENTES');
end;

procedure TfrmCadastroClientes0.Pesquisar(pSQL: String);
var
  sSQL: String;
begin
  if dtCadastros.Clientes.Active then
    dtCadastros.Clientes.Close;

  dtCadastros.Clientes.Open;

  with dtSelecoes do
  begin
    ConsClientes.Close;
    ConsClientes.Open;
  end;
  sSQL := EmptyStr;
  sSQL := sDefaultSQL;
  with dtSelecoes do
  begin
    if sDefaultSQL = EmptyStr then
      sDefaultSQL := ConsClientes.SQL.Text;

    if pSQL = EmptyStr then
    begin
      ConsClientes.Close;
      ConsClientes.SQL.Text := sDefaultSQL;
      ConsClientes.Open;
    end
    else
    begin
      sSQL := sSQL + pSQL;
      ConsClientes.Close;
      ConsClientes.SQL.Text := sSQL;
      ConsClientes.Params.Add(sFiltro, ftString);
      ConsClientes.Open;
    end;
  end;

end;

end.

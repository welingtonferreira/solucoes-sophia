unit unPedidosVenda0;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, DateUtils, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPedidosVenda0 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnFechar: TBitBtn;
    GroupBox2: TGroupBox;
    btnPesquisar: TBitBtn;
    grpPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    Panel2: TPanel;
    btnRemover: TBitBtn;
    Panel3: TPanel;
    gridVendas: TDBGrid;
    gridVendasItens: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridVendasTitleClick(Column: TColumn);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridVendasCellClick(Column: TColumn);
  private
    sqlPadrao : TStringList;
    procedure Pesquisar(pSQL: String);
    { Private declarations }
  public
    sDefaultSQL: String;
    sFiltro: String;
    { Public declarations }
  end;

var
  frmPedidosVenda0: TfrmPedidosVenda0;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModSelecoes, unModCadastros, unPedidosVenda1, uUtil;

procedure TfrmPedidosVenda0.btnPesquisarClick(Sender: TObject);
var
  Key: Word;
  Shift: TShiftState;
begin
  Key := VK_F5; // A tecla F5
  Shift := [];  // Nenhuma tecla modificadora, você pode ajustar conforme necessário
  FormKeyDown(Self, Key, Shift);
end;

procedure TfrmPedidosVenda0.btnRemoverClick(Sender: TObject);
var
  vQuery: TFDQuery;
  IDVenda: Integer;
begin
  with dtCadastros do
  begin
    // Verificar se o DataSet não está vazio
    if not dtSelecoes.dsConsVendas.DataSet.IsEmpty then
    begin
      // A partir deste momento, o DataSet já deve estar no registro correto devido ao OnCellClick
      IDVenda := dtSelecoes.dsConsVendas.DataSet.FieldByName('ID_VENDA').AsInteger;

      if Messagedlg('Confirma excluir a venda N°. '+ IntToStr(dtSelecoes.ConsVendasID_VENDA.Value) +' ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMPrincipal.FireTransCon.StartTransaction;
        try
          vQuery := TFDQuery.Create(nil);
          try
            vQuery.Close;
            vQuery.SQL.Clear;
            vQuery.Connection := DMPrincipal.FireDacCon; // Associe ao componente TFDConnection configurado no seu projeto
            vQuery.SQL.Text := 'DELETE FROM Vendas WHERE id_venda = :id_venda';
            vQuery.Params[0].AsInteger := IDVenda; // Define o valor do parâmetro `:id`

            // Executa o comando
            vQuery.ExecSQL;

            vQuery.Close;
            vQuery.SQL.Clear;
            vQuery.Connection := DMPrincipal.FireDacCon; // Associe ao componente TFDConnection configurado no seu projeto
            vQuery.SQL.Text := 'DELETE FROM itens_venda WHERE id_venda = :id_venda';
            vQuery.Params[0].AsInteger := IDVenda; // Define o valor do parâmetro `:id`

            // Executa o comando
            vQuery.ExecSQL;
          finally
            FreeAndNil(vQuery)
          end;

          CommitRFD;
          MsgBox('"Prezado Cliente"'#13'Venda excluida com sucesso!', MB_OK + MB_ICONINFORMATION);
        except
          on E: EFDException do
          begin
            MsgBox('"Prezado Cliente"'#13'Não foi possível excluir o registro.' + #13 + TratarErroBanco(E), MB_OK + MB_ICONERROR);
            DMPrincipal.FireTransCon.Rollback;
            Exit;
          end;
        end;
      end
      else
      begin
        MsgBox('"Prezado Cliente"'#13'Nenhum registro selecionado para excluir.', MB_OK + MB_ICONINFORMATION);
      end;
    end;
  end;

  Pesquisar(EmptyStr);
end;

procedure TfrmPedidosVenda0.btnAlterarClick(Sender: TObject);
begin
  with dtCadastros do
  begin
    with Vendas do
    begin
      if RecordCount > 0 then
      begin
        Vendas.IndexFieldNames := 'ID_VENDA';
        if Vendas.FindKey([dtSelecoes.dsConsVendas.DataSet.FieldByName('ID_VENDA').AsInteger]) then
        begin
          Vendas.Edit;
          frmPedidosVenda1 := TfrmPedidosVenda1.Create(Self);

          frmPedidosVenda1.edtCodigo.Text := dtSelecoes.ConsVendasID_CLIENTE.AsString;
          frmPedidosVenda1.edtNome.Text := dtSelecoes.ConsVendasNOME_COMPLETO.AsString;
          frmPedidosVenda1.edtDataVenda.Date := dtSelecoes.ConsVendasDATA_VENDA.Value;
          frmPedidosVenda1.edtValor.Text := FormatFloat('#,##0.00', dtSelecoes.ConsVendasTOTAL_VENDA.AsFloat);

          frmPedidosVenda1.bAlterando := True;
          frmPedidosVenda1.iIdVenda := dtSelecoes.dsConsVendas.DataSet.FieldByName('ID_VENDA').AsInteger;
          frmPedidosVenda1.ShowModal;
          frmPedidosVenda1.Free;
        end;
      end
      else
      begin
        MsgBox('"Prezado Cliente"'#13'Nenhum registro selecionado para alterar.', MB_OK + MB_ICONINFORMATION);
      end;
    end;
  end;

  Pesquisar(EmptyStr);
end;

procedure TfrmPedidosVenda0.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidosVenda0.btnIncluirClick(Sender: TObject);
begin
  with dtCadastros do
  begin
    Vendas.CancelUpdates;
    Vendas.Insert;
  end;
  frmPedidosVenda1 := TfrmPedidosVenda1.Create(Self);
  frmPedidosVenda1.edtDataVenda.Date := Date;
  frmPedidosVenda1.Tag := Self.Tag;
  frmPedidosVenda1.bAlterando := False;
  frmPedidosVenda1.ShowModal;
  frmPedidosVenda1.Free;

  Pesquisar(EmptyStr);
end;

procedure TfrmPedidosVenda0.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dtCadastros do
  begin
    Vendas.Close;
    ItensVendas.Close;
  end;

  FreeAndNil(dtSelecoes);
  FreeAndNil(dtCadastros);
  Action := caFree;
end;

procedure TfrmPedidosVenda0.FormCreate(Sender: TObject);
begin
  dtSelecoes := TdtSelecoes.Create(nil);
  dtCadastros := TdtCadastros.Create(nil);

  //Vendas
  DMPrincipal.FireDacCon.Connected := True;         // Ative a conexão
  gridVendas.DataSource := dtSelecoes.dsConsVendas; // Vincule ao Grid
  dtSelecoes.ConsVendas.Open;                       // Abra a query

  //VendasItens
  DMPrincipal.FireDacCon.Connected := True;                   // Ative a conexão
  gridVendasItens.DataSource := dtSelecoes.dsConsVendasItens; // Vincule ao Grid
  dtSelecoes.ConsVendasItens.Open;                            // Abra a query
end;

procedure TfrmPedidosVenda0.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sSQL: String;
begin
  if Key = VK_F5 then
  begin
    if edtPesquisa.Text <> EmptyStr then
    begin
      sSQL := EmptyStr;
      if ( sFiltro = 'ID_VENDA' ) then
        sSQL := ' AND ' + sFiltro + ' LIKE ( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';

      if ( sFiltro = 'NOME_COMPLETO' ) then
        sSQL := ' AND UPPER((SELECT ' + sFiltro + ' FROM CLIENTES WHERE CLIENTES.ID_CLIENTE = VENDAS.ID_CLIENTE)) LIKE UPPER( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';

      if ( sFiltro = 'DATA_VENDA' ) then
      begin
        try
          StrToDate(edtPesquisa.Text);
        except
          on EConvertError do
            MsgBox('"Prezado Cliente"'#13'A data preenchida para o filtro de Data de Venda está invalida! Utilize o formato (dd/mm/yyyy)' + #13, MB_OK+MB_ICONERROR);
        end;
        sSQL := 'AND DATE_FORMAT(' + sFiltro + ', ''%d/%m/%Y'') LIKE ' + QuotedStr(edtPesquisa.Text + '%');
      end;

      Pesquisar(sSQL);
    end
    else
      Pesquisar(EmptyStr);
  end;
end;

procedure TfrmPedidosVenda0.FormShow(Sender: TObject);
begin
  with dtSelecoes do
  begin
    ConsVendas.Close;
    ConsVendas.Open;

    ConsVendasItens.Close;
    ConsVendasItens.Open;
  end;

  sFiltro := 'ID_VENDA';
  Pesquisar(EmptyStr);
  gridVendasTitleClick(Self.gridVendas.Columns.Items[0]);
end;

procedure TfrmPedidosVenda0.gridVendasCellClick(Column: TColumn);
begin
  // Atualiza a posição do DataSet para o registro selecionado
  if dtSelecoes.dsConsVendas.DataSet.Active then
  begin
    dtSelecoes.dsConsVendas.DataSet.RecNo := gridVendas.DataSource.DataSet.RecNo;
  end;
end;

procedure TfrmPedidosVenda0.gridVendasTitleClick(Column: TColumn);
var
  DataPesquisa: String;
begin
  edtPesquisa.Clear;
  if ( Column.FieldName = 'ID_VENDA' ) then
  begin
    sFiltro := 'ID_VENDA';
    edtPesquisa.MaxLength   := 11;
    edtPesquisa.NumbersOnly := True;
    grpPesquisa.Caption     := 'Pesquisa por Código da Venda. (Clique no título para mudar o campo de pesquisa)';
  end
  else
  begin
    if ( Column.FieldName = 'NOME_COMPLETO' ) then
    begin
      sFiltro := 'NOME_COMPLETO';
      edtPesquisa.CharCase    := ecUpperCase;
      edtPesquisa.MaxLength   := 255;
      edtPesquisa.NumbersOnly := False;
      grpPesquisa.Caption     := 'Pesquisa pelo Nome do Cliente. (Clique no título para mudar o campo de pesquisa)';
    end
    else
    begin
      if ( Column.FieldName = 'DATA_VENDA' ) then
      begin
        sFiltro := 'DATA_VENDA';
        edtPesquisa.MaxLength   := 10;
        edtPesquisa.NumbersOnly := False;
        grpPesquisa.Caption     := 'Pesquisa pela Data da Venda. (Clique no título para mudar o campo de pesquisa)';
      end
    end;
  end;

  if ( Column.FieldName = 'ID_VENDA' ) then
    uUtil.OrdenaGrid(gridVendas, Column, 'VENDAS', 'ASC')
  else
    uUtil.OrdenaGrid(gridVendas, Column, '');

end;

procedure TfrmPedidosVenda0.Pesquisar(pSQL: String);
var
  sSQL: String;
begin
  if dtCadastros.Vendas.Active then
    dtCadastros.Vendas.Close;

  if dtCadastros.ItensVendas.Active then
    dtCadastros.ItensVendas.Close;

  dtCadastros.Vendas.Open;
  dtCadastros.ItensVendas.Open;

  sSQL := EmptyStr;
  sSQL := sDefaultSQL;
  with dtSelecoes do
  begin
    if sDefaultSQL = EmptyStr then
      sDefaultSQL := ConsVendas.SQL.Text;

    if pSQL = EmptyStr then
    begin
      ConsVendas.Close;
      ConsVendas.SQL.Text := sDefaultSQL;
      ConsVendas.Open;
    end
    else
    begin
      sSQL := sSQL + pSQL;
      ConsVendas.Close;
      ConsVendas.SQL.Text := sSQL;
      ConsVendas.Open;
    end;


    ConsVendasItens.Close;
    ConsVendasItens.Open;
  end;

end;

end.

end.

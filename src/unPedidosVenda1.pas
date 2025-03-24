unit unPedidosVenda1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.ValEdit, Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client;

type
  TfrmPedidosVenda1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Label7: TLabel;
    edtValor: TEdit;
    CamposObrigatorios: TValueListEditor;
    gpbProdutos: TGroupBox;
    gridVendasItens: TDBGrid;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    dbeProduto: TDBEdit;
    gpbCliente: TGroupBox;
    btnConsCliente: TSpeedButton;
    gpbData: TGroupBox;
    edtDataVenda: TDateTimePicker;
    edtNome: TEdit;
    edtCodigo: TEdit;
    cdsTemp: TClientDataSet;
    cdsTempID_ITEM: TFDAutoIncField;
    cdsTempID_VENDA: TIntegerField;
    cdsTempID_PRODUTO: TIntegerField;
    cdsTempQUANTIDADE: TIntegerField;
    cdsTempVALOR_UNITARIO: TBCDField;
    cdsTempSUBTOTAL: TBCDField;
    cdsTempVIRTUAL_NOME_PRODUTO: TStringField;
    dsTemp: TDataSource;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnConsClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure cdsTempVALOR_UNITARIOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    Fechar: Boolean;
    Cancelou: Boolean;
    function ValidarGravar: Boolean;
    procedure CalcularTotal;
    procedure IniciarClientDataSet;
    procedure CarregarItensVenda(iIdVenda: Integer);
    procedure ExcluirProduto(IDProduto: Integer);
    procedure SincronizarItensVendas;
    { Private declarations }
  public
    bAlterando: Boolean;
    iIdVenda: Integer;
    { Public declarations }
  end;

var
  frmPedidosVenda1: TfrmPedidosVenda1;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModCadastros, unModSelecoes, unPedidoVendaItens, uConsultaCliente, uUtil;

function TfrmPedidosVenda1.ValidarGravar: Boolean;
begin
  Result := True;

  if edtDataVenda.Date = Null then
  begin
    MsgBox('"Prezado Cliente"'#13'Data da venda deve ser informada.', MB_OK + MB_ICONINFORMATION);
    ShowMessage('');
    edtDataVenda.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtValor.Text) = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'Valor total da venda está igual a 0.', MB_OK + MB_ICONINFORMATION);
    edtValor.SetFocus;
    Result := False;
    Exit;
  end;
end;

procedure TfrmPedidosVenda1.btnAlterarClick(Sender: TObject);
var
  iIdVenda: Integer;
begin
  if cdsTemp.Locate('ID_PRODUTO', cdsTemp.FieldByName('ID_PRODUTO').AsInteger, []) then
  begin
    dtCadastros.ItensVendas.Edit;

    frmPedidoVendaItens := TfrmPedidoVendaItens.Create(Self);
    frmPedidoVendaItens.edtCodigo.Text := cdsTemp.FieldByName('ID_PRODUTO').AsString;
    frmPedidoVendaItens.edtNomeProduto.Text := cdsTemp.FieldByName('VIRTUAL_NOME_PRODUTO').AsString;
    frmPedidoVendaItens.edtValorUnitario.Text := FloatToStr(cdsTemp.FieldByName('VALOR_UNITARIO').AsFloat);
    frmPedidoVendaItens.edtQuantidade.Text := cdsTemp.FieldByName('QUANTIDADE').AsString;
    frmPedidoVendaItens.edtSubTotal.Text := FloatToStr(cdsTemp.FieldByName('SUBTOTAL').AsFloat);

    frmPedidoVendaItens.ShowModal;
    iIdVenda := frmPedidoVendaItens.iIdVenda;
    FreeAndNil(frmPedidoVendaItens);
  end;

  with dtCadastros do
  begin
    with dtSelecoes  do
    begin
      ConsInsereVendasItens.Close;
      ConsInsereVendasItens.SQL.Strings[ConsInsereVendasItens.SQL.Count-1] := ' WHERE ID_VENDA = ' + IntToStr(iIdVenda) + ';';
      ConsInsereVendasItens.Open;
    end;
  end;

  CalcularTotal;
end;

procedure TfrmPedidosVenda1.btnCancelarClick(Sender: TObject);
begin
  with dtCadastros do
  begin
    Vendas.Cancel;
    Vendas.CancelUpdates;

    ItensVendas.Cancel;
    ItensVendas.CancelUpdates;
  end;
  RollBackRFD;
  Self.Cancelou := True;
  Fechar := True;
  Self.Close;
end;

procedure TfrmPedidosVenda1.btnConsClienteClick(Sender: TObject);
begin
  frmConsultaCliente := TfrmConsultaCliente.Create(Self);
  frmConsultaCliente.ShowModal;

  if ( frmConsultaCliente.ModalResult = mrOk ) and ( not frmConsultaCliente.qryConsCliente.IsEmpty ) then
  begin
    edtNome.Clear;
    edtCodigo.Clear;

    edtCodigo.Text := frmConsultaCliente.qryConsCliente.FieldByName('ID_CLIENTE').AsString;
    edtNome.Text := frmConsultaCliente.qryConsCliente.FieldByName('NOME_COMPLETO').AsString;
  end;

  FreeAndNil(frmConsultaCliente);
end;

procedure TfrmPedidosVenda1.btnExcluirClick(Sender: TObject);
begin
  if MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    ExcluirProduto(cdsTemp.FieldByName('ID_PRODUTO').AsInteger);
  end;

  CalcularTotal;
end;

procedure TfrmPedidosVenda1.btnGravarClick(Sender: TObject);
var
  vQuery: TFDQuery;
  ListaIDsExistentes: TStringList;
  IDItem: Integer;
  Index: Integer;
begin
  if (ValidarGravar) then
  begin
    with dtCadastros do
    begin
      if not Vendas.Active then
        Vendas.Open;
      // Iniciar a transação
      DMPrincipal.FireTransCon.StartTransaction;
      try
        if Vendas.Locate('ID_VENDA', iIdVenda, []) then
        begin
          Vendas.Edit;
          VendasID_CLIENTE.AsString := edtCodigo.Text;
          VendasDATA_VENDA.Value := Trunc(edtDataVenda.Date) + Frac(Now);
          VendasTOTAL_VENDA.Value := StrToFloat(StringReplace(edtValor.Text, '.', '', [rfReplaceAll]));
          Vendas.Post;
        end
        else
        begin
          Vendas.Insert;
          VendasID_CLIENTE.AsString := edtCodigo.Text;
          VendasDATA_VENDA.Value := Trunc(edtDataVenda.Date) + Frac(Now);
          VendasTOTAL_VENDA.Value := StrToFloat(StringReplace(edtValor.Text, '.', '', [rfReplaceAll]));
          Vendas.Post;
        end;

        SincronizarItensVendas;

        if (Vendas.CachedUpdates) then
        begin
          AplicarDados(Vendas);
        end;

        // Aplicar as alterações se o dataset estiver com CachedUpdates
        if ItensVendas.CachedUpdates then
        begin
          AplicarDados(ItensVendas)
        end;

        CommitRFD;

        edtCodigo.Clear;
        edtValor.Clear;

        Fechar := True;
        Self.Close;
      except
        on E: Exception do
        begin
          MsgBox('"Prezado Cliente"'#13'Não foi possível gravar o registro.' + E.Message, MB_OK + MB_ICONERROR);
          RollBackRFD;
        end;
      end;
    end;
  end;
end;

procedure TfrmPedidosVenda1.SincronizarItensVendas;
var
  ListaIDsExistentes: TStringList;
  IDItem: Integer;
  Index: Integer;
begin
  // Carregar os IDs existentes na tabela ItensVendas para a venda atual
  ListaIDsExistentes := TStringList.Create;
  try
    with dtCadastros do
    begin
      ItensVendas.First;
      while not ItensVendas.Eof do
      begin
        if ItensVendas.FieldByName('ID_VENDA').AsInteger = iIdVenda then
        begin
          ListaIDsExistentes.Add(ItensVendas.FieldByName('ID_ITEM').AsString);
        end;
        ItensVendas.Next;
      end;

      // Iterar pelos itens do cdsTemp para inserir ou atualizar
      cdsTemp.First;
      while not cdsTemp.Eof do
      begin
        IDItem := cdsTemp.FieldByName('ID_ITEM').AsInteger;
        if IDItem = 0 then
        begin
          // Inserir novo item
          ItensVendas.Insert;
          ItensVendasID_VENDA.Value := iIdVenda;
          ItensVendasID_PRODUTO.Value := cdsTemp.FieldByName('ID_PRODUTO').AsInteger;
          ItensVendasQUANTIDADE.Value := cdsTemp.FieldByName('QUANTIDADE').AsInteger;
          ItensVendasVALOR_UNITARIO.Value := cdsTemp.FieldByName('VALOR_UNITARIO').AsFloat;
          ItensVendasSUBTOTAL.Value := cdsTemp.FieldByName('SUBTOTAL').AsFloat;
          ItensVendas.Post;
        end
        else if ItensVendas.Locate('ID_ITEM', IDItem, []) then
        begin
          // Atualizar item existente
          ItensVendas.Edit;
          ItensVendasQUANTIDADE.Value := cdsTemp.FieldByName('QUANTIDADE').AsInteger;
          ItensVendasVALOR_UNITARIO.Value := cdsTemp.FieldByName('VALOR_UNITARIO').AsFloat;
          ItensVendasSUBTOTAL.Value := cdsTemp.FieldByName('SUBTOTAL').AsFloat;
          ItensVendas.Post;

          // Remover o ID da lista de existentes (pois ainda está no cdsTemp)
          Index := ListaIDsExistentes.IndexOf(ItensVendas.FieldByName('ID_ITEM').AsString);
          if Index <> -1 then
            ListaIDsExistentes.Delete(Index);
        end;

        cdsTemp.Next;
      end;

      // Excluir os itens que ainda estão na lista (não existem mais no cdsTemp)
      for Index := 0 to ListaIDsExistentes.Count - 1 do
      begin
        if ItensVendas.Locate('ID_ITEM', StrToInt(ListaIDsExistentes[Index]), []) then
        begin
          // Excluir o item da venda baseado no ID_ITEM
          ItensVendas.Delete; // Exclui o item da venda
        end;
      end;
    end;

  finally
    ListaIDsExistentes.Free;
  end;
end;


procedure TfrmPedidosVenda1.btnIncluirClick(Sender: TObject);
begin
  dtCadastros.ItensVendas.Insert;
  frmPedidoVendaItens := TfrmPedidoVendaItens.Create(Self);
  frmPedidoVendaItens.ShowModal;
  iIdVenda := cdsTemp.FieldByName('ID_VENDA').AsInteger;
  FreeAndNil(frmPedidoVendaItens);

  with dtCadastros do
  begin
    with dtSelecoes  do
    begin
      ConsInsereVendasItens.Close;
      ConsInsereVendasItens.SQL.Strings[ConsInsereVendasItens.SQL.Count-1] := ' WHERE ID_VENDA = ' + IntToStr(iIdVenda) + ';';
      ConsInsereVendasItens.Open;
    end;
  end;

  CalcularTotal;
end;

procedure TfrmPedidosVenda1.edtCodigoExit(Sender: TObject);
begin
  if edtCodigo.Text = '' then
    edtNome.Clear;
end;

procedure TfrmPedidosVenda1.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F9 ) then
    btnConsClienteClick(btnConsCliente);
end;

procedure TfrmPedidosVenda1.edtQuantidadeExit(Sender: TObject);
begin
  with dtCadastros do
  begin
//    if Produtos.Locate('CODIGO', LookupProdutos.KeyValue, []) then
//      edtValor.Text := FormatFloat('#,##0.00', (ProdutosVALOR.AsFloat * StrToFloat(edtQuantidade.Text)));
  end;
end;

procedure TfrmPedidosVenda1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not Fechar then
  begin
    btnCancelar.OnClick(Sender);
    CanClose := Fechar;
  end;
end;

procedure TfrmPedidosVenda1.FormCreate(Sender: TObject);
begin
  //VendasItens
  DMPrincipal.FireDacCon.Connected := True;                         // Ative a conexão
  //gridVendasItens.DataSource := dtSelecoes.dsConsInsereVendasItens; // Vincule ao Grid
  //dtSelecoes.ConsInsereVendasItens.Open;                            // Abra a query
end;

procedure TfrmPedidosVenda1.FormShow(Sender: TObject);
begin
  with dtSelecoes do
  begin
    ConsClientes.Close;
    ConsClientes.Open;

    ConsProdutos.Close;
    ConsProdutos.Open;
  end;

  with dtCadastros do
  begin
    Vendas.Open;
    ItensVendas.Open;
    Produtos.Open;
    Clientes.Open;

    with dtSelecoes  do
    begin
      ConsInsereVendasItens.Close;
      ConsInsereVendasItens.SQL.Strings[ConsInsereVendasItens.SQL.Count-1] := ' WHERE ID_VENDA = ' + IntToStr(VendasID_VENDA.AsInteger) + ';';
      ConsInsereVendasItens.Open;
    end;


  end;


  IniciarClientDataSet;
  if bAlterando then
    CarregarItensVenda(dtCadastros.VendasID_VENDA.AsInteger);

  // Vincular o DataSource ao Grid
  dsTemp.DataSet := cdsTemp;    // Associar o DataSource com o ClientDataSet
  gridVendasItens.DataSource := dsTemp;  // Vincular o DataSource ao Grid

  // Abrir o ClientDataSet
  cdsTemp.Open;

  edtCodigo.SetFocus;
end;

procedure TfrmPedidosVenda1.CalcularTotal;
var
  dTotal: Double;
begin
  with dtSelecoes do
  begin
    dTotal := 0;

    // Verifica se o DataSet está aberto e contém dados
    if not cdsTemp.Active then
      Exit;

    // Posiciona no primeiro registro
    cdsTemp.First;

    // Percorre os registros enquanto não atingir o final (EOF)
    while not cdsTemp.Eof do
    begin
      // Multiplica a QUANTIDADE pelo VALOR_UNITARIO e soma ao total
      dTotal := dTotal + (cdsTemp.FieldByName('QUANTIDADE').AsFloat *
                        cdsTemp.FieldByName('VALOR_UNITARIO').AsFloat);

      // Avança para o próximo registro
      cdsTemp.Next;
    end;

    // Atualiza o TEdit com o valor total formatado
    edtValor.Text := FormatFloat('0.00', dTotal);
  end;
end;

procedure TfrmPedidosVenda1.IniciarClientDataSet;
begin
  // Criar o ClientDataSet
  cdsTemp := TClientDataSet.Create(nil);

  // Adicionar definições de campos
  cdsTemp.FieldDefs.Clear; // Limpar FieldDefs antes de adicionar novos campos
  cdsTemp.FieldDefs.Add('ID_ITEM', ftInteger);
  cdsTemp.FieldDefs.Add('ID_VENDA', ftInteger);
  cdsTemp.FieldDefs.Add('ID_PRODUTO', ftInteger);
  cdsTemp.FieldDefs.Add('QUANTIDADE', ftInteger);
  cdsTemp.FieldDefs.Add('VALOR_UNITARIO', ftFloat);
  cdsTemp.FieldDefs.Add('SUBTOTAL', ftFloat);
  cdsTemp.FieldDefs.Add('VIRTUAL_NOME_PRODUTO', ftString, 255); // Defina o tamanho adequado do campo

  // Criar o DataSet
  cdsTemp.CreateDataSet;
end;

procedure TfrmPedidosVenda1.CarregarItensVenda(iIdVenda: Integer);
var
  vQuery: TFDQuery;
begin
  // Limpar o ClientDataSet para carregar novos dados
  cdsTemp.EmptyDataSet;

  // Criar a query para buscar os itens da venda
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := DMPrincipal.FireDacCon;
    vQuery.Close;
    vQuery.SQL.Clear;

    // Query com subquery para pegar o nome do produto
    vQuery.SQL.Text :=
      'SELECT ' +
      'i.ID_ITEM, ' +
      'i.ID_VENDA, ' +
      'i.ID_PRODUTO, ' +
      'i.QUANTIDADE, ' +
      'i.VALOR_UNITARIO, ' +
      'i.SUBTOTAL, ' +
      '(SELECT p.NOME_PRODUTO FROM produtos p WHERE p.ID_PRODUTO = i.ID_PRODUTO) AS NOME_PRODUTO ' +
      'FROM itens_venda i ' +
      'WHERE i.ID_VENDA = :ID_VENDA';

    vQuery.ParamByName('ID_VENDA').AsInteger := iIdVenda;
    vQuery.Open;

    // Carregar os dados no cdsTemp
    cdsTemp.DisableControls; // Desabilitar as atualizações do ClientDataSet durante o carregamento
    while not vQuery.Eof do
    begin
      cdsTemp.Append;
      cdsTemp.FieldByName('ID_ITEM').AsInteger := vQuery.FieldByName('ID_ITEM').AsInteger;
      cdsTemp.FieldByName('ID_VENDA').AsInteger := vQuery.FieldByName('ID_VENDA').AsInteger;
      cdsTemp.FieldByName('ID_PRODUTO').AsInteger := vQuery.FieldByName('ID_PRODUTO').AsInteger;
      cdsTemp.FieldByName('QUANTIDADE').AsInteger := vQuery.FieldByName('QUANTIDADE').AsInteger;
      cdsTemp.FieldByName('VALOR_UNITARIO').AsFloat := vQuery.FieldByName('VALOR_UNITARIO').AsFloat;
      cdsTemp.FieldByName('SUBTOTAL').AsFloat := vQuery.FieldByName('SUBTOTAL').AsFloat;
      cdsTemp.FieldByName('VIRTUAL_NOME_PRODUTO').AsString := vQuery.FieldByName('NOME_PRODUTO').AsString;
      cdsTemp.Post;
      vQuery.Next;
    end;
    cdsTemp.EnableControls; // Habilitar novamente as atualizações do ClientDataSet
  finally
    FreeAndNil(vQuery);
  end;
end;

procedure TfrmPedidosVenda1.cdsTempVALOR_UNITARIOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatFloat('#,##0.00', Sender.AsFloat)
  else
    Text := '';
end;

procedure TfrmPedidosVenda1.ExcluirProduto(IDProduto: Integer);
begin
  // Procurar o produto no ClientDataSet
  if cdsTemp.Locate('ID_PRODUTO', IDProduto, []) then
  begin
    // Excluir o registro atual do ClientDataSet
    cdsTemp.Delete;

    // Atualiza o grid
    gridVendasItens.Refresh;
  end;
end;


end.

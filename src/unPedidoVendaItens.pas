unit unPedidoVendaItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPedidoVendaItens = class(TForm)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    gpbProduto: TGroupBox;
    btnConsProduto: TSpeedButton;
    edtCodigo: TEdit;
    gpbValorUnitario: TGroupBox;
    gpbQuantidade: TGroupBox;
    gpbValorTotal: TGroupBox;
    edtNomeProduto: TEdit;
    edtValorUnitario: TEdit;
    edtQuantidade: TEdit;
    edtSubTotal: TEdit;
    procedure btnConsProdutoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    iIdVenda: Integer;
    { Public declarations }
  end;

var
  frmPedidoVendaItens: TfrmPedidoVendaItens;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModCadastros, unModSelecoes, unPedidosVenda1, uConsultaProduto, uUtil;


procedure TfrmPedidoVendaItens.btnConfirmarClick(Sender: TObject);
begin
  try
    if not frmPedidosVenda1.bAlterando then
    begin
      if frmPedidosVenda1.cdsTemp.Locate('ID_PRODUTO', StrToInt(edtCodigo.Text), []) then
      begin
        MsgBox('"Prezado Cliente"'#13'Produto já Lançado.', MB_OK+MB_ICONINFORMATION);
        edtCodigo.SetFocus;
        Exit;
      end;
    end;

    // Vincular ao DataSource
    frmPedidosVenda1.dsTemp.DataSet := frmPedidosVenda1.cdsTemp;

    // Ativar o ClientDataSet para começar a trabalhar
    frmPedidosVenda1.cdsTemp.Active := True;

    // Adicionar o item no ClientDataSet

    if frmPedidosVenda1.bAlterando then
    begin
      if frmPedidosVenda1.cdsTemp.Locate('ID_ITEM', frmPedidosVenda1.cdsTemp.FieldByName('ID_ITEM').AsInteger, []) then
      frmPedidosVenda1.cdsTemp.Edit
    end
    else
      frmPedidosVenda1.cdsTemp.Append;
    if dtCadastros.VendasID_VENDA.AsInteger = -1 then
      frmPedidosVenda1.cdsTemp.FieldByName('ID_VENDA').AsInteger := GetIDGen
    else
      frmPedidosVenda1.cdsTemp.FieldByName('ID_VENDA').AsInteger := dtCadastros.VendasID_VENDA.AsInteger;
    frmPedidosVenda1.cdsTemp.FieldByName('ID_PRODUTO').AsInteger := StrToInt(edtCodigo.Text);
    frmPedidosVenda1.cdsTemp.FieldByName('QUANTIDADE').AsInteger := StrToInt(edtQuantidade.Text);
    frmPedidosVenda1.cdsTemp.FieldByName('VALOR_UNITARIO').AsFloat := StrToFloat(edtValorUnitario.Text);
    frmPedidosVenda1.cdsTemp.FieldByName('SUBTOTAL').AsFloat := StrToFloat(edtSubTotal.Text);
    frmPedidosVenda1.cdsTemp.FieldByName('VIRTUAL_NOME_PRODUTO').AsString := edtNomeProduto.Text;

    // Postar o item no ClientDataSet
    frmPedidosVenda1.cdsTemp.Post;

    // Ativar o grid
    frmPedidosVenda1.gridVendasItens.DataSource := frmPedidosVenda1.dsTemp;
    frmPedidosVenda1.gridVendasItens.Refresh;

    // Limpar os campos para o próximo item
    edtCodigo.Clear;
    edtNomeProduto.Clear;
    edtQuantidade.Clear;
    edtSubTotal.Clear;
    Self.Close;
  except
    on E: Exception do
    begin
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na gravação do lançamento com a seguinte mensagem:' + #13 + E.Message, MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;


procedure TfrmPedidoVendaItens.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPedidoVendaItens.btnConsProdutoClick(Sender: TObject);
begin
  frmConsultaProduto := TfrmConsultaProduto.Create(Self);
  frmConsultaProduto.ShowModal;

  if ( frmConsultaProduto.ModalResult = mrOk ) and ( not frmConsultaProduto.qryConsProduto.IsEmpty ) then
  begin
    edtCodigo.Text := frmConsultaProduto.qryConsProduto.FieldByName('ID_PRODUTO').AsString;
    edtNomeProduto.Text := frmConsultaProduto.qryConsProduto.FieldByName('NOME_PRODUTO').AsString;
    edtValorUnitario.Text := frmConsultaProduto.qryConsProduto.FieldByName('PRECO_UNITARIO').Value;
  end;

  FreeAndNil(frmConsultaProduto);

  edtQuantidade.SetFocus;
end;

procedure TfrmPedidoVendaItens.edtCodigoExit(Sender: TObject);
begin
  if edtCodigo.Text = '' then
    edtNomeProduto.Clear;
end;

procedure TfrmPedidoVendaItens.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F9 ) then
  btnConsProdutoClick(btnConsProduto);
end;

procedure TfrmPedidoVendaItens.edtQuantidadeExit(Sender: TObject);
var
  Quantidade: Integer;
  ValorUnitario, SubTotal, Total: Double;
begin
  // Tenta converter a quantidade para inteiro
  if not TryStrToInt(edtQuantidade.Text, Quantidade) then
  begin
    ShowMessage('Informe uma quantidade válida.');
    edtQuantidade.SetFocus;
    Exit;
  end;

  // Tenta converter o valor unitário para double
  if not TryStrToFloat(edtValorUnitario.Text, ValorUnitario) then
  begin
    ShowMessage('Informe um valor unitário válido.');
    edtValorUnitario.SetFocus;
    Exit;
  end;

  // Calcula o subtotal
  SubTotal := Quantidade * ValorUnitario;

  // Exibe o subtotal formatado
  edtSubTotal.Text := FormatFloat('0.00', SubTotal);

  // Exemplo de cálculo do total (se houver desconto ou acréscimos)
  Total := SubTotal;
  edtSubTotal.Text := FormatFloat('0.00', Total);

  // Verificar o estoque antes de permitir a venda
  if not ValidarEstoqueParaVenda(StrToInt(edtCodigo.Text), StrToInt(edtQuantidade.Text)) then
  begin
    edtQuantidade.Clear;
    edtQuantidade.SetFocus;
    Exit;
  end;

end;

procedure TfrmPedidoVendaItens.edtValorUnitarioExit(Sender: TObject);
begin
  edtValorUnitario.Text := FormatFloat('0.00', StrToFloat(edtValorUnitario.Text));
end;

procedure TfrmPedidoVendaItens.FormShow(Sender: TObject);
begin
  iIdVenda := 0;
  edtCodigo.SetFocus;
end;

end.

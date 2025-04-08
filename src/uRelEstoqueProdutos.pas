unit uRelEstoqueProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, frxSmartMemo, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frCoreClasses, frxDBSet, frxExportBaseDialog, frxExportPDF;

type
  TfrmRelEstoqueProdutos = class(TForm)
    Panel1: TPanel;
    gpbBotoes: TGroupBox;
    btnImprimir: TBitBtn;
    Panel2: TPanel;
    gpbProduto: TGroupBox;
    btnConsProduto: TSpeedButton;
    edtCodigoProduto: TEdit;
    edtNomeProduto: TEdit;
    dsEstoque: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxEstoque: TfrxDBDataset;
    Estoque: TFDQuery;
    frxRelEstoqueProdutos: TfrxReport;
    chkIgnorarProdutosSemSaida: TCheckBox;
    chkIgnorarProdutosComSaldoZerado: TCheckBox;
    Estoqueid_produto: TFDAutoIncField;
    Estoquenome_produto: TWideStringField;
    Estoquepreco_unitario: TBCDField;
    Estoqueestoque_disponivel: TIntegerField;
    Estoquequantidade_saida: TIntegerField;
    Estoqueestoque_anterior: TIntegerField;
    Estoqueestoque_atualizado: TIntegerField;
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConsProdutoClick(Sender: TObject);
    procedure edtCodigoProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEstoqueProdutos: TfrmRelEstoqueProdutos;

implementation

{$R *.dfm}

uses
  uUtil, uConsultaProduto;

procedure TfrmRelEstoqueProdutos.btnConsProdutoClick(Sender: TObject);
begin
  frmConsultaProduto := TfrmConsultaProduto.Create(Self);
  frmConsultaProduto.ShowModal;

  if ( frmConsultaProduto.ModalResult = mrOk ) and ( not frmConsultaProduto.qryConsProduto.IsEmpty ) then
  begin
    edtNomeProduto.Clear;
    edtCodigoProduto.Clear;

    edtCodigoProduto.Text := frmConsultaProduto.qryConsProduto.FieldByName('ID_PRODUTO').AsString;
    edtNomeProduto.Text := frmConsultaProduto.qryConsProduto.FieldByName('NOME_PRODUTO').AsString;
  end;

  FreeAndNil(frmConsultaProduto);
end;

procedure TfrmRelEstoqueProdutos.btnImprimirClick(Sender: TObject);
begin
  try
    Estoque.Close;
    // Se produto foi selecionado, adicione ao filtro
    if Trim(edtCodigoProduto.Text) <> '' then
      Estoque.ParamByName('ProdutoID').AsInteger := StrToInt(edtCodigoProduto.Text)
    else
      Estoque.ParamByName('ProdutoID').AsInteger := 9999;

    if ChkIgnorarProdutosSemSaida.Checked then
      Estoque.ParamByName('IgnorarProdutosSemSaida').AsInteger := 1
    else
      Estoque.ParamByName('IgnorarProdutosSemSaida').AsInteger := 0;

    if ChkIgnorarProdutosComSaldoZerado.Checked then
      Estoque.ParamByName('IgnorarProdutosComSaldoZerado').AsInteger := 1
    else
      Estoque.ParamByName('IgnorarProdutosComSaldoZerado').AsInteger := 0;

    Estoque.Open;

    if Estoque.IsEmpty then
    begin
      MsgBox('"Prezado Cliente"'#13'Não há dados para serem exibidos.', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    // Carrega o relatório
    frxRelEstoqueProdutos.DataSet := frxEstoque;
    frxRelEstoqueProdutos.LoadFromFile(CarregarCaminhoRelatorio + '\relatorio_estoque_produtos.fr3'); // O arquivo do relatório pré-configurado

    // Exibe o relatório
    frxRelEstoqueProdutos.ShowReport;
  except
    on E: Exception do
      MsgBox('"Prezado Cliente"'#13'Erro ao gerar relatório: ' + E.Message, MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmRelEstoqueProdutos.edtCodigoProdutoExit(Sender: TObject);
begin
  if edtCodigoProduto.Text = '' then
    edtNomeProduto.Clear;
end;

procedure TfrmRelEstoqueProdutos.edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F9 ) then
  btnConsProdutoClick(btnConsProduto);
end;

end.

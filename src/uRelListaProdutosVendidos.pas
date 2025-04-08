unit uRelListaProdutosVendidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Comp.DataSet, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, frxSmartMemo, frCoreClasses, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  Data.DB, frxDBSet, frxExportBaseDialog, frxExportPDF, Vcl.ComCtrls, DateUtils, frxDesgn;

type
  TfrmRelListaProdutosVendidos = class(TForm)
    Panel1: TPanel;
    gpbBotoes: TGroupBox;
    btnImprimir: TBitBtn;
    Panel2: TPanel;
    gpbPeriodo: TGroupBox;
    lblA: TLabel;
    gpbProduto: TGroupBox;
    btnConsProduto: TSpeedButton;
    edtCodigoProduto: TEdit;
    edtNomeProduto: TEdit;
    frxRelListaProdutosVendidos: TfrxReport;
    frxProdutos: TfrxDBDataset;
    Produtos: TFDQuery;
    frxPDFExport1: TfrxPDFExport;
    edtPeriodoInicio: TDateTimePicker;
    edtPeriodoFim: TDateTimePicker;
    dsProdutos: TDataSource;
    ProdutosID_PRODUTO: TFDAutoIncField;
    ProdutosNOME_PRODUTO: TWideStringField;
    ProdutosPRECO_UNITARIO: TBCDField;
    ProdutosNUM_VENDAS: TIntegerField;
    ProdutosQUANTIDADE_VENDIDA: TIntegerField;
    ProdutosVALOR_TOTAL: TFMTBCDField;
    ProdutosPRIMEIRA_VENDA: TSQLTimeStampField;
    ProdutosULTIMA_VENDA: TSQLTimeStampField;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnConsProdutoClick(Sender: TObject);
    procedure edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoProdutoExit(Sender: TObject);
  private
    function ValidarDatas: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelListaProdutosVendidos: TfrmRelListaProdutosVendidos;

implementation

{$R *.dfm}

uses uConsultaCliente, uConsultaProduto, unModPrincipal, uUtil;

procedure TfrmRelListaProdutosVendidos.btnConsProdutoClick(Sender: TObject);
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

procedure TfrmRelListaProdutosVendidos.btnImprimirClick(Sender: TObject);
var
  DataInicio, DataFim: TDateTime;
begin
  try
    if not ValidarDatas then
      Exit;

    Produtos.Close;
    // Pegando as datas dos edits
    DataInicio := edtPeriodoInicio.Date;
    DataFim := edtPeriodoFim.Date;

    // Se produto foi selecionado, adicione ao filtro
    if Trim(edtCodigoProduto.Text) <> '' then
      Produtos.ParamByName('Produto').AsInteger := StrToInt(edtCodigoProduto.Text)
    else
      Produtos.ParamByName('Produto').AsInteger := 9999;

    Produtos.ParamByName('DataInicio').AsDate := DataInicio;
    Produtos.ParamByName('DataFim').AsDate := DataFim;
    Produtos.Open;

    if Produtos.IsEmpty then
    begin
      MsgBox('"Prezado Cliente"'#13'Não há dados para serem exibidos.', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    // Carrega o relatório
    frxRelListaProdutosVendidos.DataSet := frxProdutos;
    frxRelListaProdutosVendidos.LoadFromFile(CarregarCaminhoRelatorio + '\relatorio_produtos_mais_vendidos.fr3'); // O arquivo do relatório pré-configurado

    // Exibe o relatório
    frxRelListaProdutosVendidos.ShowReport;
  except
    on E: Exception do
      MsgBox('"Prezado Cliente"'#13'Erro ao gerar relatório: ' + E.Message, MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmRelListaProdutosVendidos.edtCodigoProdutoExit(Sender: TObject);
begin
  if edtCodigoProduto.Text = '' then
    edtNomeProduto.Clear;
end;

procedure TfrmRelListaProdutosVendidos.edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F9 ) then
  btnConsProdutoClick(btnConsProduto);
end;

function TfrmRelListaProdutosVendidos.ValidarDatas: Boolean;
begin
  Result := False;

  // Verifica se as datas estão preenchidas
  if (edtPeriodoInicio.Date = 0) or (edtPeriodoFim.Date = 0) then
  begin
    MsgBox('"Prezado Cliente"'#13'Por favor, preencha as datas.', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  // Verifica se a data de início é maior que a data de fim
  if edtPeriodoInicio.Date > edtPeriodoFim.Date then
  begin
    MsgBox('"Prezado Cliente"'#13'A data de início não pode ser maior que a data de fim.', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  Result := True;
end;

procedure TfrmRelListaProdutosVendidos.FormShow(Sender: TObject);
begin
  // Preenche o TDateTimePicker com o primeiro e último dia do mês atual
  edtPeriodoInicio.Date := StartOfTheMonth(Date); // Primeiro dia do mês atual
  edtPeriodoFim.Date := EndOfTheMonth(Date);      // Último dia do mês atual
end;


end.

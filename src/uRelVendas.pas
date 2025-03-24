unit uRelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Comp.DataSet, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, frxSmartMemo, frCoreClasses, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  Data.DB, frxDBSet, frxExportBaseDialog, frxExportPDF, Vcl.ComCtrls, DateUtils, frxDesgn;

type
  TfrmRelVendas = class(TForm)
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
    gpbCliente: TGroupBox;
    btnConsCliente: TSpeedButton;
    edtNomeCliente: TEdit;
    edtCodigoCliente: TEdit;
    frxRelVendas: TfrxReport;
    frxVendas: TfrxDBDataset;
    Vendas: TFDQuery;
    VendasID_VENDA: TFDAutoIncField;
    VendasDATA_VENDA: TDateTimeField;
    VendasTOTAL_VENDA: TBCDField;
    VendasCLIENTE: TStringField;
    VendasID_PRODUTO: TIntegerField;
    VendasQUANTIDADE: TIntegerField;
    VendasVALOR_UNITARIO: TBCDField;
    VendasSUBTOTAL: TBCDField;
    VendasPRODUTO: TStringField;
    VendasID_CLIENTE: TIntegerField;
    frxPDFExport1: TfrxPDFExport;
    edtPeriodoInicio: TDateTimePicker;
    edtPeriodoFim: TDateTimePicker;
    dsVendas: TDataSource;
    VendasTOTAL_GERAL: TFMTBCDField;
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConsClienteClick(Sender: TObject);
    procedure btnConsProdutoClick(Sender: TObject);
    procedure edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure edtCodigoProdutoExit(Sender: TObject);
  private
    function ValidarDatas: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

{$R *.dfm}

uses uConsultaCliente, uConsultaProduto, unModPrincipal, uUtil;

procedure TfrmRelVendas.btnConsClienteClick(Sender: TObject);
begin
  frmConsultaCliente := TfrmConsultaCliente.Create(Self);
  frmConsultaCliente.ShowModal;

  if ( frmConsultaCliente.ModalResult = mrOk ) and ( not frmConsultaCliente.qryConsCliente.IsEmpty ) then
  begin
    edtNomeCliente.Clear;
    edtCodigoCliente.Clear;

    edtCodigoCliente.Text := frmConsultaCliente.qryConsCliente.FieldByName('ID_CLIENTE').AsString;
    edtNomeCliente.Text := frmConsultaCliente.qryConsCliente.FieldByName('NOME_COMPLETO').AsString;
  end;

  FreeAndNil(frmConsultaCliente);
end;

procedure TfrmRelVendas.btnConsProdutoClick(Sender: TObject);
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

procedure TfrmRelVendas.btnImprimirClick(Sender: TObject);
var
  DataInicio, DataFim: TDateTime;
begin
  try
    if not ValidarDatas then
      Exit;

    Vendas.Close;
    // Pegando as datas dos edits
    DataInicio := edtPeriodoInicio.Date;
    DataFim := edtPeriodoFim.Date;

    // Se cliente foi selecionado, adicione ao filtro
    if Trim(edtCodigoCliente.Text) <> '' then
      Vendas.ParamByName('Cliente').AsInteger := StrToInt(edtCodigoCliente.Text)
    else
      Vendas.ParamByName('Cliente').AsInteger := 9999;

    // Se produto foi selecionado, adicione ao filtro
    if Trim(edtCodigoProduto.Text) <> '' then
      Vendas.ParamByName('Produto').AsInteger := StrToInt(edtCodigoProduto.Text)
    else
      Vendas.ParamByName('Produto').AsInteger := 9999;

    Vendas.ParamByName('DataInicio').AsDate := DataInicio;
    Vendas.ParamByName('DataFim').AsDate := DataFim;
    Vendas.Open;

    if Vendas.IsEmpty then
    begin
      MsgBox('"Prezado Cliente"'#13'Não há dados para serem exibidos.', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    // Carrega o relatório
    frxRelVendas.DataSet := frxVendas;
    frxRelVendas.LoadFromFile(CarregarCaminhoRelatorio + '\relatorio_venda.fr3'); // O arquivo do relatório pré-configurado

    // Exibe o relatório
    frxRelVendas.ShowReport;
  except
    on E: Exception do
      MsgBox('"Prezado Cliente"'#13'Erro ao gerar relatório: ' + E.Message, MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmRelVendas.edtCodigoClienteExit(Sender: TObject);
begin
  if edtCodigoCliente.Text = '' then
    edtNomeCliente.Clear;
end;

procedure TfrmRelVendas.edtCodigoClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F9 ) then
    btnConsClienteClick(btnConsCliente);
end;

procedure TfrmRelVendas.edtCodigoProdutoExit(Sender: TObject);
begin
  if edtCodigoProduto.Text = '' then
    edtNomeProduto.Clear;
end;

procedure TfrmRelVendas.edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F9 ) then
  btnConsProdutoClick(btnConsProduto);
end;

function TfrmRelVendas.ValidarDatas: Boolean;
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

procedure TfrmRelVendas.FormShow(Sender: TObject);
begin
  // Preenche o TDateTimePicker com o primeiro e último dia do mês atual
  edtPeriodoInicio.Date := StartOfTheMonth(Date); // Primeiro dia do mês atual
  edtPeriodoFim.Date := EndOfTheMonth(Date);      // Último dia do mês atual
end;


end.

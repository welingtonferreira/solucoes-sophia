unit uRelGraficoVendas0;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, frxClass, frxExportBaseDialog, frxExportPDF, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxDBSet, frCoreClasses, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmRelGraficoVendas0 = class(TForm)
    Panel1: TPanel;
    gpbBotoes: TGroupBox;
    btnImprimir: TBitBtn;
    Panel2: TPanel;
    gpbPeriodo: TGroupBox;
    lblA: TLabel;
    edtPeriodoInicio: TDateTimePicker;
    edtPeriodoFim: TDateTimePicker;
    gpbProduto: TGroupBox;
    btnConsProduto: TSpeedButton;
    edtCodigoProduto: TEdit;
    edtNomeProduto: TEdit;
    gpbCliente: TGroupBox;
    btnConsCliente: TSpeedButton;
    edtNomeCliente: TEdit;
    edtCodigoCliente: TEdit;
    GraficoVendas: TFDQuery;
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure edtCodigoClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoProdutoExit(Sender: TObject);
    procedure edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnConsClienteClick(Sender: TObject);
    procedure btnConsProdutoClick(Sender: TObject);
  private
    function ValidarDatas: Boolean;
    function GerarRelatorioGrafico: string;
    function MesPorExtenso(Mes: Integer): string;
    procedure GerarTabelaComStringGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelGraficoVendas0: TfrmRelGraficoVendas0;

implementation

uses
  uRelGraficoVendas1, uConsultaCliente, uConsultaProduto, unModPrincipal, uUtil;

{$R *.dfm}

procedure TfrmRelGraficoVendas0.btnConsClienteClick(Sender: TObject);
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

procedure TfrmRelGraficoVendas0.btnConsProdutoClick(Sender: TObject);
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

procedure TfrmRelGraficoVendas0.btnImprimirClick(Sender: TObject);
var
  sStringRelatorio: String;
begin
  try
    sStringRelatorio := GerarRelatorioGrafico;
    if sStringRelatorio <> EmptyStr then
    begin
      //Abre form com gráfico
      frmRelGraficoVendas1 := TfrmRelGraficoVendas1.Create(Self);
      frmRelGraficoVendas1.sStringRelatorio := sStringRelatorio;
      GerarTabelaComStringGrid;
      frmRelGraficoVendas1.ShowModal;

      FreeAndNil(frmRelGraficoVendas1);
    end;
  except
    on E: Exception do
      MsgBox('"Prezado Cliente"'#13'Erro ao gerar relatório: ' + E.Message, MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmRelGraficoVendas0.edtCodigoClienteExit(Sender: TObject);
begin
  if edtCodigoCliente.Text = '' then
    edtNomeCliente.Clear;
end;

procedure TfrmRelGraficoVendas0.edtCodigoClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F9 ) then
    btnConsClienteClick(btnConsCliente);
end;

procedure TfrmRelGraficoVendas0.edtCodigoProdutoExit(Sender: TObject);
begin
  if edtCodigoProduto.Text = '' then
    edtNomeProduto.Clear;
end;

procedure TfrmRelGraficoVendas0.edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F9 ) then
  btnConsProdutoClick(btnConsProduto);
end;

procedure TfrmRelGraficoVendas0.FormShow(Sender: TObject);
begin
  // Preenche o TDateTimePicker com o primeiro e último dia do ano atual
  edtPeriodoInicio.Date := StartOfTheYear(Date); // Primeiro dia do ano atual
  edtPeriodoFim.Date := EndOfTheYear(Date);      // Último dia do ano atual
end;

function TfrmRelGraficoVendas0.ValidarDatas: Boolean;
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

function TfrmRelGraficoVendas0.MesPorExtenso(Mes: Integer): string;
const
  Meses: array[1..12] of string = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
                                    'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');
begin
  Result := Meses[Mes];
end;

function TfrmRelGraficoVendas0.GerarRelatorioGrafico: string;
var
  AnoAtual, MesAtual, QuantidadeVendas: Integer;
  Relatorio: string;
  AnoAnterior: Integer;
  DataInicio, DataFim: TDateTime;
begin
  try
    Relatorio := '';  // Inicia a string do relatório

    if not ValidarDatas then
      Exit;

    // Pegando as datas dos edits
    DataInicio := edtPeriodoInicio.Date;
    DataFim := edtPeriodoFim.Date;

    GraficoVendas.Close;

    // Se cliente foi selecionado, adicione ao filtro
    if Trim(edtCodigoCliente.Text) <> '' then
      GraficoVendas.ParamByName('id_cliente').AsInteger := StrToInt(edtCodigoCliente.Text)
    else
      GraficoVendas.ParamByName('id_cliente').AsInteger := 9999;

    // Se produto foi selecionado, adicione ao filtro
    if Trim(edtCodigoProduto.Text) <> '' then
      GraficoVendas.ParamByName('id_produto').AsInteger := StrToInt(edtCodigoProduto.Text)
    else
      GraficoVendas.ParamByName('id_produto').AsInteger := 9999;

    GraficoVendas.ParamByName('DataInicio').AsDate := DataInicio;
    GraficoVendas.ParamByName('DataFim').AsDate := DataFim;
    GraficoVendas.Open;

    if GraficoVendas.IsEmpty then
    begin
      MsgBox('"Prezado Cliente"'#13'Não há dados para serem exibidos.', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    AnoAnterior := 0;  // Para controlar quando mudar de ano

    // Processar cada linha da consulta
    GraficoVendas.First;
    while not GraficoVendas.Eof do
    begin
      AnoAtual := Integer(GraficoVendas.FieldByName('Ano').AsVariant);
      MesAtual := Integer(GraficoVendas.FieldByName('Mes').AsVariant);
      QuantidadeVendas := Integer(GraficoVendas.FieldByName('Quantidade').AsVariant);

      // Se for o primeiro registro (ANO) ou mudança de ano, insere o ano
      if AnoAnterior <> AnoAtual then
      begin
        if Relatorio <> '' then
          Relatorio := Relatorio + ';';  // Adiciona separador antes de um novo ano
        Relatorio := Relatorio + '{' + IntToStr(AnoAtual) + ':';  // Inicia o ano
        AnoAnterior := AnoAtual;
      end;

      // Adiciona a quantidade de vendas e o mês ao relatório
      Relatorio := Relatorio + IntToStr(QuantidadeVendas) + ':' + MesPorExtenso(MesAtual);

      // Se não for o último mês, adiciona o ponto e vírgula
      if not GraficoVendas.Eof then
        Relatorio := Relatorio + ';';

      GraficoVendas.Next;
    end;

    // Retira o ponto e vírgula final
    if (Length(Relatorio) > 0) and (Relatorio[Length(Relatorio)] = ';') then
      SetLength(Relatorio, Length(Relatorio) - 1);

    // Finaliza o relatório com '}'
    if Relatorio <> '' then
      Relatorio := Relatorio + '}';

  except
    on E: Exception do
    begin
      MsgBox('Erro ao gerar o relatório gráfico de vendas: ' + E.Message, MB_OK + MB_ICONERROR);
      Result := '';
      Exit;
    end;
  end;

  Result := Relatorio;  // Retorna o relatório gerado
end;

procedure TfrmRelGraficoVendas0.GerarTabelaComStringGrid;
var
  Ano, Mes, Quantidade: Integer;
  MesNome: string;
  i: Integer;
  Relatorio: string;  // Variável para armazenar o relatório gerado
begin
  // Configuração do StringGrid1
  frmRelGraficoVendas1.StringGrid1.RowCount := GraficoVendas.RecordCount + 1;  // Definir o número de linhas (1 para o cabeçalho)

  // Cabeçalho
  frmRelGraficoVendas1.StringGrid1.Cells[0, 0] := 'Ano';
  frmRelGraficoVendas1.StringGrid1.Cells[1, 0] := 'Mês';
  frmRelGraficoVendas1.StringGrid1.Cells[2, 0] := 'Quantidade';

  // Preencher dados
  GraficoVendas.First;
  for i := 1 to GraficoVendas.RecordCount do
  begin
    Ano := GraficoVendas.FieldByName('Ano').AsInteger;
    Mes := GraficoVendas.FieldByName('Mes').AsInteger;
    Quantidade := GraficoVendas.FieldByName('Quantidade').AsInteger;
    MesNome := MesPorExtenso(Mes);  // Função que retorna o mês por extenso

    // Preenchendo as células do StringGrid
    frmRelGraficoVendas1.StringGrid1.Cells[0, i] := IntToStr(Ano);
    frmRelGraficoVendas1.StringGrid1.Cells[1, i] := MesNome;
    frmRelGraficoVendas1.StringGrid1.Cells[2, i] := IntToStr(Quantidade);

    GraficoVendas.Next;
  end;

  // Gerar relatório como texto
  Relatorio := '';  // Iniciar a variável Relatorio

  // Adicionando o cabeçalho ao relatório
  Relatorio := Relatorio + 'Ano    | Mês          | Quantidade' + sLineBreak;
  Relatorio := Relatorio + '----------------------------------------' + sLineBreak;

  // Adicionando os dados da StringGrid ao relatório
  for i := 1 to frmRelGraficoVendas1.StringGrid1.RowCount - 1 do
  begin
    Relatorio := Relatorio +
                 frmRelGraficoVendas1.StringGrid1.Cells[0, i] + '    | ' +
                 frmRelGraficoVendas1.StringGrid1.Cells[1, i] + '     | ' +
                 frmRelGraficoVendas1.StringGrid1.Cells[2, i] + sLineBreak;
  end;
end;


end.

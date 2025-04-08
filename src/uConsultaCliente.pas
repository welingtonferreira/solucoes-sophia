unit uConsultaCliente;

interface

uses
  Windows, Messages, SysUtils, ExtCtrls, Buttons, StdCtrls, Forms,
  pngimage, Controls, DB, Grids, DBGrids, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaCliente = class(TForm)
    gpbPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    gpbRegistros: TGroupBox;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    qryConsCliente: TFDQuery;
    dsRegistros: TDataSource;
    gridRegistros: TDBGrid;
    qryConsClienteID_CLIENTE: TFDAutoIncField;
    qryConsClienteNOME_COMPLETO: TWideStringField;
    qryConsClienteCPF_CNPJ: TWideStringField;
    qryConsClienteTELEFONE: TWideStringField;
    qryConsClienteEMAIL: TWideStringField;
    qryConsClienteENDERECO_COMPLETO: TWideStringField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure dbgRegistrosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaCliente: TfrmConsultaCliente;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModCadastros, unModSelecoes;

procedure TfrmConsultaCliente.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsultaCliente.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsultaCliente.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

procedure TfrmConsultaCliente.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  qryConsCliente.Close;

  if Trim(edtPesquisa.Text) = '' then
  begin
    // Restaura a consulta original
    qryConsCliente.SQL.Text := 'SELECT ID_CLIENTE, NOME_COMPLETO, CPF_CNPJ, TELEFONE, EMAIL, ENDERECO_COMPLETO FROM CLIENTES';
  end
  else
  begin
    // Adicionar cláusula WHERE ou atualizar o filtro existente
    if Pos('WHERE', UpperCase(qryConsCliente.SQL.Text)) = 0 then
    begin
      qryConsCliente.SQL.Add('WHERE UPPER(NOME_COMPLETO) LIKE UPPER(' + QuotedStr('%' + edtPesquisa.Text + '%') + ')');
    end
    else
    begin
      qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-1] :=
        qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-1] +
        ' AND UPPER(NOME_COMPLETO) LIKE UPPER(' + QuotedStr('%' + edtPesquisa.Text + '%') + ')';
    end;
  end;

  qryConsCliente.Open;
end;

procedure TfrmConsultaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  DMPrincipal.FireDacCon.Connected := True;                   // Ative a conexão
  gridRegistros.DataSource := dsRegistros;                     // Vincule ao Grid
  qryConsCliente.Close;
  qryConsCliente.Open;                         // Abra a query

end;

end.

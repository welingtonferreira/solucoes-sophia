unit uConsultaUsuarios;

interface

uses
  Windows, Messages, SysUtils, ExtCtrls, Buttons, StdCtrls, Forms,
  pngimage, Controls, DB, Grids, DBGrids, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaUsuarios = class(TForm)
    dtsRegistros: TDataSource;
    gpbPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    gpbRegistros: TGroupBox;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    dbgRegistros: TDBGrid;
    qryConsUsuarios: TFDQuery;
    qryConsUsuariosID: TFDAutoIncField;
    qryConsUsuariosNOME: TWideStringField;
    qryConsUsuariosCPF: TStringField;
    qryConsUsuariosRG: TWideStringField;
    qryConsUsuariosEMAIL: TWideStringField;
    qryConsUsuariosCEL: TWideStringField;
    qryConsUsuariosTEL: TWideStringField;
    qryConsUsuariosLOGIN: TWideStringField;
    qryConsUsuariosSENHA: TWideStringField;
    qryConsUsuariosADMINISTRADOR: TBooleanField;
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
  frmConsultaUsuarios: TfrmConsultaUsuarios;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModCadastros, unModSelecoes;

procedure TfrmConsultaUsuarios.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsultaUsuarios.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsultaUsuarios.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

//qryConsUsuarios.SQL.Strings[qryConsUsuarios.SQL.Count-2] := 'WHERE UPPER(LOGIN) LIKE UPPER( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';
procedure TfrmConsultaUsuarios.edtPesquisaChange(Sender: TObject);
begin
  qryConsUsuarios.Close;

  if Trim(edtPesquisa.Text) = '' then
  begin
    // Restaura a consulta original
    qryConsUsuarios.SQL.Text := 'SELECT ID, NOME, CPF, RG, EMAIL, CEL, TEL, LOGIN, SENHA, ADMINISTRADOR FROM USER';
  end
  else
  begin
    // Adicionar cláusula WHERE ou atualizar o filtro existente
    if Pos('WHERE', UpperCase(qryConsUsuarios.SQL.Text)) = 0 then
    begin
      qryConsUsuarios.SQL.Add('WHERE UPPER(NOME) LIKE UPPER( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )');
    end
    else
    begin
      qryConsUsuarios.SQL.Strings[qryConsUsuarios.SQL.Count-1] :=
        qryConsUsuarios.SQL.Strings[qryConsUsuarios.SQL.Count-1] +
        ' AND UPPER(NOME) LIKE UPPER( ' + QuotedStr('%' + edtPesquisa.Text + '%') +' )';
    end;
  end;

  qryConsUsuarios.Open;

end;

procedure TfrmConsultaUsuarios.FormCreate(Sender: TObject);
begin
  inherited;

  qryConsUsuarios.Close;
  qryConsUsuarios.Open;

end;

end.

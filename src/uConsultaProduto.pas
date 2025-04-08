unit uConsultaProduto;

interface

uses
  Windows, Messages, SysUtils, ExtCtrls, Buttons, StdCtrls, Forms,
  pngimage, Controls, DB, Grids, DBGrids, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaProduto = class(TForm)
    dtsRegistros: TDataSource;
    gpbPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    gpbRegistros: TGroupBox;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    dbgRegistros: TDBGrid;
    qryConsProduto: TFDQuery;
    qryConsProdutoID_PRODUTO: TFDAutoIncField;
    qryConsProdutoNOME_PRODUTO: TWideStringField;
    qryConsProdutoPRECO_UNITARIO: TBCDField;
    qryConsProdutoESTOQUE_DISPONIVEL: TIntegerField;
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
  frmConsultaProduto: TfrmConsultaProduto;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModCadastros, unModSelecoes;

procedure TfrmConsultaProduto.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsultaProduto.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsultaProduto.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

procedure TfrmConsultaProduto.edtPesquisaChange(Sender: TObject);
begin
  qryConsProduto.Close;

  if Trim(edtPesquisa.Text) = '' then
  begin
    // Restaura a consulta original
    qryConsProduto.SQL.Text := 'SELECT ID_PRODUTO, NOME_PRODUTO, PRECO_UNITARIO, ESTOQUE_DISPONIVEL FROM PRODUTOS';
  end
  else
  begin
    // Adicionar cláusula WHERE ou atualizar o filtro existente
    if Pos('WHERE', UpperCase(qryConsProduto.SQL.Text)) = 0 then
    begin
      qryConsProduto.SQL.Add('WHERE UPPER(NOME_PRODUTO) LIKE UPPER( '+QuotedStr('%'+edtPesquisa.Text+'%')+' )');
    end
    else
    begin
      qryConsProduto.SQL.Strings[qryConsProduto.SQL.Count-1] :=
        qryConsProduto.SQL.Strings[qryConsProduto.SQL.Count-1] +
        ' AND UPPER(NOME_PRODUTO) LIKE UPPER( '+QuotedStr('%'+edtPesquisa.Text+'%')+' )';
    end;
  end;

  qryConsProduto.Open;
end;

procedure TfrmConsultaProduto.FormCreate(Sender: TObject);
begin
  inherited;

  qryConsProduto.Close;
  qryConsProduto.Open;

end;

end.

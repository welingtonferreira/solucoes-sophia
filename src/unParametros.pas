unit unParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, FireDAC.Comp.DataSet, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.Client, Vcl.FileCtrl, Data.DB;

type
  TfrmParametros = class(TForm)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    OpenDialog1: TOpenDialog;
    edtCaminhoPasta: TEdit;
    Label1: TLabel;
    btnConsCaminho: TSpeedButton;
    Label2: TLabel;
    btnConsCaminhoINI: TSpeedButton;
    edtCaminhoINI: TEdit;
    procedure btnConsCaminhoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsCaminhoINIClick(Sender: TObject);
  private
    procedure CarregarCaminhoRelatorio;
    procedure SalvarCaminhoRelatorio;
    procedure CarregarCaminhoConfigBD;
    procedure SalvarCaminhoConfigBD;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametros: TfrmParametros;

implementation

{$R *.dfm}

uses
  unModPrincipal, uUtil;

procedure TfrmParametros.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmParametros.btnConfirmarClick(Sender: TObject);
begin
  SalvarCaminhoRelatorio;
  SalvarCaminhoConfigBD;
end;

procedure TfrmParametros.btnConsCaminhoClick(Sender: TObject);
var
  CaminhoPasta: string;
begin
  // Exibe o diálogo para selecionar uma pasta
  if SelectDirectory('Selecione a pasta onde estão os relatórios', '', CaminhoPasta) then
  begin
    // Define o caminho selecionado no TEdit
    edtCaminhoPasta.Text := CaminhoPasta;
  end;
end;

procedure TfrmParametros.btnConsCaminhoINIClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  // Cria o diálogo de seleção de arquivo
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Title := 'Selecione o arquivo de configuração (.ini)';
    OpenDialog.Filter := 'Arquivos INI (*.ini)|*.ini|Todos os Arquivos (*.*)|*.*';
    OpenDialog.DefaultExt := 'ini';
    OpenDialog.Options := [ofFileMustExist, ofHideReadOnly];

    // Exibe o diálogo e obtém o caminho selecionado
    if OpenDialog.Execute then
    begin
      edtCaminhoINI.Text := OpenDialog.FileName; // Define o caminho selecionado no TEdit
    end;
  finally
    OpenDialog.Free; // Libera o diálogo após uso
  end;
end;


procedure TfrmParametros.CarregarCaminhoRelatorio;
var
  vQuery: TFDQuery;
  CaminhoRelatorio: string;
begin
  try
    // Cria a query dinamicamente
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Connection := DMPrincipal.FireDacCon;

      // Verifica se já existe um caminho cadastrado
      vQuery.SQL.Text := 'SELECT CaminhoRelatorio FROM parametros';
      vQuery.Open;

      if not vQuery.IsEmpty then
      begin
        // Se existir, carrega o caminho no TEdit
        CaminhoRelatorio := vQuery.FieldByName('CaminhoRelatorio').AsString;
        edtCaminhoPasta.Text := CaminhoRelatorio;
      end
      else
      begin
        // Caso não exista, você pode informar ao usuário ou deixar o campo em branco
        edtCaminhoPasta.Clear;
      end;
    finally
      vQuery.Free;
    end;
  except
    on E: Exception do
    begin
       MsgBox('"Prezado Cliente"'#13'Erro ao carregar o caminho do relatório: ' + E.Message, MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrmParametros.FormShow(Sender: TObject);
begin
  edtCaminhoPasta.TextHint := 'Selecione o caminho dos relatórios fastReport (*.fr3).';
  edtCaminhoPasta.ReadOnly := True;  // Deixar o Edit apenas leitura
  // Chama o método para carregar o caminho do relatório ao abrir a tela
  CarregarCaminhoRelatorio;

  edtCaminhoINI.TextHint := 'Selecione o caminho do banco de dados (*.ini).';
  edtCaminhoINI.ReadOnly := True;  // Deixar o Edit apenas leitura
  // Chama o método para carregar o caminho do relatório ao abrir a tela
  CarregarCaminhoConfigBD;
end;

procedure TfrmParametros.SalvarCaminhoRelatorio;
var
  CaminhoPasta, CaminhoPastaINI: String;
  vQuery: TFDQuery;
begin
  try
    // Obtém o caminho da pasta do TEdit
    CaminhoPasta := Trim(edtCaminhoPasta.Text);

    // Verifica se o caminho foi informado
    if CaminhoPasta = EmptyStr then
    begin
      MsgBox('"Prezado Cliente"'#13'O caminho não pode estar vazio.', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    // Cria a query dinamicamente
    vQuery := TFDQuery.Create(nil);
    DMPrincipal.FireTransCon.StartTransaction;
    try
      vQuery.Connection := DMPrincipal.FireDacCon;

      // Verifica se já existe um caminho cadastrado
      vQuery.Close;
      vQuery.SQL.Clear;
      vQuery.SQL.Text := 'SELECT CaminhoRelatorio FROM parametros';
      vQuery.Open;

      if not vQuery.IsEmpty then
      begin
        // Se já existe um caminho, faz um UPDATE
        vQuery.Close;
        vQuery.SQL.Text := 'UPDATE parametros SET CaminhoRelatorio = :CaminhoRelatorio';
        vQuery.ParamByName('CaminhoRelatorio').AsString := CaminhoPasta;
        vQuery.ExecSQL;
      end
      else
      begin
        // Se não existe, faz um INSERT
        vQuery.Close;
        vQuery.SQL.Text := 'INSERT INTO parametros (CaminhoRelatorio) VALUES (:CaminhoRelatorio)';
        vQuery.ParamByName('CaminhoRelatorio').AsString := CaminhoPasta;
        vQuery.ExecSQL;
      end;
      CommitRFD;

      MsgBox('"Prezado Cliente"'#13'Parametros atualizado com sucesso.', MB_OK + MB_ICONINFORMATION);

    finally
      vQuery.Free;
    end;
  except
    on E: Exception do
    begin
      MsgBox('"Prezado Cliente"'#13'Erro ao salvar o caminho do relatório. ' + E.Message, MB_OK + MB_ICONEXCLAMATION);
      RollBackRFD;
    end;
  end;
end;

procedure TfrmParametros.CarregarCaminhoConfigBD;
var
  vQuery: TFDQuery;
  CaminhoConfigBD: string;
begin
  try
    // Cria a query dinamicamente
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Connection := DMPrincipal.FireDacCon;

      // Verifica se já existe um caminho cadastrado
      vQuery.Close;
      vQuery.SQL.Clear;
      vQuery.SQL.Text := 'SELECT CaminhoConfigBD FROM parametros';
      vQuery.Open;

      if not vQuery.IsEmpty then
      begin
        // Se existir, carrega o caminho no TEdit
        CaminhoConfigBD := vQuery.FieldByName('CaminhoConfigBD').AsString;
        edtCaminhoINI.Text := CaminhoConfigBD;
      end
      else
      begin
        // Caso não exista, você pode informar ao usuário ou deixar o campo em branco
        edtCaminhoINI.Clear;
      end;
    finally
      vQuery.Free;
    end;
  except
    on E: Exception do
    begin
      MsgBox('"Prezado Cliente"'#13'Erro ao carregar o caminho de configuração do banco de dados: ' + E.Message, MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrmParametros.SalvarCaminhoConfigBD;
var
  CaminhoBD: String;
  vQuery: TFDQuery;
begin
  try
    // Obtém o caminho do banco de dados do TEdit
    CaminhoBD := Trim(edtCaminhoINI.Text);

    // Verifica se o caminho foi informado
    if CaminhoBD = EmptyStr then
    begin
      MsgBox('"Prezado Cliente"'#13'O caminho do banco de dados não pode estar vazio.', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    // Cria a query dinamicamente
    vQuery := TFDQuery.Create(nil);
    DMPrincipal.FireTransCon.StartTransaction;
    try
      vQuery.Connection := DMPrincipal.FireDacCon;

      // Verifica se já existe um caminho cadastrado
      vQuery.Close;
      vQuery.SQL.Clear;
      vQuery.SQL.Text := 'SELECT CaminhoConfigBD FROM parametros';
      vQuery.Open;

      if not vQuery.IsEmpty then
      begin
        // Se já existe um caminho, faz um UPDATE
        vQuery.Close;
        vQuery.SQL.Text := 'UPDATE parametros SET CaminhoConfigBD = :CaminhoConfigBD';
        vQuery.ParamByName('CaminhoConfigBD').AsString := CaminhoBD;
        vQuery.ExecSQL;
      end
      else
      begin
        // Se não existe, faz um INSERT
        vQuery.Close;
        vQuery.SQL.Text := 'INSERT INTO parametros (CaminhoConfigBD) VALUES (:CaminhoConfigBD)';
        vQuery.ParamByName('CaminhoConfigBD').AsString := CaminhoBD;
        vQuery.ExecSQL;
      end;

      DMPrincipal.FireTransCon.Commit;

      MsgBox('"Prezado Cliente"'#13'O caminho do banco de dados foi atualizado com sucesso.', MB_OK + MB_ICONINFORMATION);

    finally
      vQuery.Free;
    end;
  except
    on E: Exception do
    begin
      MsgBox('"Prezado Cliente"'#13'Erro ao salvar o caminho do banco de dados: ' + E.Message, MB_OK + MB_ICONEXCLAMATION);
      DMPrincipal.FireTransCon.Rollback;
    end;
  end;
end;




end.

unit unCadastroClientes1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, MaskUtils, Data.DB;

type
  TfrmCadastroClientes1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtCPF: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtEndereco: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    Label7: TLabel;
    procedure edtCPFExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
  private
    Fechar: Boolean;
    Cancelou: Boolean;
    function ValidarGravar: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroClientes1: TfrmCadastroClientes1;

implementation

{$R *.dfm}

uses
  unModPrincipal, unModCadastros, uUtil;

function TfrmCadastroClientes1.ValidarGravar: Boolean;
begin
  Result := True;

  if Trim(edtCPF.Text) = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'CPF do cliente deve ser informado.', MB_OK + MB_ICONINFORMATION);
    edtCPF.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtNome.Text) = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'Nome do cliente deve ser informado.', MB_OK + MB_ICONINFORMATION);
    edtNome.SetFocus;
    Result := False;
    Exit;
  end;
end;

procedure TfrmCadastroClientes1.btnCancelarClick(Sender: TObject);
begin
  if DMPrincipal.FireDacCon.InTransaction then
    RollBackRFD;

  with dtCadastros do
  begin
    Clientes.Cancel;
    Clientes.CancelUpdates;
  end;

  Self.Cancelou := True;
  Fechar := True;
  Self.Close;
end;

procedure TfrmCadastroClientes1.btnGravarClick(Sender: TObject);
var
  str: String;
begin
  if (ValidarGravar) then
  begin
    with dtCadastros do
    begin
      try
        // Iniciar a transação
        DMPrincipal.FireTransCon.StartTransaction;

        Clientes.Edit;
        ClientesNOME_COMPLETO.Value := edtNome.Text;
        ClientesCPF_CNPJ.Value := edtCPF.Text;
        ClientesTELEFONE.Value := edtTelefone.Text;
        ClientesEMAIL.Value := edtEmail.Text;
        ClientesENDERECO_COMPLETO.Value := edtEndereco.Text;
        Clientes.Post;

        if (Clientes.CachedUpdates) then
        begin
          AplicarDados(Clientes);
        end;
        CommitRFD;

        edtCodigo.Clear;
        edtNome.Clear;
        edtCPF.Clear;
        edtTelefone.Clear;
        edtEmail.Clear;

        Fechar := True;
        Self.Close;
      except
        on E: Exception do
        begin
          MsgBox('"Prezado Cliente"'#13'Não foi possível gravar o registro.' + #13, MB_OK + MB_ICONERROR);
          RollBackRFD;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadastroClientes1.edtCPFExit(Sender: TObject);
begin
  if edtCPF.Text <> EmptyStr then
  begin
    if Length(RemoverFormatoCPF_CNPJ(edtCPF.Text)) <= 11 then
    begin
      if not ValidarCPF(RemoverFormatoCPF_CNPJ(edtCPF.Text)) then
      begin
        MsgBox('"Prezado Cliente"'#13'CPF inválido!.', MB_OK + MB_ICONINFORMATION);
        edtCPF.SetFocus;
        Exit;
      end;
    end
    else
    begin
      if not ValidarCNPJ(RemoverFormatoCPF_CNPJ(edtCPF.Text)) then
      begin
        MsgBox('"Prezado Cliente"'#13'CNPJ inválido!.', MB_OK + MB_ICONINFORMATION);
        edtCPF.SetFocus;
        Exit;
      end;
    end;

    edtCPF.Text := FormatMaskText('000\.000\.000\-00;0;', RemoverFormatoCPF_CNPJ(edtCPF.Text));
  end;
end;

procedure TfrmCadastroClientes1.edtTelefoneExit(Sender: TObject);
begin
  edtTelefone.Text := AplicarMascaraDinamica(edtTelefone.Text);
end;

procedure TfrmCadastroClientes1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not Fechar then
  begin
    btnCancelar.OnClick(Sender);
    CanClose := Fechar;
  end;
end;

procedure TfrmCadastroClientes1.FormShow(Sender: TObject);
begin
  with dtCadastros do
  begin
    if Clientes.State = dsEdit then
    begin
      edtCodigo.Text := IntToStr(ClientesID_CLIENTE.Value);
      edtNome.Text := ClientesNOME_COMPLETO.Value;
      edtCPF.Text := FormatMaskText('000\.000\.000\-00;0;', RemoverFormatoCPF_CNPJ(ClientesCPF_CNPJ.Value));
      edtEndereco.Text := ClientesENDERECO_COMPLETO.Value;
      edtTelefone.Text := ClientesTELEFONE.Value;
      edtEmail.Text := ClientesEMAIL.Value;
    end;
  end;

  edtNome.SetFocus;
end;

end.

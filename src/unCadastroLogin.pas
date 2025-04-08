unit unCadastroLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCadastro = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    edtNome: TEdit;
    edtCPF: TEdit;
    edtRG: TEdit;
    edtEmail: TEdit;
    edtCelular: TEdit;
    edtTelefone: TEdit;
    Shape7: TShape;
    Label2: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    Shape10: TShape;
    edtLogin: TEdit;
    Shape11: TShape;
    btnSalvar: TSpeedButton;
    Shape12: TShape;
    btnFechar: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    //Função de incriptação da senha
    Function MD5String(Const Value : String): String;
    Procedure LimparCampos;
    function Validar: Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

uses unModCadastros, unModPrincipal, IdHashMessageDigest, uUtil;


procedure TfrmCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro.LimparCampos;
begin
  edtNome.Text := '';
  edtCPF.Text:= '';
  edtRG.Text:= '';
  edtEmail.Text:= '';
  edtCelular.Text:= '';
  edtTelefone.Text:= '';
  edtLogin.Text:= '';
  edtSenha.Text:= '';
  edtConfirmarSenha.Text := '';
end;

function TfrmCadastro.MD5String(const Value: String): String;
var
   xMD5: TIdHashMessageDigest5;
begin
  //Encripitando os a string
  xMD5 := TIdHashMessageDigest5.Create;
  try
    Result := xMD5.HashStringAsHex(Value);
  finally
    xMD5.Free;
  end;
end;

function TfrmCadastro.Validar: Boolean;
begin
  Result := False;

  if edtNome.Text = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'Preencha o nome para cadastrar no sistema.', MB_OK + MB_ICONINFORMATION);
    edtNome.SetFocus;
    Exit;
  end;

  if edtLogin.Text = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'Preencha o login para cadastrar no sistema.', MB_OK + MB_ICONINFORMATION);
    edtLogin.SetFocus;
    Exit;
  end;

  if edtSenha.Text = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'Preencha a senha para cadastrar no sistema.', MB_OK + MB_ICONINFORMATION);
    edtSenha.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure TfrmCadastro.btnSalvarClick(Sender: TObject);
begin
  if not Validar then
    Exit;

  //Gravando as informações no banco
  dtCadastros := TdtCadastros.Create(Self);
  try
    with dtCadastros do
    begin
      // Iniciar a transação
      DMPrincipal.FireTransCon.StartTransaction;
      User.Insert;

      UserNOME.AsString := edtNome.Text;
      UserCPF.AsString := edtCPF.Text;
      UserRG.AsString := edtRG.Text;
      UserEMAIL.AsString := edtEmail.Text;
      UserCEL.AsString := edtCelular.Text;
      UserTEL.AsString := edtTelefone.Text;
      UserLOGIN.AsString := edtLogin.Text;
      UserSENHA.AsString := MD5String(edtSenha.Text);

      if edtSenha.Text = edtConfirmarSenha.Text then
      begin
        User.Post;
        if (User.CachedUpdates) then
        begin
          AplicarDados(User);
        end;

        CommitRFD;
        LimparCampos;
        Self.Close;
      end
      else
      begin
        MsgBox('"Prezado Cliente"'#13'Senha diferente no campo de confirmação!', MB_OK + MB_ICONINFORMATION);
        edtSenha.SetFocus;
        Exit;
      end;
    end;

  finally
    FreeAndNil(dtCadastros)
  end;

end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  edtNome.SetFocus;
end;

end.

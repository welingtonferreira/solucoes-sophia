unit unLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    pnlLoginArea: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Shape3: TShape;
    btnEntrar: TSpeedButton;
    Shape4: TShape;
    btnCadastrar: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Function MD5String(Const Value : String): String;
    function Validar: Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  unCadastroLogin, unPrincipal, unModSelecoes, IdHashMessageDigest, uUTil;

{$R *.dfm}

procedure TfrmLogin.btnCadastrarClick(Sender: TObject);
var
  TelaCadastro: TfrmCadastro;
begin
  TelaCadastro := TfrmCadastro.Create(nil);
  TelaCadastro.ShowModal;
  FreeAndNil(TelaCadastro);
end;

function TfrmLogin.MD5String(const Value: String): String;
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

function TfrmLogin.Validar: Boolean;
begin
  Result := False;

  if edtLogin.Text = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'Preencha o login para acessar o sistema.', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if edtSenha.Text = EmptyStr then
  begin
    MsgBox('"Prezado Cliente"'#13'Preencha a senha para acessar o sistema.', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  Result := True;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  if not Validar then
    Exit;

  dtSelecoes := TdtSelecoes.Create(Self);
  try
    with dtSelecoes do
    begin
      ConsUser.Close;
      with ConsUser do
      begin
        if edtLogin.Text = EmptyStr then
          ParamByName('LOGIN').AsString := '?'
        else
          ParamByName('LOGIN').AsString := edtLogin.Text;

        ConsUser.Open;

        if ConsUser.RecordCount > 0 then
        begin
          if FieldByName('SENHA').AsString = MD5String(edtSenha.Text) then
          begin
            MsgBox('"Prezado Cliente"'#13'Seja bem vindo: ' + ConsUserNOME.AsString, MB_OK+MB_ICONINFORMATION);

            GLOBAL_USER.NOME := ConsUserNOME.Value;
            GLOBAL_USER.LOGIN := ConsUserLOGIN.Value;
            GLOBAL_USER.ID_USUARIO := ConsUserID.Value;
            GLOBAL_USER.ADMINISTRADOR := ConsUserADMINISTRADOR.Value;

            // Minimize a aplicação para garantir que ela permaneça visível na barra de tarefas
            Application.Minimize;

            // Cria o formulário principal
            Application.CreateForm(TfrmPrincipal, frmPrincipal);

            try
              // Restaura a aplicação para que o ícone apareça na barra de tarefas

              Application.Restore;

              // Exibe o frmPrincipal
              frmPrincipal.Show;
              Application.ProcessMessages; // Garante que a interface seja atualizada
              while frmPrincipal.Visible do
                Application.ProcessMessages; // Mantém a aplicação responsiva enquanto o frmPrincipal está ativo
            finally
              FreeAndNil(frmPrincipal); // Libera o formulário principal após o uso
            end;
          end
          else
          begin
            MsgBox('"Prezado Cliente"'#13'Senha incorreta!', MB_OK + MB_ICONINFORMATION);
            edtSenha.SetFocus;
            Exit;
          end;
        end
        else
        begin
          MsgBox('"Prezado Cliente"'#13'Usuario não cadastrado!', MB_OK + MB_ICONINFORMATION);
          edtLogin.SetFocus;
          Exit;
        end;
      end;
    end;
  finally
    FreeAndNil(dtSelecoes);
  end;
end;

procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = 13 then
   btnEntrarClick(Self);

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  Application.MainFormOnTaskBar := True;
end;

end.

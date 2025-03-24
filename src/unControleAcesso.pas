unit unControleAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Vcl.Buttons, Data.DB, FireDAC.Comp.Client,
  Vcl.Imaging.jpeg, Vcl.ComCtrls, StdCtrls, Grids, DBGrids, ADODB,ComObj, Mask,
  OleServer, ExcelXP, DBCtrls, Vcl.Imaging.pngimage, Vcl.Themes, Vcl.Styles,
  System.ImageList, Vcl.ImgList;

  type
  TPermissao = Record
    DS_CAPTION  : String;
    DS_NAME     : String;
    FG_PERMITIR : Boolean;
  end;

  PPermissao = ^TPermissao;

type
  TMenuSincronizar = Record
    Principal: String;
    Sincro   : String;
    Mutua    : Boolean;
  end;


type
  TfrmControleAcesso = class(TForm)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel1: TPanel;
    trvPermissao: TTreeView;
    GroupBox1: TGroupBox;
    gpbCliente: TGroupBox;
    btnConsUsuario: TSpeedButton;
    edtNome: TEdit;
    edtCodigo: TEdit;
    chkAdministrador: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConsUsuarioClick(Sender: TObject);
    procedure trvPermissaoClick(Sender: TObject);
    procedure trvPermissaoEnter(Sender: TObject);
    procedure trvPermissaoExit(Sender: TObject);
    procedure trvPermissaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkAdministradorClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FPreventClick: Boolean;
    FMenuPrincipal: TMainMenu;
    procedure MenuPermissao(Node: TTreeNode; StateIndex: Integer);
    procedure MenuPermissaoParent(Node: TTreeNode; StateIndex: Integer);
    procedure ToggleTreeViewCheckBoxes(Node: TTreeNode; cUnChecked, cChecked: Integer);
    procedure CarregarMenuPermissao;
    procedure AtualizarMenuPermissao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleAcesso: TfrmControleAcesso;

const
  cFlatUnCheck = 1;
  cFlatChecked = 2;

implementation

{$R *.dfm}

uses
  uUtil, unPrincipal, unModPrincipal, uConsultaUsuarios;

procedure TfrmControleAcesso.MenuPermissaoParent(Node: TTreeNode; StateIndex: Integer);
var
  NodeP: TTreeNode;
  Permissao: PPermissao;
begin
  NodeP := Node.Parent;

  repeat

    NodeP.ImageIndex    := 0;
    NodeP.SelectedIndex := 0;
    NodeP.StateIndex    := StateIndex;

    PPermissao(NodeP.Data).FG_PERMITIR := Node.StateIndex = cFlatChecked;

    NodeP := NodeP.Parent;

  until not Assigned( NodeP );
end;

procedure TfrmControleAcesso.trvPermissaoClick(Sender: TObject);
var
  P: TPoint;
  Node: TTreeNode;
begin
  inherited;

  // Verifica se o TreeView está no modo somente leitura
  if (trvPermissao.ReadOnly) then
    Exit;

  // Obtém a posição do cursor para detectar o item clicado
  GetCursorPos(P);
  P := trvPermissao.ScreenToClient(P);

  // Verifica se o clique foi na área do ícone de estado (checkbox)
  if (htOnStateIcon in trvPermissao.GetHitTestInfoAt(P.X, P.Y)) then
  begin
    // A linha a seguir garante que o nó clicado será o único alterado
    Node := trvPermissao.GetNodeAt(P.X, P.Y); // Obtém o nó diretamente com base na posição do clique

    // Altera o estado do checkbox do nó clicado
    if Assigned(Node) then
    begin
      ToggleTreeViewCheckBoxes(Node, cFlatUnCheck, cFlatChecked);
    end;
  end;
end;


procedure TfrmControleAcesso.trvPermissaoEnter(Sender: TObject);
begin
  KeyPreview := False;
  trvPermissao.Color := $00DDFFFF;
end;

procedure TfrmControleAcesso.trvPermissaoExit(Sender: TObject);
begin
  KeyPreview := True;
  trvPermissao.Color := clWindow;
end;

procedure TfrmControleAcesso.trvPermissaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( trvPermissao.ReadOnly ) then
    Exit;

  if ( Key = VK_SPACE ) and Assigned( trvPermissao.Selected ) then
    ToggleTreeViewCheckBoxes( trvPermissao.Selected, cFlatUnCheck, cFlatChecked );
end;

procedure TfrmControleAcesso.MenuPermissao(Node: TTreeNode; StateIndex: Integer);
var
  NodeP: TTreeNode;
  Permissao: PPermissao;
  DSName: string;
begin
  NodeP := Node.getFirstChild;

  repeat

    // Ignoramos o estado do item "Manutencao de Usuarios" para o ADMINISTRADOR, pois ele nao podera ser desabilitado para este usuario
    if (
         (
           ( PPermissao(Node.Data).DS_NAME = 'mnCadastro' ) or
           ( PPermissao(Node.Data).DS_NAME = 'mniControleAcessoUsuario' ) or
           ( PPermissao(Node.Data).DS_NAME = 'mniCadastroUsuario' )
         ) and
         ( chkAdministrador.Checked )
       ) then
      NodeP := Node.GetNextChild( NodeP )
    else
    begin

      NodeP.ImageIndex    := 0;
      NodeP.SelectedIndex := 0;
      NodeP.StateIndex    := StateIndex;
      PPermissao(NodeP.Data).FG_PERMITIR := Node.StateIndex = cFlatChecked;

      if Assigned( NodeP ) then
        if NodeP.HasChildren then
          MenuPermissao(NodeP, NodeP.StateIndex);

      NodeP := Node.GetNextChild( NodeP );

    end;

  until not Assigned( NodeP );
end;

procedure TfrmControleAcesso.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmControleAcesso.btnConfirmarClick(Sender: TObject);
var
  vQuery: TFDQuery;
begin
  AtualizarMenuPermissao;
  trvPermissao.Items.Clear; // Limpar TreeView
  btnConfirmar.Enabled := False;
  MsgBox('"Prezado Cliente"'#13'As permissões foram salvas com sucesso.', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmControleAcesso.btnConsUsuarioClick(Sender: TObject);
var
  vQuery: TFDQuery;
begin
  trvPermissao.Items.Clear; // Limpar TreeView
  frmConsultaUsuarios := TfrmConsultaUsuarios.Create(Self);
  frmConsultaUsuarios.ShowModal;

  if ( frmConsultaUsuarios.ModalResult = mrOk ) and ( not frmConsultaUsuarios.qryConsUsuarios.IsEmpty ) then
  begin
    edtCodigo.Text := frmConsultaUsuarios.qryConsUsuarios.FieldByName('ID').AsString;
    edtNome.Text := frmConsultaUsuarios.qryConsUsuarios.FieldByName('LOGIN').AsString;

    FPreventClick := True;  // Impede que o evento OnClick seja chamado
    chkAdministrador.Enabled := True;
    chkAdministrador.Checked :=  frmConsultaUsuarios.qryConsUsuarios.FieldByName('ADMINISTRADOR').AsBoolean;
  end;
  FreeAndNil(frmConsultaUsuarios);

  if chkAdministrador.Checked then
  begin
    MsgBox('"Prezado Cliente"'#13'O usuário selecionado já possui permissões administrativas. Não é necessário fazer alterações nas permissões.', MB_OK + MB_ICONINFORMATION);
    FPreventClick := False;  // Reabilitar o evento
    trvPermissao.Enabled := False;
    Exit;
  end;

  if Trim(edtCodigo.Text) = EmptyStr then
  begin
    chkAdministrador.Enabled := False;
    MsgBox('"Prezado Cliente"'#13'Selecione um usuário para alterar permissões.', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  FPreventClick := False;  // Reativa a execução do evento OnClick
  btnConfirmar.Enabled := True;
  trvPermissao.Enabled := True;

  // Chamar o método para popular o TreeView com permissões
  CarregarMenuPermissao;
end;

procedure TfrmControleAcesso.ToggleTreeViewCheckBoxes(Node: TTreeNode; cUnChecked, cChecked: Integer);
begin

  if Assigned( Node ) then
  begin

    if (
         (
           ( PPermissao(Node.Data).DS_NAME = 'mnCadastro' ) or
           ( PPermissao(Node.Data).DS_NAME = 'mniControleAcessoUsuario' ) or
           ( PPermissao(Node.Data).DS_NAME = 'mniCadastroUsuario' )
         )
         and  ( chkAdministrador.Checked )) then
    begin
      MsgBox('"Prezado Cliente"'#13'Esta opção não pode ser desmarcada para o Usuário ADMINISTRADOR.', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if ( Node.StateIndex = cUnChecked ) then
      Node.StateIndex := cChecked
    else if ( Node.StateIndex = cChecked ) then
      Node.StateIndex := cUnChecked;

    PPermissao(Node.Data).FG_PERMITIR := Node.StateIndex = cChecked;

    if ( Node.StateIndex = cChecked ) and ( Assigned(Node.Parent) ) then
      MenuPermissaoParent(Node, Node.StateIndex);

    if ( Node.HasChildren ) then
      MenuPermissao(Node, Node.StateIndex);
  end;

end;

//
procedure TfrmControleAcesso.CarregarMenuPermissao;
var
  Node, SubNode: TTreeNode;
  vQuery: TFDQuery;
  MenuItem, SubMenuItem: TMenuItem;
  ExisteRegistro: Boolean;
  i, j: Integer;
begin
  trvPermissao.Items.Clear;
  if FMenuPrincipal = nil then
    FMenuPrincipal := frmPrincipal.mnPrincipal;

  // Consulta permissões do banco de dados
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := DMPrincipal.FireDacCon;
    vQuery.SQL.Text := 'SELECT codigo_menu, caption_menu, permitir ' +
                       'FROM controle_acesso ' +
                       'WHERE id_usuario = :id_usuario';
    vQuery.ParamByName('id_usuario').AsInteger := StrToInt(edtCodigo.Text);
    vQuery.Open;

    ExisteRegistro := not vQuery.IsEmpty;

    // Carregar o menu principal
    for i := 0 to FMenuPrincipal.Items.Count - 1 do
    begin
      MenuItem := FMenuPrincipal.Items[i];

      // Validar separadores ou itens desabilitados
      if (Trim(MenuItem.Caption) <> '-') and
         (UpperCase(RightStr(MenuItem.Name, 12)) <> 'DESABILITADO') then
      begin
        // Adiciona o nó principal
        Node := trvPermissao.Items.Add(nil, StringReplace(MenuItem.Caption, '&', '', [rfReplaceAll]));
        Node.Data := AllocMem(SizeOf(TPermissao));
        PPermissao(Node.Data)^.DS_CAPTION := MenuItem.Caption;
        PPermissao(Node.Data)^.DS_NAME := MenuItem.Name;

        if ExisteRegistro and vQuery.Locate('caption_menu', MenuItem.Caption, []) then
          Node.Checked := vQuery.FieldByName('permitir').AsInteger = 1
        else
          Node.Checked := False;

        // Adiciona submenus
        for j := 0 to MenuItem.Count - 1 do
        begin
          SubMenuItem := MenuItem.Items[j];

          // Validar separadores ou itens desabilitados
          if (Trim(SubMenuItem.Caption) <> '-') and
             (UpperCase(RightStr(SubMenuItem.Name, 12)) <> 'DESABILITADO') then
          begin
            SubNode := trvPermissao.Items.AddChild(Node, StringReplace(SubMenuItem.Caption, '&', '', [rfReplaceAll]));
            SubNode.Data := AllocMem(SizeOf(TPermissao));
            PPermissao(SubNode.Data)^.DS_CAPTION := SubMenuItem.Caption;
            PPermissao(SubNode.Data)^.DS_NAME := SubMenuItem.Name;

            if ExisteRegistro and vQuery.Locate('caption_menu', SubMenuItem.Caption, []) then
              SubNode.Checked := vQuery.FieldByName('permitir').AsInteger = 1
            else
              SubNode.Checked := False;
          end;
        end;
      end;
    end;
  finally
    vQuery.Free;
  end;
end;

procedure TfrmControleAcesso.chkAdministradorClick(Sender: TObject);
var
  vQuery: TFDQuery;
  MsgResult: Integer;
begin
  // Verifica se a variável de controle está ativa
  if FPreventClick then
    Exit;

  // Criar a consulta para realizar o UPDATE no banco de dados
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := DMPrincipal.FireDacCon;  // Defina sua conexão FireDAC
    vQuery.Close;
    vQuery.SQL.Clear;

    if chkAdministrador.Checked then
    begin
      // Mensagem de confirmação antes de permitir a alteração para administrador
      MsgResult := MessageDlg('Você está prestes a alterar o usuário para administrador.'#13 +
                              'Tem certeza de que deseja continuar? Isso pode afetar a segurança do sistema.',
                              mtConfirmation, [mbYes, mbNo], 0);

      if MsgResult = mrYes then
      begin
        vQuery.Close;
        vQuery.SQL.Clear;
        // Atualiza o campo administrador para True
        vQuery.SQL.Text := 'UPDATE user ' +
                           'SET administrador = :administrador ' +
                           'WHERE id = :id';

        vQuery.ParamByName('administrador').AsBoolean := True;  // Habilitar administrador
        vQuery.ParamByName('id').AsInteger := StrToInt(edtCodigo.Text);
        vQuery.ExecSQL;  // Executar o update

        // Mensagem de sucesso
        MsgBox('O usuário foi atualizado como administrador.', MB_OK + MB_ICONINFORMATION);
        edtCodigo.Clear;
        edtNome.Clear;
        trvPermissao.Items.Clear;
      end
      else
      begin
        // Se o usuário clicar em "Não", desmarcar o checkbox
        FPreventClick := True;  // Desabilitar temporariamente o evento
        chkAdministrador.Checked := False;  // Desmarcar o checkbox
        FPreventClick := False;  // Reabilitar o evento
      end;
    end
    else
    begin
      // Se o checkbox for desmarcado, exibir mensagem de confirmação para remover as permissões de administrador
      MsgResult := MessageDlg('Você está prestes a remover o acesso de administrador para este usuário.'#13 +
                              'Tem certeza de que deseja continuar?', mtConfirmation, [mbYes, mbNo], 0);

      if MsgResult = mrYes then
      begin
        vQuery.Close;
        vQuery.SQL.Clear;
        // Atualiza o campo administrador para False
        vQuery.SQL.Text := 'UPDATE user ' +
                           'SET administrador = :administrador ' +
                           'WHERE id = :id';

        vQuery.ParamByName('administrador').AsBoolean := False;  // Remover permissões de administrador
        vQuery.ParamByName('id').AsInteger := StrToInt(edtCodigo.Text);
        vQuery.ExecSQL;  // Executar o update

        // Mensagem de sucesso
        MsgBox('O usuário foi removido como administrador.', MB_OK + MB_ICONINFORMATION);
        edtCodigo.Clear;
        edtNome.Clear;
        trvPermissao.Items.Clear;
      end
      else
      begin
        // Se o usuário clicar em "Não", manter o checkbox marcado
        FPreventClick := True;  // Desabilitar temporariamente o evento
        chkAdministrador.Checked := True;  // Manter o checkbox marcado
        FPreventClick := False;  // Reabilitar o evento
      end;
    end;
  except
    on E: Exception do
    begin
      // Mensagem de erro caso o update falhe
      MsgBox('Erro ao atualizar permissões: ' + E.Message, MB_OK + MB_ICONERROR);
    end;
  end;
  // Limpeza do objeto após o uso
  vQuery.Free;
end;

procedure TfrmControleAcesso.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F9 ) then
  btnConsUsuarioClick(btnConsUsuario);
end;

procedure TfrmControleAcesso.FormShow(Sender: TObject);
begin
  trvPermissao.Enabled := False;
  btnConfirmar.Enabled := False;
end;

procedure TfrmControleAcesso.AtualizarMenuPermissao;
var
  Node: TTreeNode;
  vQuery: TFDQuery;
  CodigoMenu, i: Integer;
begin
  DMPrincipal.FireTransCon.StartTransaction;
  try
    // Exclui permissões existentes para o usuário
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Close;
      vQuery.SQL.Clear;
      vQuery.Connection := DMPrincipal.FireDacCon;
      vQuery.SQL.Text := 'DELETE FROM controle_acesso WHERE id_usuario = :id_usuario';
      vQuery.ParamByName('id_usuario').AsInteger := StrToInt(edtCodigo.Text);
      vQuery.ExecSQL;
    finally
      vQuery.Free;
    end;

    // Insere as novas permissões
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Connection := DMPrincipal.FireDacCon;
      Node := trvPermissao.Items.GetFirstNode;

      CodigoMenu := 1000; // Código inicial
      i := 0; // Contador para incrementar dinamicamente

      while Node <> nil do
      begin
        if (Node.Data <> nil) and (PPermissao(Node.Data)^.DS_NAME <> '') then
        begin
          // Gerar o codigo_menu dinamicamente
          CodigoMenu := 1000 + i;
          Inc(i); // Incrementa o índice

          vQuery.Close;
          vQuery.SQL.Clear;
          vQuery.SQL.Text := 'INSERT INTO controle_acesso (id_usuario, codigo_menu, caption_menu, menu, permitir) ' +
                             'VALUES (:id_usuario, :codigo_menu, :caption_menu, :menu, :permitir)';
          vQuery.ParamByName('id_usuario').AsInteger := StrToInt(edtCodigo.Text);
          vQuery.ParamByName('codigo_menu').AsInteger := CodigoMenu;
          vQuery.ParamByName('caption_menu').AsString := PPermissao(Node.Data)^.DS_CAPTION;
          vQuery.ParamByName('menu').AsString := PPermissao(Node.Data)^.DS_NAME;
          vQuery.ParamByName('permitir').AsInteger := Integer(Node.Checked);
          vQuery.ExecSQL;
        end;

        Node := Node.GetNext; // Avança para o próximo nó
      end;
    finally
      vQuery.Free;
    end;

    CommitRFD;
    MsgBox('"Prezado Cliente"'#13'Permissões atualizadas com sucesso.', MB_OK + MB_ICONINFORMATION);
  except
    on E: Exception do
    begin
      MsgBox('"Prezado Cliente"'#13'Não foi possível gravar o registro.' + E.Message, MB_OK + MB_ICONERROR);
      RollbackRFD;
    end;
  end;
end;




end.

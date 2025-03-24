unit uUtil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Registry, ValEdit, Mask, DBXJson, jpeg, Clipbrd, DateUtils, DBGrids, MaskUtils,
  StrUtils, WinInet, WinSock, IdHTTP, ComObj, IniFiles, Math, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TUsuario = record
     NOME             : String;
     LOGIN            : String;
     ADMINISTRADOR    : Boolean;
     ID_USUARIO       : Integer;
   end;

const
  Pesos1: array[1..12] of Integer = (5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2);
  Pesos2: array[1..13] of Integer = (6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2);

procedure OrdenaGrid(Grid: TDBGrid; Coluna: TColumn; Table: String = ''; Complement: String = ''; OrderBy: String = ''; Linha: Integer = 0);
function ValidarEstoqueParaVenda(idProduto: Integer; quantidadeVenda: Integer): Boolean;
function ValidarCNPJ(const CNPJ: string): Boolean;
function ValidarCPF(const CPF: string): Boolean;
function MsgBox(Texto: String; Flags: LongInt): Integer; Overload;
function MsgBox(Controle: HWND; Texto: String; Flags: LongInt): Integer; Overload;
function RemoverFormatoCPF_CNPJ(const Texto: string): string;
function AplicarMascaraDinamica(const Numero: string): string;
function ValidarData(DataStr: string): TDateTime;
function TratarErroBanco(Erro: Exception): String;
function CarregarCaminhoRelatorio: string;
function RightStr(const S: string; Length: Integer): string;

var
  GLOBAL_USER: TUsuario;

implementation

uses
  unModPrincipal;

function ValidarCNPJ(const CNPJ: string): Boolean;
var
  I, Soma, Digito1, Digito2: Integer;
  CNPJNum: string;
begin
  CNPJNum := StringReplace(CNPJ, '.', '', [rfReplaceAll]);
  CNPJNum := StringReplace(CNPJNum, '-', '', [rfReplaceAll]);
  CNPJNum := StringReplace(CNPJNum, '/', '', [rfReplaceAll]);

  if Length(CNPJNum) <> 14 then
    Exit(False);

  // Verifica se todos os dígitos são iguais
  if (CNPJNum = StringOfChar(CNPJNum[1], 14)) then
    Exit(False);

  Soma := 0;
  for I := 1 to 12 do
    Soma := Soma + StrToInt(CNPJNum[I]) * Pesos1[I];
  Digito1 := Soma mod 11;
  if Digito1 < 2 then
    Digito1 := 0
  else
    Digito1 := 11 - Digito1;

  Soma := 0;
  for I := 1 to 13 do
    Soma := Soma + StrToInt(CNPJNum[I]) * Pesos2[I];
  Digito2 := Soma mod 11;
  if Digito2 < 2 then
    Digito2 := 0
  else
    Digito2 := 11 - Digito2;

  Result := (Digito1 = StrToInt(CNPJNum[13])) and
            (Digito2 = StrToInt(CNPJNum[14]));
end;

function ValidarCPF(const CPF: string): Boolean;
var
  I, Soma, Digito1, Digito2: Integer;
  CPFNum: string;
begin
  // Remove a máscara do CPF
  CPFNum := StringReplace(CPF, '.', '', [rfReplaceAll]);
  CPFNum := StringReplace(CPFNum, '-', '', [rfReplaceAll]);

  if Length(CPFNum) <> 11 then
    Exit(False);

  if CPFNum = StringOfChar(CPFNum[1], 11) then
    Exit(False);

  Soma := 0;
  for I := 1 to 9 do
    Soma := Soma + StrToInt(CPFNum[I]) * (10 - I);
  Digito1 := (Soma * 10) mod 11;
  if Digito1 = 10 then
    Digito1 := 0;

  Soma := 0;
  for I := 1 to 10 do
    Soma := Soma + StrToInt(CPFNum[I]) * (11 - I);
  Digito2 := (Soma * 10) mod 11;
  if Digito2 = 10 then
    Digito2 := 0;

  Result := (Digito1 = StrToInt(CPFNum[10])) and (Digito2 = StrToInt(CPFNum[11]));
end;

procedure OrdenaGrid(Grid: TDBGrid; Coluna: TColumn; Table: String = ''; Complement: String = ''; OrderBy: String = ''; Linha: Integer = 0);
var
  index: Integer;
  abrirConsulta: Boolean;
begin

  try
    if ( grid.DataSource.DataSet.State in [dsInsert, dsEdit] ) then
      Exit;

    abrirConsulta := grid.DataSource.DataSet.Active;
    grid.DataSource.DataSet.Close;

    if ( grid.DataSource.DataSet is TFDQuery ) then
    begin
      if ( Linha > 0 ) then
      begin
        if ( OrderBy <> '' ) then
          TFDQuery( grid.DataSource.DataSet ).SQL.Strings[Linha] := OrderBy
        else
        begin
          if ( Complement <> '' ) then
            TFDQuery( grid.DataSource.DataSet ).SQL.Strings[Linha] := 'ORDER BY ' + IfThen(Table <> '', Table+'.'+Coluna.FieldName+' '+Complement, Coluna.FieldName+' '+Complement)
          else
            TFDQuery( grid.DataSource.DataSet ).SQL.Strings[Linha] := 'ORDER BY ' + IfThen(Table <> '', Table+'.'+Coluna.FieldName, Coluna.FieldName);
        end;
      end
      else
      begin
        if ( OrderBy <> '' ) then
          TFDQuery( grid.DataSource.DataSet ).SQL.Strings[TFDQuery( grid.DataSource.DataSet ).SQL.Count-1] := OrderBy
        else
        begin
          if ( Complement <> '' ) then
            TFDQuery( grid.DataSource.DataSet ).SQL.Strings[TFDQuery( grid.DataSource.DataSet ).SQL.Count-1] := 'ORDER BY ' + IfThen(Table <> '', Table+'.'+Coluna.FieldName+' '+Complement, Coluna.FieldName+' '+Complement)
          else
            TFDQuery( grid.DataSource.DataSet ).SQL.Strings[TFDQuery( grid.DataSource.DataSet ).SQL.Count-1] := 'ORDER BY ' + IfThen(Table <> '', Table+'.'+Coluna.FieldName, Coluna.FieldName);

        end;
      end;
    end;

    if ( abrirConsulta ) then
      grid.DataSource.DataSet.Open;

    for index := 0 to Grid.Columns.Count-1 do
    begin
      Grid.Columns[index].Title.Font.Color := clWindowText;
      Grid.Columns[index].Title.Font.Style := [];
    end;

    Coluna.Title.Font.Color := clNavy;
    Coluna.Title.Font.Style := [fsBold];

  except
  end;

end;

function MsgBox(Texto: String; Flags: LongInt): Integer;
begin
  Result := Application.MessageBox(PWideChar(Texto), PWideChar('SisMaster'), Flags);
end;

function MsgBox(Controle: HWND; Texto: String; Flags: LongInt): Integer;
begin
  Result := MessageBox(Controle, PWideChar(Texto), PWideChar('SisMaster'), Flags);
end;

function RemoverFormatoCPF_CNPJ(const Texto: string): string;
begin
  Result := StringReplace(Texto, '.', '', [rfReplaceAll]); // Remove pontos
  Result := StringReplace(Result, '-', '', [rfReplaceAll]); // Remove hífen
  Result := StringReplace(Result, '/', '', [rfReplaceAll]); // Remove barra
end;

function AplicarMascaraDinamica(const Numero: string): string;
begin
  if Length(Numero) = 11 then
    Result := FormatMaskText('(00) 00000-0000;0;', Numero)
  else if Length(Numero) = 10 then
    Result := FormatMaskText('(00) 0000-0000;0;', Numero)
  else
    Result := Numero; // Retorna o número sem formatação se o tamanho for inválido
end;

function ValidarData(DataStr: string): TDateTime;
var
  Day, Month, Year: Integer;
  DataFormatada: TDateTime;
begin
  // Remover qualquer caractere não numérico (caso o usuário tenha colocado barras extras)
  DataStr := StringReplace(DataStr, '/', '', [rfReplaceAll]);

  // Verifica se a string tem exatamente 8 caracteres
  if Length(DataStr) = 8 then
  begin
    // Extrai os valores de dia, mês e ano
    Day := StrToInt(Copy(DataStr, 1, 2));
    Month := StrToInt(Copy(DataStr, 3, 2));
    Year := StrToInt(Copy(DataStr, 5, 4));

    // Verifica se a data é válida
    try
      DataFormatada := EncodeDate(Year, Month, Day);
      Result := DataFormatada;  // Retorna a data formatada se for válida
    except
      on E: EConvertError do
      begin
        raise Exception.Create('Data inválida!');
      end;
    end;
  end
  else
    raise Exception.Create('Formato de data inválido! A data deve ter o formato DDMMYYYY');
end;

function TratarErroBanco(Erro: Exception): String;
begin
  Result := 'Ocorreu um erro desconhecido. Entre em contato com o suporte.';

  // Verifica se o erro é relacionado a uma chave estrangeira
  if Pos('Cannot delete or update a parent row', Erro.Message) > 0 then
    Result := 'Não foi possível excluir o registro porque ele está associado a outros dados no sistema.'
  else if Pos('Duplicate entry', Erro.Message) > 0 then
    Result := 'Não foi possível inserir o registro porque já existe um registro com os mesmos dados.'
  else if Pos('Unknown column', Erro.Message) > 0 then
    Result := 'Erro na consulta: coluna desconhecida.'
  else if Pos('Access denied', Erro.Message) > 0 then
    Result := 'Acesso negado ao banco de dados. Verifique as permissões.';

  // Outros casos podem ser tratados aqui
end;

function ValidarEstoqueParaVenda(idProduto: Integer; quantidadeVenda: Integer): Boolean;
var
  EstoqueDisponivel: Integer;
  vQuery: TFDQuery;
begin
  Result := False;

  // Criar a query para buscar o saldo do produto
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := DMPrincipal.FireDacCon;

    // Criação de um componente TFDQuery (ou TSQLQuery) para executar a consulta SQL
    vQuery.SQL.Text := 'SELECT estoque_disponivel FROM produtos WHERE id_produto = :idProduto';
    vQuery.ParamByName('idProduto').AsInteger := idProduto;
    // Executa a consulta
    vQuery.Open;

    // Verifica se o produto foi encontrado
    if vQuery.RecordCount > 0 then
    begin
      // Obtém o estoque disponível do produto
      EstoqueDisponivel := vQuery.FieldByName('estoque_disponivel').AsInteger;

      // Verifica se a quantidade de venda é maior que o estoque disponível
      if quantidadeVenda > EstoqueDisponivel then
      begin
        // Exibe uma mensagem de erro se não houver estoque suficiente
        MsgBox('"Prezado Cliente"'#13'Estoque insuficiente para o produto. Estoque disponível: ' + IntToStr(EstoqueDisponivel), MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    end
    else
    begin
      // Caso o produto não exista no banco
      MsgBox('"Prezado Cliente"'#13'Produto não encontrado!', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  except
    on E: Exception do
    begin
      // Em caso de erro na consulta SQL
      MsgBox('"Prezado Cliente"'#13'Erro ao verificar o estoque: ' + E.Message, MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;

  Result := True;
end;

function CarregarCaminhoRelatorio: string;
var
  vQuery: TFDQuery;
  CaminhoRelatorio: string;
begin
  Result := '';  // Caso não encontre nenhum caminho, retorna uma string vazia
  try
    // Cria a query dinamicamente
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Connection := DMPrincipal.FireDacCon; // Assumindo que FDConnection está configurado

      // Verifica se já existe um caminho cadastrado
      vQuery.Close;
      vQuery.SQL.Clear;
      vQuery.SQL.Text := 'SELECT CaminhoRelatorio FROM parametros';
      vQuery.Open;

      if not vQuery.IsEmpty then
      begin
        // Se existir, obtém o caminho
        CaminhoRelatorio := vQuery.FieldByName('CaminhoRelatorio').AsString;

        // Verifica se o caminho existe
        if DirectoryExists(CaminhoRelatorio) then
        begin
          Result := CaminhoRelatorio;  // Retorna o caminho se existir
        end
        else
        begin
          // Caso o caminho não exista, exibe a mensagem
          MsgBox('"Prezado Cliente"'#13'Caminho dos relatórios parametrizados não existe, acesse "Cadastros -> Parâmetros Sistemas".', MB_OK + MB_ICONINFORMATION);
        end;
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

function RightStr(const S: string; Length: Integer): string;
begin
  if Length > 0 then
    Result := Copy(S, System.Length(S) - Length + 1, Length)  // Usando System.Length para evitar problemas
  else
    Result := '';  // Caso o comprimento seja inválido, retorna uma string vazia
end;

end.

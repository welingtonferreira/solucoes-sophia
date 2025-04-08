unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ComCtrls, ShellAPI, Buttons,
  pngimage, DateUtils;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Bevel2: TBevel;
    Bevel1: TBevel;
    imgSobre: TImage;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    lblVersaoSistema: TLabel;
    Label6: TLabel;
    lblAtualizacaoSistema: TLabel;
    GroupBox2: TGroupBox;
    lblLayOutBanco: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    lblAtualizacaoBanco: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses unModPrincipal, uUtil;

{$R *.dfm}

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  inherited;

  lblVersaoSistema.Caption      := '2025-04-08 - 0.0.0.1';
  lblAtualizacaoSistema.Caption := DateToStr(Date);

  lblLayOutBanco.Caption      := 'SQL Server 2019';
  lblAtualizacaoBanco.Caption := '2025';
end;

end.

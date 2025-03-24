unit uRelGraficoVendas1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Ani, FMX.Colors, FMX.Effects, FMX.DateTimeCtrls, FireDAC.Stan.Intf, Math,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.ListBox, FMX.SearchBox, FMX.ScrollBox, FMX.Memo, FMX.MultiView, FMX.TabControl, FMX.Memo.Types, System.Rtti, FMX.Grid.Style,
  FMX.Grid, Vcl.Printers, FMX.Printer;//, Vcl.Graphics;

type
  TfrmRelGraficoVendas1 = class(TForm)
    StyleBook1: TStyleBook;
    TabControl1: TTabControl;
    Verttical: TTabItem;
    BarHorzChart: TRectangle;
    ValoresGV: TMemo;
    Rectangle2: TRectangle;
    Rectangle1: TRectangle;
    Button2: TButton;
    Label5: TLabel;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    sStringRelatorio: String;
    { Public declarations }
  end;

var
  frmRelGraficoVendas1: TfrmRelGraficoVendas1;

implementation

{$R *.fmx}

uses uChart;

procedure TfrmRelGraficoVendas1.Button2Click(Sender: TObject);
begin
  BarHorzChart.ChartBarHorizontal('Quantidade de Vendas', ValoresGV.Text,'');
end;

procedure TfrmRelGraficoVendas1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TfrmRelGraficoVendas1.FormCreate(Sender: TObject);
begin
//  DataCC.Date := Now;
//  DataCC2.Date := Now;
end;

procedure TfrmRelGraficoVendas1.FormShow(Sender: TObject);
begin
  ValoresGV.Lines.Clear;
  ValoresGV.Lines.Add(sStringRelatorio);
  Button2Click(Self);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.

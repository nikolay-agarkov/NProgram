unit data_log;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ComCtrls, VclTee.TeeGDIPlus, VclTee.TeEngine, VclTee.Series,
  VclTee.TeeProcs, VclTee.Chart, VclTee.DBChart, VclTee.TeeDBCrossTab;

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    StringGrid1: TStringGrid;
    Timer_bd_data_log: TTimer;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Chart1: TChart;
    Series1: TLineSeries;
    procedure Timer_bd_data_logTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

uses System_, task;

procedure TForm8.Button2Click(Sender: TObject);
var
  i, j: integer;

  s, s1, s2: string;
  t1, t2: TDatetime;
begin
  t1 := Form8.DateTimePicker1.DateTime;
  DateTimeToString(s1, 'yyyy-mm-dd hh:mm:ss', t1);
  t2 := Form8.DateTimePicker2.DateTime;
  DateTimeToString(s2, 'yyyy-mm-dd hh:mm:ss', t2);
  s := 'SELECT `date_insert`,`sensor_id`,`rashod` FROM `records` where `date_insert` BETWEEN '
    + QuotedStr(s1) + ' and ' + QuotedStr(s2) + ';';

  for i := StringGrid1.FixedRows to StringGrid1.RowCount - 1 do
    StringGrid1.Rows[i].Clear;

  StringGrid1.Cells[0, 0] := '����/�����';
  StringGrid1.Cells[2, 0] := '������';
  StringGrid1.Cells[1, 0] := '# �������';

  Form1.SQLQuery2.Active := False;
  Form1.SQLQuery2.SQL.Clear;
  Form1.SQLQuery2.SQL.Add
    ('SELECT `date_insert`,`sensor_id`,`rashod` FROM `records` where `date_insert` BETWEEN '
    + QuotedStr(s1) + ' and ' + QuotedStr(s2) + ';');
  Form1.SQLQuery2.Active := True;
  Form1.SQLQuery2.First;
  StringGrid1.RowCount := Form1.SQLQuery2.RecordCount + 1;
  for j := 1 to Form1.SQLQuery2.RecordCount do
  begin
    for i := 0 to 2 do
    begin
      StringGrid1.Cells[i, j] := Form1.SQLQuery2.Fields[i].AsString;
    end;
    Form1.SQLQuery2.Next;
  end;

  with Chart1 do
  begin
    UndoZoom;
    Title.Text.Clear;
    Title.Text.Add('StringGrid');
    LeftAxis.AxisValuesFormat := '##.00';
    BottomAxis.Title.Caption := '����';
    LeftAxis.Title.Caption := '������';
    Repaint;
  end;
  With Series1 do
  begin
    Clear;
    for j := 1 to StringGrid1.RowCount - 1 do
    begin
      AddY(StrToInt(StringGrid1.Cells[2, j]));
    end;
  end;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0, 0] := '����/�����';
  StringGrid1.Cells[2, 0] := '������';
  StringGrid1.Cells[1, 0] := '# �������';

end;

procedure TForm8.Timer_bd_data_logTimer(Sender: TObject);
var
  i, j: integer;
begin
  for i := StringGrid1.FixedRows to StringGrid1.RowCount - 1 do
    StringGrid1.Rows[i].Clear;
  Form1.SQLQuery2.Active := False;
  Form1.SQLQuery2.SQL.Clear;
  Form1.SQLQuery2.SQL.Add
    ('SELECT `date_insert`,`sensor_id`,`rashod` FROM `records` ');
  Form1.SQLQuery2.Active := True;
  Form1.SQLQuery2.First;
  StringGrid1.RowCount := Form1.SQLQuery2.RecordCount + 1;
  for j := 1 to Form1.SQLQuery2.RecordCount do
  begin
    for i := 0 to 2 do
    begin
      StringGrid1.Cells[i, j] := Form1.SQLQuery2.Fields[i].AsString;
    end;
    Form1.SQLQuery2.Next;
  end;
end;

end.

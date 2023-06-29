unit task;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls,
  Vcl.WinXPickers;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    timer_bd_sc: TTimer;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    TimePicker1: TTimePicker;
    Label6: TLabel;
    TimePicker2: TTimePicker;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    Label7: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    Edit4: TEdit;
    Button4: TButton;
    Edit5: TEdit;
    Label14: TLabel;
    Edit6: TEdit;
    Label12: TLabel;
    StringGrid2: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure timer_bd_scTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses System_;

procedure TForm7.Button1Click(Sender: TObject);
var
s1,s2:string;
t1,t2:TDatetime;
begin

t1:=form7.TimePicker1.Time;
DateTimeToString(s1,'hh:mm:ss',t1) ;
t2:=form7.TimePicker2.Time;
DateTimeToString(s2,'hh:mm:ss',t2) ;

if (form7.Edit1.Text='') or (s1=s2) then
begin
  showmessage ('������! ��������� ��������� ������');
end
else
begin
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('INSERT INTO `task_schedule`( `ID_Zatvor`, `Time_Open`, `Time_Close`) VALUES ('+QuotedStr(edit1.text)+','+QuotedStr(s1)+','+QuotedStr(s2)+')') ;
    Form1.SQLQuery2.ExecSQL();
    Form1.SQLQuery2.SQL.Clear;
     showmessage ('������ ������ ������� ���������');

end;

end;

procedure TForm7.Button2Click(Sender: TObject);
begin
if form7.Edit2.Text<>'' then
begin
If MessageDlg('����������� �������� ������?', mtInformation, [mbNO, mbYES], 0)
    = mrYES Then
    begin
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('DELETE FROM `task_schedule` WHERE `id`='+QuotedStr(edit2.text));
    Form1.SQLQuery2.ExecSQL();
    Form1.SQLQuery2.SQL.Clear;
    form7.Edit2.Text:='';
    showmessage ('������ ������ ������� �������');
   end
  Else

end;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
if (form7.Edit3.Text='') or (form7.Edit5.Text='') or (form7.Edit6.Text='') or (form7.edit6.Text=form7.Edit5.Text) then
begin
  showmessage ('������! ��������� ��������� ������');
end
else
begin
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('INSERT INTO `task_humidity`(`ID_Zatvor`, `min`, `max`) VALUES ('+QuotedStr(edit3.text)+','+QuotedStr(edit5.text)+','+QuotedStr(edit6.text)+')') ;
    Form1.SQLQuery2.ExecSQL();
    Form1.SQLQuery2.SQL.Clear;
     showmessage ('������ ������ ������� ���������');

end;

end;

procedure TForm7.Button4Click(Sender: TObject);
begin

if form7.Edit4.Text<>'' then
begin
If MessageDlg('����������� �������� ������?', mtInformation, [mbNO, mbYES], 0)
    = mrYES Then
    begin
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('DELETE FROM `task_humidity` WHERE `id`='+QuotedStr(edit4.text));
    Form1.SQLQuery2.ExecSQL();
    Form1.SQLQuery2.SQL.Clear;
    form7.Edit4.Text:='';
    showmessage ('������ ������ ������� �������');
   end
  Else

end;


end;

procedure TForm7.FormCreate(Sender: TObject);
begin
   form7.StringGrid1.Cells[0,0]:='# ������';
   form7.StringGrid1.Cells[1,0]:='# �������';
   form7.StringGrid1.Cells[2,0]:='����� �������� �������';
   form7.StringGrid1.Cells[3,0]:='����� �������� �������';

   form7.StringGrid2.Cells[0,0]:='# ������';
   form7.StringGrid2.Cells[1,0]:='# �������';
   form7.StringGrid2.Cells[2,0]:='% ��������� �����������';
   form7.StringGrid2.Cells[3,0]:='% ��������� ������������';


end;

procedure TForm7.timer_bd_scTimer(Sender: TObject);
var
i, j : integer;
begin

    for i := StringGrid1.FixedRows to StringGrid1.RowCount - 1 do StringGrid1.Rows[i].Clear;


    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('SELECT * FROM `task_schedule`') ;
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    form7.StringGrid1.RowCount:= form1.SQLQuery2.RecordCount+1;
    for j := 1 to form1.SQLQuery2.RecordCount do
       begin
       for i := 0 to 3 do
         begin
           form7.StringGrid1.Cells[i,j]:=Form1.SQLQuery2.Fields[i].AsString;
        end;
      form1.SQLQuery2.Next;
      end;

    for i := StringGrid2.FixedRows to StringGrid2.RowCount - 1 do StringGrid2.Rows[i].Clear;
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('SELECT * FROM `task_humidity`') ;
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    form7.StringGrid2.RowCount:= form1.SQLQuery2.RecordCount+1;
    for j := 1 to form1.SQLQuery2.RecordCount do
       begin
       for i := 0 to 3 do
         begin
           form7.StringGrid2.Cells[i,j]:=Form1.SQLQuery2.Fields[i].AsString;
        end;
      form1.SQLQuery2.Next;
      end;


end;

end.

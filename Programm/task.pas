unit task;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls,
  Vcl.WinXPickers, Data.FMTBcd, Data.DB, Data.SqlExpr;

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
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    task_h: TTimer;
    task_t: TTimer;
    sql_task_h: TSQLQuery;
    procedure FormCreate(Sender: TObject);
    procedure timer_bd_scTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure task_hTimer(Sender: TObject);
    procedure task_tTimer(Sender: TObject);
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
    showmessage ('Ошибка! Проверьте введенные данные');
  end
  else
  begin
      Form1.SQLQuery2.Active := False;
      Form1.SQLQuery2.SQL.Clear;
      Form1.SQLQuery2.SQL.Add  ('INSERT INTO `task_schedule`( `ID_Zatvor`, `Time_Open`, `Time_Close`) VALUES ('+QuotedStr(edit1.text)+','+QuotedStr(s1)+','+QuotedStr(s2)+')') ;
      Form1.SQLQuery2.ExecSQL();
      Form1.SQLQuery2.SQL.Clear;
       showmessage ('Данная задача успешно добавлена');

  end;

end;

procedure TForm7.Button2Click(Sender: TObject);
begin
if form7.Edit2.Text<>'' then
begin
If MessageDlg('Подтвертите удаление задачи?', mtInformation, [mbNO, mbYES], 0)
    = mrYES Then
    begin
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('DELETE FROM `task_schedule` WHERE `id`='+QuotedStr(edit2.text));
    Form1.SQLQuery2.ExecSQL();
    Form1.SQLQuery2.SQL.Clear;
    form7.Edit2.Text:='';
    showmessage ('Данная задача успешно удалена');
   end
  Else

end;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
if (form7.Edit3.Text='') or (form7.Edit5.Text='') or (form7.Edit6.Text='') or (form7.edit6.Text=form7.Edit5.Text) then
begin
  showmessage ('Ошибка! Проверьте введенные данные');
end
else
begin
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('INSERT INTO `task_humidity`(`ID_Zatvor`, `min`, `max`) VALUES ('+QuotedStr(edit3.text)+','+QuotedStr(edit5.text)+','+QuotedStr(edit6.text)+')') ;
    Form1.SQLQuery2.ExecSQL();
    Form1.SQLQuery2.SQL.Clear;
     showmessage ('Данная задача успешно добавлена');

end;

end;

procedure TForm7.Button4Click(Sender: TObject);
begin

if form7.Edit4.Text<>'' then
begin
If MessageDlg('Подтвертите удаление задачи?', mtInformation, [mbNO, mbYES], 0)
    = mrYES Then
    begin
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('DELETE FROM `task_humidity` WHERE `id`='+QuotedStr(edit4.text));
    Form1.SQLQuery2.ExecSQL();
    Form1.SQLQuery2.SQL.Clear;
    form7.Edit4.Text:='';
    showmessage ('Данная задача успешно удалена');
   end
  Else

end;


end;

procedure TForm7.FormCreate(Sender: TObject);
begin
    if form7.RadioButton2.Checked=true then
    begin
      panel4.Enabled:=true;
      panel4.Color:=clBtnFace;
      panel2.Color:=clMedGray;
      panel2.Enabled:=false;
    end;

   form7.StringGrid1.Cells[0,0]:='# задачи';
   form7.StringGrid1.Cells[1,0]:='# Затвора';
   form7.StringGrid1.Cells[2,0]:='Время открытия затвора';
   form7.StringGrid1.Cells[3,0]:='Время закрытия затвора';

   form7.StringGrid2.Cells[0,0]:='# задачи';
   form7.StringGrid2.Cells[1,0]:='# Затвора';
   form7.StringGrid2.Cells[2,0]:='% влажности минимальный';
   form7.StringGrid2.Cells[3,0]:='% влажности максимальный';
   if bd_c=true then
   begin
     if form7.RadioButton2.Checked=true then
        form7.task_h.Enabled:=true;
     if form7.RadioButton1.Checked=true then
        form7.task_t.Enabled:=true;
   end;

end;

procedure TForm7.RadioButton1Click(Sender: TObject);
begin
panel2.Enabled:=true;
panel2.Color:=clBtnFace;
panel4.Color:=clMedGray;
panel4.Enabled:=false;
form7.RadioButton1.Checked:=true;
form7.RadioButton2.Checked:=false;
task_t.Enabled:=true;
task_h.Enabled:=false;

end;

procedure TForm7.RadioButton2Click(Sender: TObject);
begin
panel4.Enabled:=true;
panel4.Color:=clBtnFace;
panel2.Color:=clMedGray;
panel2.Enabled:=false;
form7.RadioButton2.Checked:=true;
form7.RadioButton1.Checked:=false;

task_h.Enabled:=true;
task_t.Enabled:=false;
end;

procedure TForm7.task_hTimer(Sender: TObject);
var
i,j: integer;
m_min, m_max, m_zatvor: integer;
m_avv: double;
st:string;
begin
// Обработка автоматизации на датчиках влажности

    form7.sql_task_h.active := False;
    form7.sql_task_h.SQL.Clear;
    for i := 1 to 3 do // id затвора
    begin
      form7.sql_task_h.SQL.Add  ('select task_humidity.ID_Zatvor,  task_humidity.min, task_humidity.max, status_zatvor.average_value_h, status_zatvor.status FROM task_humidity inner JOIN status_zatvor ON status_zatvor.id= task_humidity.ID_Zatvor WHERE task_humidity.ID_Zatvor="'+inttostr(i)+'"');
      form7.sql_task_h.Active := True;


      if form7.sql_task_h.RecordCount>0 then
      begin
      form7.sql_task_h.First;
      st:=form7.sql_task_h.Fields[1].AsString;

        m_min:=strtoint(form7.sql_task_h.Fields[1].AsString);
        m_max:=strtoint(form7.sql_task_h.Fields[2].AsString);
        m_avv:=form7.sql_task_h.Fields[3].AsFloat;
        m_zatvor:=form7.sql_task_h.Fields[4].AsInteger;

      //Логическое условия открытия затворов и закрытия затворов
        if (m_avv > m_max)  then begin
          form7.sql_task_h.active := False;
          form7.sql_task_h.SQL.Clear;
          form7.sql_task_h.SQL.Add
           ('UPDATE `status_zatvor` SET `cmd` ="2", `open_level`="0" where `id` ="'+inttostr(i)+'" ');
          Form7.sql_task_h.ExecSQL();
        end else
        if (m_zatvor = 0 ) and (m_avv < m_min)  then begin
          form7.sql_task_h.active := False;
          form7.sql_task_h.SQL.Clear;
          form7.sql_task_h.SQL.Add
           ('UPDATE `status_zatvor` SET `cmd` ="1", `open_level`="100" where `id` ="'+inttostr(i)+'" ');
          Form7.sql_task_h.ExecSQL();
        end;

      end;
     form7.sql_task_h.active := False;
     form7.sql_task_h.SQL.Clear;

   end;

end;

procedure TForm7.task_tTimer(Sender: TObject);
var
i,j: integer;
t_h_o, t_m_o, t_h_c, t_m_c, tn_h, tn_m, status_gate: integer;

st, t_open, t_close:string;
Res2: TDateTime;
begin
  // Обработка автоматизации на времени
    Res2 := Time;
    st:=form1.Label6.Caption;
    tn_h:= strtoint(copy(st,0,2));
    tn_m:=  strtoint(copy(st,4,2));
    form7.sql_task_h.active := False;
  //  showmessage (st);

  //  showmessage(inttostr(tn_m));
  for i := 1 to 3 do // id затвора
    begin

      form7.sql_task_h.SQL.Clear;
      form7.sql_task_h.SQL.Add ('select task_schedule.ID_Zatvor, task_schedule.Time_Open, task_schedule.Time_Close, status_zatvor.status FROM task_schedule INNER JOIN status_zatvor on status_zatvor.id=task_schedule.ID_Zatvor WHERE task_schedule.ID_Zatvor="'+inttostr(i)+'"');
      form7.sql_task_h.Active := True;

     if form7.sql_task_h.RecordCount>0 then
     begin
        form7.sql_task_h.First;
        t_open:=form7.sql_task_h.Fields[1].AsString;
        t_close:=form7.sql_task_h.Fields[2].AsString;
        t_h_o:=strtoint(copy(t_open,0,2));
        t_m_o:=strtoint(copy(t_open,4,2));
        t_h_c:=strtoint(copy(t_close,0,2));
        t_m_c:=strtoint(copy(t_close,4,2));
        status_gate:=form7.sql_task_h.Fields[3].AsInteger;
        //Логическое условия открытия затворов и закрытия затворов
        //showmessage(inttostr(tn_h)+' '+inttostr(t_h_o));


        if (t_h_o < t_h_c) or ((t_h_o = t_h_c) and (t_m_o <= t_m_c)) then
        begin
          { Если временной интервал не пересекается с полуночью }
          if ((tn_h > t_h_o) or ((tn_h = t_h_o) and (tn_m >= t_m_o))) and
             ((tn_h < t_h_c) or ((tn_h = t_h_c) and (tn_m < t_m_c))) then
          begin
                    form7.sql_task_h.active := False;
                    form7.sql_task_h.SQL.Clear;
                    form7.sql_task_h.SQL.Add
                     ('UPDATE `status_zatvor` SET `cmd` ="1", `open_level`="100" where `id` ="'+inttostr(i)+'" ');
                    Form7.sql_task_h.ExecSQL();
          end
          else
          begin
                    form7.sql_task_h.active := False;
                    form7.sql_task_h.SQL.Clear;
                    form7.sql_task_h.SQL.Add
                     ('UPDATE `status_zatvor` SET `cmd` ="2", `open_level`="0" where `id` ="'+inttostr(i)+'" ');
                    Form7.sql_task_h.ExecSQL();
          end;
        end
        else
        begin
          { Если временной интервал пересекается с полуночью }
          if ((tn_h > t_h_o) or ((tn_h = t_h_o) and (tn_m >= t_m_o))) or
             ((tn_h < t_h_c) or ((tn_h = t_h_c) and (tn_m < t_m_c))) then
          begin
                    form7.sql_task_h.active := False;
                    form7.sql_task_h.SQL.Clear;
                    form7.sql_task_h.SQL.Add
                     ('UPDATE `status_zatvor` SET `status` ="1", `open_level`="100" where `id` ="'+inttostr(i)+'" ');
                    Form7.sql_task_h.ExecSQL();
          end
          else
          begin
                    form7.sql_task_h.active := False;
                    form7.sql_task_h.SQL.Clear;
                    form7.sql_task_h.SQL.Add
                     ('UPDATE `status_zatvor` SET `status` ="0", `open_level`="0" where `id` ="'+inttostr(i)+'" ');
                    Form7.sql_task_h.ExecSQL();
          end;
        end;


    end;



     form7.sql_task_h.active := False;
     form7.sql_task_h.SQL.Clear;

   end;

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

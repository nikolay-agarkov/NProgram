unit System_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.Menus, Data.DBXMySQL, Data.DB, Data.SqlExpr, Data.FMTBcd,
  Vcl.ComCtrls, Vcl.ButtonGroup, Vcl.Imaging.pngimage,IniFiles, Vcl.Grids,
  Vcl.Imaging.jpeg, Data.Win.ADODB, Datasnap.DBClient, Datasnap.Win.MConnect,
  Datasnap.Win.SConnect, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdSocksServer;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    Image4: TImage;
    Image5: TImage;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Label2: TLabel;
    Panel12: TPanel;
    Panel13: TPanel;
    Top_main_panel: TPanel;
    Panel14: TPanel;
    Timer_date: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel15: TPanel;
    Image7: TImage;
    SQLConnection1: TSQLConnection;
    Timer_bd: TTimer;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ProgressBar1: TProgressBar;
    Label9: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ProgressBar2: TProgressBar;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ProgressBar3: TProgressBar;
    Button3: TButton;
    Panel16: TPanel;
    Image8: TImage;
    Panel17: TPanel;
    N7: TMenuItem;
    StringGrid1: TStringGrid;
    Panel18: TPanel;
    TabControl1: TTabControl;
    Panel_tab1: TPanel;
    Label16: TLabel;
    ComboBox1: TComboBox;
    T_bd_value_now: TTimer;
    Panel_tab2: TPanel;
    Label17: TLabel;
    StringGrid2: TStringGrid;
    Panel_tab3: TPanel;
    Label18: TLabel;
    StringGrid3: TStringGrid;
    Label19: TLabel;
    StringGrid4: TStringGrid;
    Label20: TLabel;
    Image9: TImage;
    Label21: TLabel;
    N8: TMenuItem;
    N9: TMenuItem;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    Timer1: TTimer;
    Button4: TButton;
    PC_connect: TPanel;
    Image10: TImage;
    Sensor_humidity_1: TPanel;
    scan_error: TTimer;
    query_scan_err: TSQLQuery;
    Label22: TLabel;
    Sensor_humidity_2: TPanel;
    blink_error: TTimer;
    gate_1: TPanel;
    Gate_2: TPanel;
    Gate_3: TPanel;
    Gate1_level: TPanel;
    Image11: TImage;
    Gate3_level: TPanel;
    Image12: TImage;
    Gate2_level: TPanel;
    Image13: TImage;
    gate1_water_sensor: TPanel;
    gate2_water_sensor: TPanel;
    Image14: TImage;
    gate3_water_sensor: TPanel;
    Image3: TImage;
    procedure Timer_dateTimer(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Timer_bdTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Panel17Click(Sender: TObject);
    procedure T_bd_value_nowTimer(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure scan_errorTimer(Sender: TObject);
    procedure blink_errorTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure con_sql;

var
  Form1: TForm1;
  bd_c: boolean;
  er1,er2,er3,er4,er5,er6,er7,er8,er9,er10,er11:boolean;
implementation

{$R *.dfm}

uses lang, about, BD_connect, logo, task, data_log;

procedure con_sql();
var
  Ini: Tinifile;
  host,name_bd,port, pass, user: string;
begin
    Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'Settings.set');
    host:=Ini.ReadString('DB','host','');
    name_bd:=Ini.ReadString('DB','name_db','');
    user:=Ini.ReadString('DB','user','');
    pass:=Ini.ReadString('DB','pass','');
    port:=Ini.ReadString('DB','port','');
    Ini.Free;
  try
    Form1.SQLConnection1.Connected := False;
    Form1.SQLConnection1.DriverName := 'MySQL';
    Form1.SQLConnection1.ConnectionName := 'MySQLConnection';

    Form1.SQLConnection1.Params.Values['HostName'] := host;
    Form1.SQLConnection1.Params.Values['Database'] := name_bd;
    Form1.SQLConnection1.Params.Values['Password'] := pass;
    Form1.SQLConnection1.Params.Values['User_Name'] := user;
    Form1.SQLConnection1.Params.Values['port'] := port;
    Form1.SQLConnection1.Connected := True;

    Form1.Panel17.Caption := 'Связь с БД';
    Form1.Panel17.Color := clLime;
    bd_c:=true;
    form1.Timer_bd.Enabled:=true;
    form1.T_bd_value_now.Enabled:=true;
    form7.timer_bd_sc.Enabled:=true;
    form1.Timer1.Enabled:=true;
    form1.Button4.Enabled:=false;
    form1.scan_error.enabled:=true;
  except
    Form1.Timer_bd.Enabled := False;
    Form1.Panel17.Caption := 'Связь с БД';
    Form1.Panel17.Color := clRed;
    bd_c:=false;
    form1.Timer_bd.Enabled:=false;
    form1.T_bd_value_now.Enabled:=false;
    form7.timer_bd_sc.Enabled:=false;
    form1.Timer1.Enabled:=false;
    form1.Button4.Enabled:=true;
    form1.scan_error.enabled:=false;
    MessageBox(Form1.Handle, 'Ошибка подключения БД', '', MB_ICONError);
  end;
end;

procedure zatvor1(status: Boolean);
begin
  if status = True then
  begin
    Form1.Panel10.Color := clGreen;
  end
  else
  begin
    Form1.Panel10.Color := clRed;
  end;
end;

procedure zatvor2(status: Boolean);
begin
  if status = True then
  begin
    Form1.Panel8.Color := clGreen;
  end
  else
  begin
    Form1.Panel8.Color := clRed;
  end;
end;

procedure zatvor3(status: Boolean);
begin
  if status = True then
  begin
    Form1.Panel7.Color := clGreen;
  end
  else
  begin
    Form1.Panel7.Color := clRed;
  end;
end;

procedure TForm1.blink_errorTimer(Sender: TObject);
begin
 if er1=true then
 begin
    if form1.gate_1.color=clRed then
     form1.gate_1.color:=clSkyBlue
    else
     form1.gate_1.color:=clred;
 end;

 if er2=true then
 begin
    if form1.gate_2.color=clRed then
     form1.gate_2.color:=clSkyBlue
    else
     form1.gate_2.color:=clred;
 end;

 if er3=true then
 begin
    if form1.gate_3.color=clRed then
     form1.gate_3.color:=clSkyBlue
    else
     form1.gate_3.color:=clred;
 end;

 if er4=true then
 begin
    if form1.gate1_water_sensor.color=clRed then
     form1.gate1_water_sensor.color:=clSkyBlue
    else
     form1.gate1_water_sensor.color:=clred;
 end;

  if er5=true then
 begin
    if form1.gate2_water_sensor.color=clRed then
     form1.gate2_water_sensor.color:=clSkyBlue
    else
     form1.gate2_water_sensor.color:=clred;
 end;

  if er6=true then
 begin
    if form1.gate3_water_sensor.color=clRed then
     form1.gate3_water_sensor.color:=clSkyBlue
    else
     form1.gate3_water_sensor.color:=clred;
 end;


 if er7=true then
 begin
    if form1.Gate1_level.color=clRed then
     form1.Gate1_level.color:=clSkyBlue
    else
     form1.Gate1_level.color:=clred;
 end;

 if er8=true then
 begin
    if form1.Gate2_level.color=clRed then
     form1.Gate2_level.color:=clSkyBlue
    else
     form1.Gate2_level.color:=clred;
 end;

 if er9=true then
 begin
    if form1.Gate3_level.color=clRed then
     form1.Gate3_level.color:=clSkyBlue
    else
     form1.Gate3_level.color:=clred;
 end;


 if er10=true then
 begin
    if form1.Sensor_humidity_1.color=clRed then
     form1.Sensor_humidity_1.color:=clgreen
    else
     form1.Sensor_humidity_1.color:=clred;
 end;

  if er11=true then
 begin
    if form1.Sensor_humidity_2.color=clRed then
     form1.Sensor_humidity_2.color:=clgreen
    else
     form1.Sensor_humidity_2.color:=clred;
 end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;

  if Form1.Label8.Caption = 'Закрыт' then
  begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `status` ="1" where `id` ="1" ');
  end
  else
  begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `status` ="0" where `id` ="1" ');
  end;
  Form1.SQLQuery1.ExecSQL();
  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.Close;
  Form1.Timer_bd.Enabled := True;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;

  if Form1.Label11.Caption = 'Закрыт' then
  begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `status` ="1" where `id` ="2" ');
  end
  else
  begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `status` ="0" where `id` ="2" ');
  end;
  Form1.SQLQuery1.ExecSQL();
  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.Close;
  Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;

  if Form1.Label14.Caption = 'Закрыт' then
  begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `status` ="1" where `id` ="3" ');
  end
  else
  begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `status` ="0" where `id` ="3" ');
  end;
  Form1.SQLQuery1.ExecSQL();
  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.Close;
  Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  con_sql();
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  DlgRes: integer;
begin
   Application.Terminate;
  exit;

{  // Подтверждение на закрытие.
  If MessageDlg('Завершить работу приложения?', mtInformation, [mbNO, mbYES], 0)
    = mrYES Then
    begin

    CanClose := True // Нажата Ok - закрываем форму.
    end
  Else
    CanClose := False; // Нажата Cancel - игнорируем закрытие.
    }
  end;

procedure CanvasSetAngle(C: TCanvas; A: Single);
var
  LogRec: TLOGFONT;     {Font informationen}
begin
  GetObject(C.Font.Handle,SizeOf(LogRec),Addr(LogRec));
  LogRec.lfEscapement := Trunc(A*10);
  C.Font.Handle := CreateFontIndirect(LogRec);
end;


procedure TForm1.FormCreate(Sender: TObject);

begin
     form1.Visible:=false;


    er1 :=false;
    er2 :=false;
    er3 :=false;
    er4 :=false;
    er5 :=false;
    er6 :=false;
    er7 :=false;
    er8 :=false;
    er9 :=false;
    er10:=false;
    er11:=false;

   form1.StringGrid3.Cells[0,0]:='Название затвора';
   form1.StringGrid3.Cells[1,0]:='Q = m^3/c';
   form1.StringGrid3.Cells[2,0]:='W = m^3';


   form1.StringGrid4.Cells[0,0]:='Название затвора';
   form1.StringGrid4.Cells[1,0]:='Статус';
   form1.StringGrid4.Cells[2,0]:='Уровень';

   form1.StringGrid2.Cells[0,0]:='Название гидропоста';
   form1.StringGrid2.Cells[1,0]:='Показание датчика';

  form1.StringGrid1.Cells[0,0]:='Название датчика';
  form1.StringGrid1.Cells[1,0]:='';
  form1.StringGrid1.Cells[2,0]:='Влажность';
  form1.StringGrid1.Cells[3,0]:='% влажности';
  form1.StringGrid1.Cells[4,0]:='Температура почвы';
  con_sql();

end;

procedure TForm1.Image7Click(Sender: TObject);
var
  DlgRes: integer;
begin
  if  bd_c=true then begin

    DlgRes := MessageDlg('Подтвердите действие', mtInformation, mbOKCancel, 0);

    if DlgRes = mrCancel then
    begin
    end
    else if DlgRes = mrok then
    begin
      {
        вызов командына закрытие всех затворов
      }
      Form1.Timer_bd.Enabled := False;
      Form1.SQLQuery1.Active := False;
      Form1.SQLQuery1.SQL.Clear;
      Form1.SQLQuery1.SQL.Add('UPDATE `status_zatvor` SET `status` ="0" ');
      Form1.SQLQuery1.ExecSQL();
      Form1.SQLQuery1.SQL.Clear;
      Form1.SQLQuery1.SQL.Add('UPDATE `status_zatvor` SET `procent_otk` =0 ');
      Form1.SQLQuery1.ExecSQL();
      Form1.SQLQuery1.Close;
      MessageBox(Form1.Handle, 'Все затворы закрыты, аварийной кнопкой', '',
        MB_ICONINFORMATION);
      Form1.Timer_bd.Enabled := True;
    end;
  end else
  MessageBox(Form1.Handle, 'Нет связи с БД', '',        MB_ICONINFORMATION);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  about.form2.ShowModal();
end;

procedure TForm1.N4Click(Sender: TObject);

begin
  Form1.Close;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  lang.form3.ShowModal();
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  form4.ShowModal();
end;

procedure TForm1.N8Click(Sender: TObject);
begin
   form7.ShowModal();
end;

procedure TForm1.N9Click(Sender: TObject);
begin
form8.showmodal();
end;

procedure TForm1.Panel17Click(Sender: TObject);
begin
  form4.ShowModal();
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
if bd_c=true then
begin
  Panel15.Enabled := True;
  Panel15.Color := clWhite;
end else begin
  form1.RadioButton2.Checked:=true;
    MessageBox(Form1.Handle, 'Нет связи с БД', '',        MB_ICONINFORMATION);
end;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  Panel15.Enabled := False;
  Panel15.Color := clBtnShadow;
end;

procedure TForm1.scan_errorTimer(Sender: TObject);
var
j, i :integer;

begin
if bd_c = true then
begin
  form1.query_scan_err.SQL.Clear;
  Form1.query_scan_err.SQL.Add ('SELECT * FROM `ERROR`');
  Form1.query_scan_err.Active := True;
  Form1.query_scan_err.First;

  for j := 1 to form1.query_scan_err.RecordCount do
  begin
    //затворы
  if (form1.query_scan_err.fields[0].AsString='Gate1') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er1=false then
        begin
          form1.gate_1.Color:=clRed;
          er1:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er1:=false;
        form1.gate_1.Color:=clSkyBlue;
      end;

  if (form1.query_scan_err.fields[0].AsString='Gate2') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er2=false then
        begin
          form1.gate_2.Color:=clRed;
          er2:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er2:=false;
        form1.gate_2.Color:=clSkyBlue;
      end;

  if (form1.query_scan_err.fields[0].AsString='Gate3') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er3=false then
        begin
          form1.gate_3.Color:=clRed;
          er3:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er3:=false;
        form1.gate_3.Color:=clSkyBlue;
      end;

  //  датчики уровня воды
  if (form1.query_scan_err.fields[0].AsString='Senor_water_level_1') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er4=false then
        begin
          form1.gate1_water_sensor.Color:=clRed;
          er4:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er4:=false;
        form1.gate1_water_sensor.Color:=clSkyBlue;
      end;

  if (form1.query_scan_err.fields[0].AsString='Senor_water_level_2') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er5=false then
        begin
          form1.gate2_water_sensor.Color:=clRed;
          er5:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er5:=false;
        form1.gate2_water_sensor.Color:=clSkyBlue;
      end;

    if (form1.query_scan_err.fields[0].AsString='Senor_water_level_3') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er6=false then
        begin
          form1.gate3_water_sensor.Color:=clRed;
          er6:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er6:=false;
        form1.gate3_water_sensor.Color:=clSkyBlue;
      end;

    //тросиковые датчики
  if (form1.query_scan_err.fields[0].AsString='Sensor_gate_level_1') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er7=false then
        begin
          form1.Gate1_level.Color:=clRed;
          er7:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er7:=false;
        form1.gate1_level.Color:=clSkyBlue;
      end;


   if (form1.query_scan_err.fields[0].AsString='Sensor_gate_level_2') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er8=false then
        begin
          form1.Gate2_level.Color:=clRed;
          er8:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er8:=false;
        form1.gate2_level.Color:=clSkyBlue;
      end;
   if (form1.query_scan_err.fields[0].AsString='Sensor_gate_level_3') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er9=false then
        begin
          form1.Gate3_level.Color:=clRed;
          er9:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er9:=false;
        form1.gate3_level.Color:=clSkyBlue;
      end;


  //датчики влажности
  if (form1.query_scan_err.fields[0].AsString='Sensor_humidity_1') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er10=false then
        begin
          form1.Sensor_humidity_1.Color:=clRed;
          er10:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er10:=false;
        form1.Sensor_humidity_1.Color:=clGreen;
      end;

  if (form1.query_scan_err.fields[0].AsString='Sensor_humidity_2') then
    if (form1.query_scan_err.fields[1].asstring='1') then
      begin
      if er11=false then
        begin
          form1.Sensor_humidity_2.Color:=clRed;
          er11:=true;
          MessageBox(Form1.Handle,PChar(form1.query_scan_err.Fields[2].AsString), '', MB_ICONINFORMATION);
        end;
      end else begin
        er11:=false;
        form1.Sensor_humidity_2.Color:=clGreen;
      end;

  form1.query_scan_err.Next;
  end;



end;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  if form1.TabControl1.TabIndex=0 then
    form1.Panel_tab1.Visible:=true
  else
    form1.Panel_tab1.Visible:=false;

  if form1.TabControl1.TabIndex=1 then
    form1.Panel_tab2.Visible:=true
  else
    form1.Panel_tab2.Visible:=false;

  if form1.TabControl1.TabIndex=2 then
    form1.Panel_tab3.Visible:=true
  else
    form1.Panel_tab3.Visible:=false;

end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin

try

    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('SELECT `name`,`level_water` FROM `sensor_level`');
    Form1.SQLQuery2.Active := True;
      
except

    Form1.Timer_bd.Enabled := False;
    Form1.Panel17.Caption := 'Связь с БД';
    Form1.Panel17.Color := clRed;
    bd_c:=false;
    form1.Timer_bd.Enabled:=false;
    form1.T_bd_value_now.Enabled:=false;
    form7.timer_bd_sc.Enabled:=false;
    form1.Timer1.Enabled:=false;
    form1.Button4.Enabled:=true;
    MessageBox(Form1.Handle, 'Ошибка подключения БД', '', MB_ICONError);
end;

end;

procedure TForm1.Timer_bdTimer(Sender: TObject);
begin
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.SQL.Add
    ('SELECT name,status, procent_otk FROM `status_zatvor`');
 Form1.SQLQuery1.Active := True;
  Form1.SQLQuery1.First;
  if Form1.SQLQuery1.Fields[1].AsString = '1' then
  begin
    zatvor1(True);
    Form1.Label8.Caption := 'Открыт';
    Form1.Label8.Font.Color := clLime;
    Form1.ProgressBar1.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label9.Caption := inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';

  end
  else
  begin
    zatvor1(False);
    Form1.Label8.Caption := 'Закрыт';
    Form1.Label8.Font.Color := clRed;
    Form1.ProgressBar1.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label9.Caption := inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';

  end;

  Form1.SQLQuery1.Next;
  if Form1.SQLQuery1.Fields[1].AsString = '1' then
  begin
    zatvor2(True);
    Form1.Label11.Caption := 'Открыт';
    Form1.Label11.Font.Color := clLime;
    Form1.ProgressBar2.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label12.Caption :=
      inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';
  end
  else
  begin
    zatvor2(False);
    Form1.Label11.Caption := 'Закрыт';
    Form1.Label11.Font.Color := clRed;
    Form1.ProgressBar2.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label12.Caption :=
      inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';
  end;

  Form1.SQLQuery1.Next;
  if Form1.SQLQuery1.Fields[1].AsString = '1' then
  begin
    zatvor3(True);
    Form1.Label14.Caption := 'Открыт';
    Form1.Label14.Font.Color := clLime;
    Form1.ProgressBar3.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label15.Caption :=
      inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';
  end
  else
  begin
    zatvor3(False);
    Form1.Label14.Caption := 'Закрыт';
    Form1.Label14.Font.Color := clRed;
    Form1.ProgressBar3.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label15.Caption :=
      inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';
  end;

  Form1.SQLQuery1.Close;
end;

procedure TForm1.Timer_dateTimer(Sender: TObject);
var
  Res: TDateTime;
  Res2: TDateTime;
begin
  Res := Date;
  Res2 := Time;
  Label6.Caption := TimeToStr(Res2);
  Label4.Caption := DateToStr(Res);

end;

procedure TForm1.T_bd_value_nowTimer(Sender: TObject);

var
  i,j: Integer;

begin

 if bd_c=true then
 begin

    for i := StringGrid1.FixedRows to StringGrid1.RowCount - 1 do StringGrid1.Rows[i].Clear;
    for i := StringGrid2.FixedRows to StringGrid2.RowCount - 1 do StringGrid2.Rows[i].Clear;
    for i := StringGrid3.FixedRows to StringGrid3.RowCount - 1 do StringGrid3.Rows[i].Clear;
    for i := StringGrid4.FixedRows to StringGrid4.RowCount - 1 do StringGrid4.Rows[i].Clear;
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    if form1.ComboBox1.Text='Все поля' then
    Form1.SQLQuery2.SQL.Add  ('SELECT sensors_hum.name, sensor_values.id_sensors, sensor_values.hum_val, sensor_values.hum_val_proc, sensor_values.temp_val FROM `sensors_hum` RIGHT JOIN `sensor_values` on sensors_hum.id_sensors=sensor_values.id_sensors where sensors_hum.Active="1"')
    else
    Form1.SQLQuery2.SQL.Add  ('SELECT sensors_hum.name, sensor_values.id_sensors, sensor_values.hum_val, sensor_values.hum_val_proc, sensor_values.temp_val FROM `sensors_hum` RIGHT JOIN `sensor_values` on sensors_hum.id_sensors=sensor_values.id_sensors WHERE sensors_hum.id_pole='+form1.ComboBox1.Text+' and sensors_hum.Active="1"');
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    form1.StringGrid1.RowCount:= form1.SQLQuery2.RecordCount+1;
    for j := 1 to form1.SQLQuery2.RecordCount do
      begin
      for i := 0 to 4 do
        begin
           form1.StringGrid1.Cells[i,j]:=Form1.SQLQuery2.Fields[i].AsString;
        end;
      form1.SQLQuery2.Next;
      end;

    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('SELECT `name`,`level_water` FROM `sensor_level`');
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    form1.StringGrid2.RowCount:= form1.SQLQuery2.RecordCount+1;
    for j := 1 to form1.SQLQuery2.RecordCount do
      begin
      for i := 0 to 1 do
        begin
           form1.StringGrid2.Cells[i,j]:=Form1.SQLQuery2.Fields[i].AsString;
        end;
      form1.SQLQuery2.Next;
      end;


    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('SELECT name,status, level_metr FROM `status_zatvor`');
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    form1.StringGrid4.RowCount:= form1.SQLQuery2.RecordCount+1;
    for j := 1 to form1.SQLQuery2.RecordCount do
      begin
      for i := 0 to 2 do
        begin
         if i=1 then
           if Form1.SQLQuery2.Fields[1].AsString='0' then
            form1.StringGrid4.Cells[1,j]:='Закрыто' else
          if Form1.SQLQuery2.Fields[1].AsString='1' then
            form1.StringGrid4.Cells[1,j]:='Открыто'else begin end
          else
          form1.StringGrid4.Cells[i,j]:=Form1.SQLQuery2.Fields[i].AsString;
        end;
      form1.SQLQuery2.Next;
      end;

    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add  ('SELECT name, rashod_s, rashod_k FROM `sensor_level`');
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    form1.StringGrid3.RowCount:= form1.SQLQuery2.RecordCount+1;
    for j := 1 to form1.SQLQuery2.RecordCount do
      begin
      for i := 0 to 2 do
        begin
          form1.StringGrid3.Cells[i,j]:=Form1.SQLQuery2.Fields[i].AsString;
        end;
      form1.SQLQuery2.Next;
      end;

 end;
end;

end.

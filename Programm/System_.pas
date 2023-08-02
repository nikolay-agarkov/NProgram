unit System_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.Menus, Data.DBXMySQL, Data.DB, Data.SqlExpr, Data.FMTBcd,
  Vcl.ComCtrls, Vcl.ButtonGroup, Vcl.Imaging.pngimage, IniFiles, Vcl.Grids,
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
    Image7: TImage;
    SQLConnection1: TSQLConnection;
    Timer_bd: TTimer;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
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
    program_check: TSQLQuery;
    Label23: TLabel;
    gate1_t_level: TEdit;
    gate1_n_level: TEdit;
    Label24: TLabel;
    Panel15: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ProgressBar1: TProgressBar;
    Label25: TLabel;
    gate2_t_level: TEdit;
    gate2_n_level: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    TabSheet3: TTabSheet;
    gate3_t_level: TEdit;
    gate3_n_level: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Label30: TLabel;
    sr_hum_sensor: TLabel;
    Label31: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    gate1_open_lev: TLabel;
    gate2_open_lev: TLabel;
    gate3_open_lev: TLabel;
    N2: TMenuItem;
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

    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure scan_errorTimer(Sender: TObject);
    procedure blink_errorTimer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure con_sql;

var
  Form1: TForm1;
  bd_c: Boolean;
  er1, er2, er3, er4, er5, er6, er7, er8, er9, er10, er11, er12: Boolean;
   k,last_value:integer;

implementation

{$R *.dfm}

uses lang, about, BD_connect, logo, task, data_log, sensor_set;

procedure con_sql();
var
  Ini: Tinifile;
  host, name_bd, port, pass, user: string;
begin
  Ini := Tinifile.Create(extractfilepath(paramstr(0)) + 'Settings.set');
  host := Ini.ReadString('DB', 'host', '');
  name_bd := Ini.ReadString('DB', 'name_db', '');
  user := Ini.ReadString('DB', 'user', '');
  pass := Ini.ReadString('DB', 'pass', '');
  port := Ini.ReadString('DB', 'port', '');
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

    Form1.Panel17.Caption := '����� � ��';
    Form1.Panel17.Color := clLime;
    bd_c := True;
    Form1.Timer_bd.Enabled := True;
    Form1.T_bd_value_now.Enabled := True;
    form7.timer_bd_sc.Enabled := True;
    Form1.Timer1.Enabled := True;
    Form1.Button4.Enabled := False;
    Form1.scan_error.Enabled := True;
  except
    Form1.Timer_bd.Enabled := False;
    Form1.Panel17.Caption := '����� � ��';
    Form1.Panel17.Color := clRed;
    bd_c := False;
    Form1.Timer_bd.Enabled := False;
    Form1.T_bd_value_now.Enabled := False;
    form7.timer_bd_sc.Enabled := False;
    Form1.Timer1.Enabled := False;
    Form1.Button4.Enabled := True;
    Form1.scan_error.Enabled := False;
    MessageBox(Form1.Handle, '������ ����������� ��', '', MB_ICONError);
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
  if er1 = True then
  begin
    if Form1.gate_1.Color = clRed then
      Form1.gate_1.Color := clSkyBlue
    else
      Form1.gate_1.Color := clRed;
  end;

  if er2 = True then
  begin
    if Form1.Gate_2.Color = clRed then
      Form1.Gate_2.Color := clSkyBlue
    else
      Form1.Gate_2.Color := clRed;
  end;

  if er3 = True then
  begin
    if Form1.Gate_3.Color = clRed then
      Form1.Gate_3.Color := clSkyBlue
    else
      Form1.Gate_3.Color := clRed;
  end;

  if er4 = True then
  begin
    if Form1.gate1_water_sensor.Color = clRed then
      Form1.gate1_water_sensor.Color := clSkyBlue
    else
      Form1.gate1_water_sensor.Color := clRed;
  end;

  if er5 = True then
  begin
    if Form1.gate2_water_sensor.Color = clRed then
      Form1.gate2_water_sensor.Color := clSkyBlue
    else
      Form1.gate2_water_sensor.Color := clRed;
  end;

  if er6 = True then
  begin
    if Form1.gate3_water_sensor.Color = clRed then
      Form1.gate3_water_sensor.Color := clSkyBlue
    else
      Form1.gate3_water_sensor.Color := clRed;
  end;

  if er7 = True then
  begin
    if Form1.Gate1_level.Color = clRed then
      Form1.Gate1_level.Color := clSkyBlue
    else
      Form1.Gate1_level.Color := clRed;
  end;

  if er8 = True then
  begin
    if Form1.Gate2_level.Color = clRed then
      Form1.Gate2_level.Color := clSkyBlue
    else
      Form1.Gate2_level.Color := clRed;
  end;

  if er9 = True then
  begin
    if Form1.Gate3_level.Color = clRed then
      Form1.Gate3_level.Color := clSkyBlue
    else
      Form1.Gate3_level.Color := clRed;
  end;

  if er10 = True then
  begin
    if Form1.Sensor_humidity_1.Color = clRed then
      Form1.Sensor_humidity_1.Color := clGreen
    else
      Form1.Sensor_humidity_1.Color := clRed;
  end;

  if er11 = True then
  begin
    if Form1.Sensor_humidity_2.Color = clRed then
      Form1.Sensor_humidity_2.Color := clGreen
    else
      Form1.Sensor_humidity_2.Color := clRed;
  end;

end;

procedure TForm1.Button10Click(Sender: TObject);
begin
   Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;
   if Form1.gate1_n_level.Text>'' then
   begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `cmd` ="2", `open_level`='+form1.gate1_n_level.Text+' where `id` ="1" ');
        Form1.SQLQuery1.ExecSQL();
    end  else
      MessageBox(Form1.Handle,
              '�������� ���� ���������� ������ �� ����� ���� ������', '', MB_ICONINFORMATION);
   Form1.SQLQuery1.SQL.Clear;
   Form1.SQLQuery1.Close;
   Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;

  if Form1.gate1_n_level.Text>'' then
   begin
       Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `cmd` ="1", `open_level`='+form1.gate1_n_level.Text+' where `id` ="1" ');
        Form1.SQLQuery1.ExecSQL();
   end else
              MessageBox(Form1.Handle,
              '�������� ���� ���������� ������ �� ����� ���� ������', '', MB_ICONINFORMATION);


  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.Close;
  Form1.Timer_bd.Enabled := True;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;


  if Form1.gate2_n_level.Text>'' then
   begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `cmd` ="1" , `open_level`='+form1.gate2_n_level.Text+' where `id` ="2" ');
        Form1.SQLQuery1.ExecSQL();
   end else
           MessageBox(Form1.Handle,
              '�������� ���� ���������� ������ �� ����� ���� ������', '', MB_ICONINFORMATION);


  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.Close;
  Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;


  if Form1.gate3_n_level.Text>'' then
   begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `cmd` ="1", `open_level`='+form1.gate3_n_level.Text+' where `id` ="3" ');
        Form1.SQLQuery1.ExecSQL();
   end else
        MessageBox(Form1.Handle,
              '�������� ���� ���������� ������ �� ����� ���� ������', '', MB_ICONINFORMATION);


  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.Close;
  Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  con_sql();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;


    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `cmd` ="0" where `id` ="3" ');
        Form1.SQLQuery1.ExecSQL();

  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.Close;
  Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;


    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `cmd` ="0" where `id` ="2" ');
        Form1.SQLQuery1.ExecSQL();

  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.Close;
  Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;


    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `cmd` ="0" where `id` ="1" ');
        Form1.SQLQuery1.ExecSQL();

  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.Close;
  Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
   Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;
   if Form1.gate3_n_level.Text>'' then
   begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `cmd` ="2", `open_level`='+form1.gate3_n_level.Text+' where `id` ="3" ');
        Form1.SQLQuery1.ExecSQL();
    end  else
      MessageBox(Form1.Handle,
              '�������� ���� ���������� ������ �� ����� ���� ������', '', MB_ICONINFORMATION);
   Form1.SQLQuery1.SQL.Clear;
   Form1.SQLQuery1.Close;
   Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
   Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;
   if Form1.gate2_n_level.Text>'' then
   begin
    Form1.SQLQuery1.SQL.Add
      ('UPDATE `status_zatvor` SET `cmd` ="2", `open_level`='+form1.gate2_n_level.Text+' where `id` ="2" ');
        Form1.SQLQuery1.ExecSQL();
    end  else
      MessageBox(Form1.Handle,
              '�������� ���� ���������� ������ �� ����� ���� ������', '', MB_ICONINFORMATION);
   Form1.SQLQuery1.SQL.Clear;
   Form1.SQLQuery1.Close;
   Form1.Timer_bd.Enabled := True;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  DlgRes: integer;
begin
  Application.Terminate;
  exit;

  { // ������������� �� ��������.
    If MessageDlg('��������� ������ ����������?', mtInformation, [mbNO, mbYES], 0)
    = mrYES Then
    begin

    CanClose := True // ������ Ok - ��������� �����.
    end
    Else
    CanClose := False; // ������ Cancel - ���������� ��������.
  }
end;

procedure CanvasSetAngle(C: TCanvas; A: Single);
var
  LogRec: TLOGFONT; { Font informationen }
begin
  GetObject(C.Font.Handle, SizeOf(LogRec), Addr(LogRec));
  LogRec.lfEscapement := Trunc(A * 10);
  C.Font.Handle := CreateFontIndirect(LogRec);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin

  Form1.Visible := False;
  k:=0;
  last_value:=-1;
  er1 := False;
  er2 := False;
  er3 := False;
  er4 := False;
  er5 := False;
  er6 := False;
  er7 := False;
  er8 := False;
  er9 := False;
  er10 := False;
  er11 := False;
er12 := False;
  Form1.StringGrid3.Cells[0, 0] := '�������� �������';
  Form1.StringGrid3.Cells[1, 0] := 'Q = m^3/c';
//  Form1.StringGrid3.Cells[2, 0] := 'W = m^3';

  Form1.StringGrid4.Cells[0, 0] := '�������� �������';
  Form1.StringGrid4.Cells[1, 0] := '������';
  Form1.StringGrid4.Cells[2, 0] := '�������';

  Form1.StringGrid2.Cells[0, 0] := '�������� ����������';
  Form1.StringGrid2.Cells[1, 0] := '��������� �������';

  Form1.StringGrid1.Cells[0, 0] := '�������� �������';
  Form1.StringGrid1.Cells[1, 0] := '';
  Form1.StringGrid1.Cells[2, 0] := '���������';
  Form1.StringGrid1.Cells[3, 0] := '% ���������';
  Form1.StringGrid1.Cells[4, 0] := '����������� �����';
  con_sql();

  if bd_c=true and form1.RadioButton2.Checked  then
     if form7.RadioButton2.Checked then
       form7.task_h.Enabled:=true
     else
       form7.task_t.Enabled:=true;

  form1.Panel15.Enabled:=true;
  form1.GroupBox1.Color:=clMoneyGreen;
  form1.GroupBox2.Color:=clMoneyGreen;
  form1.GroupBox3.Color:=clMoneyGreen;
end;

procedure TForm1.Image7Click(Sender: TObject);
var
  DlgRes: integer;
begin
  if bd_c = True then
  begin

    DlgRes := MessageDlg('����������� ��������', mtInformation, mbOKCancel, 0);

    if DlgRes = mrCancel then
    begin
    end
    else if DlgRes = mrok then
    begin
      {
        ����� ��������� �������� ���� ��������
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
      MessageBox(Form1.Handle, '��� ������� �������, ��������� �������', '',
        MB_ICONINFORMATION);
      Form1.Timer_bd.Enabled := True;
    end;
  end
  else
    MessageBox(Form1.Handle, '��� ����� � ��', '', MB_ICONINFORMATION);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
form9.showmodal;
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
  form8.ShowModal();
end;

procedure TForm1.Panel17Click(Sender: TObject);
begin
  form4.ShowModal();
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  if bd_c = True then
  begin
    form1.Panel15.Enabled:=true;
    form1.GroupBox1.Enabled:=true;
    form1.GroupBox2.Enabled:=true;
    form1.GroupBox3.Enabled:=true;

    form1.GroupBox1.Color:=clwhite;
    form1.GroupBox2.Color:=clwhite;
    form1.GroupBox3.Color:=clwhite;
    form7.task_h.Enabled:=false;
    form7.task_t.Enabled:=false;
    end
  else
  begin
    Form1.RadioButton2.Checked := True;
    MessageBox(Form1.Handle, '��� ����� � ��', '', MB_ICONINFORMATION);
  end;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
    form1.Panel15.Enabled:=true;
    form1.GroupBox1.Enabled:=false;
    form1.GroupBox2.Enabled:=false;
    form1.GroupBox3.Enabled:=false;

    form1.GroupBox1.Color:=clMoneyGreen;
    form1.GroupBox2.Color:=clMoneyGreen;
    form1.GroupBox3.Color:=clMoneyGreen;
     if form7.RadioButton2.Checked=true then
        form7.task_h.Enabled:=true;
     if form7.RadioButton1.Checked=true then
        form7.task_t.Enabled:=true;
end;

procedure TForm1.scan_errorTimer(Sender: TObject);
var
  j, i: integer;

begin
  if bd_c = True then
  begin
    Form1.query_scan_err.SQL.Clear;
    Form1.query_scan_err.SQL.Add('SELECT * FROM `ERROR`');
    Form1.query_scan_err.Active := True;
    Form1.query_scan_err.First;

    for j := 1 to Form1.query_scan_err.RecordCount do
    begin
      // �������
      if (Form1.query_scan_err.fields[0].AsString = 'Gate1') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er1 = False then
          begin
            Form1.gate_1.Color := clRed;
            er1 := True;

            form1.gate_1.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.gate_1.ShowHint:=true;
//            MessageBox(Form1.Handle, PChar(Form1.query_scan_err.fields[2].AsString), '',         MB_ICONINFORMATION);
          end;
        end
        else
        begin
          er1 := False;
          Form1.gate_1.Color := clSkyBlue;
          form1.gate_1.Hint:='������ � �����';
          form1.gate_1.ShowHint:=true;
        end;

      if (Form1.query_scan_err.fields[0].AsString = 'Gate2') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er2 = False then
          begin
            Form1.Gate_2.Color := clRed;
            er2 := True;
                        form1.gate_2.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.gate_2.ShowHint:=true;
          end;
        end
        else
        begin
          er2 := False;
          Form1.Gate_2.Color := clSkyBlue;
            form1.gate_2.Hint:='������ � �����';
            form1.gate_2.ShowHint:=true;
        end;

      if (Form1.query_scan_err.fields[0].AsString = 'Gate3') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er3 = False then
          begin
            Form1.Gate_3.Color := clRed;
            er3 := True;
                         form1.gate_3.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.gate_3.ShowHint:=true;
          end;
        end
        else
        begin
          er3 := False;
          Form1.Gate_3.Color := clSkyBlue;
          form1.gate_3.Hint:='������ � �����';
          form1.gate_3.ShowHint:=true;
        end;

      // ������� ������ ����
      if (Form1.query_scan_err.fields[0].AsString = 'Senor_water_level_1') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er4 = False then
          begin
            Form1.gate1_water_sensor.Color := clRed;
            er4 := True;
                        form1.gate1_water_sensor.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.gate1_water_sensor.ShowHint:=true;
          end;
        end
        else
        begin
          er4 := False;
          Form1.gate1_water_sensor.Color := clSkyBlue;
          form1.gate1_water_sensor.Hint:='������ ������ ���� � �����';
            form1.gate1_water_sensor.ShowHint:=true;
        end;

      if (Form1.query_scan_err.fields[0].AsString = 'Senor_water_level_2') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er5 = False then
          begin
            Form1.gate2_water_sensor.Color := clRed;
            er5 := True;
             form1.gate2_water_sensor.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.gate2_water_sensor.ShowHint:=true;
          end;
        end
        else
        begin
          er5 := False;
          Form1.gate2_water_sensor.Color := clSkyBlue;
          form1.gate2_water_sensor.Hint:='������ ������ ���� � �����';
            form1.gate2_water_sensor.ShowHint:=true;
        end;

      if (Form1.query_scan_err.fields[0].AsString = 'Senor_water_level_3') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er6 = False then
          begin
            Form1.gate3_water_sensor.Color := clRed;
            er6 := True;
            form1.gate3_water_sensor.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.gate3_water_sensor.ShowHint:=true;
          end;
        end
        else
        begin
          er6 := False;
          Form1.gate3_water_sensor.Color := clSkyBlue;
          form1.gate3_water_sensor.Hint:='������ ������ ���� � �����';
            form1.gate3_water_sensor.ShowHint:=true;
        end;

      // ���������� �������
      if (Form1.query_scan_err.fields[0].AsString = 'Sensor_gate_level_1') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er7 = False then
          begin
            Form1.Gate1_level.Color := clRed;
            er7 := True;
            form1.Gate1_level.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.Gate1_level.ShowHint:=true;
          end;
        end
        else
        begin
          er7 := False;
          Form1.Gate1_level.Color := clSkyBlue;
           form1.Gate1_level.Hint:='OK';
            form1.Gate1_level.ShowHint:=true;
        end;

      if (Form1.query_scan_err.fields[0].AsString = 'Sensor_gate_level_2') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er8 = False then
          begin
            Form1.Gate2_level.Color := clRed;
            er8 := True;
             form1.Gate2_level.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.Gate2_level.ShowHint:=true;
          end;
        end
        else
        begin
          er8 := False;
          Form1.Gate2_level.Color := clSkyBlue;
           form1.Gate2_level.Hint:='OK';
            form1.Gate2_level.ShowHint:=true;
        end;
      if (Form1.query_scan_err.fields[0].AsString = 'Sensor_gate_level_3') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er9 = False then
          begin
            Form1.Gate3_level.Color := clRed;
            er9 := True;
             form1.Gate3_level.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.Gate3_level.ShowHint:=true;
          end;
        end
        else
        begin
          er9 := False;
          Form1.Gate3_level.Color := clSkyBlue;
           form1.Gate3_level.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.Gate3_level.ShowHint:=true;
        end;

      // ������� ���������
      if (Form1.query_scan_err.fields[0].AsString = 'Sensor_humidity_1') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er10 = False then
          begin
            Form1.Sensor_humidity_1.Color := clRed;
            er10 := True;
             form1.Sensor_humidity_1.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.Sensor_humidity_1.ShowHint:=true;
          end;
        end
        else
        begin
          er10 := False;
          Form1.Sensor_humidity_1.Color := clGreen;
          form1.Sensor_humidity_1.Hint:='OK';
            form1.Sensor_humidity_1.ShowHint:=true;
        end;

      if (Form1.query_scan_err.fields[0].AsString = 'Sensor_humidity_2') then
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er11 = False then
          begin
            Form1.Sensor_humidity_2.Color := clRed;
            er11 := True;
            form1.Sensor_humidity_2.Hint:=Form1.query_scan_err.fields[2].AsString;
            form1.Sensor_humidity_2.ShowHint:=true;
          end;
        end
        else
        begin
          er11 := False;
          Form1.Sensor_humidity_2.Color := clGreen;
          form1.Sensor_humidity_1.Hint:='OK';
            form1.Sensor_humidity_1.ShowHint:=true;
        end;

      // ���������
      if (Form1.query_scan_err.fields[0].AsString = 'Programm') then
      begin
        if form1.query_scan_err.fields[3].AsInteger<>last_value then
          begin
            k:=0;
            last_value:=form1.query_scan_err.fields[3].AsInteger;

            if er12=true then
              begin
              form1.program_check.Active:=false;
               form1.program_check.SQl.Clear;
               form1.program_check.SQl.Add('UPDATE `error` SET `code_error` ="0" where `Item` ="Programm"');
               form1.program_check.ExecSQL();
              end;

          end else begin
            k:=k+1;

            if k>=20 then
            begin
               form1.program_check.Active:=false;
               form1.program_check.SQl.Clear;
               form1.program_check.SQl.Add('UPDATE `error` SET `code_error` ="1" where `Item` ="Programm"');
               form1.program_check.ExecSQL();

            end;
          end;
        if (Form1.query_scan_err.fields[1].AsString = '1') then
        begin
          if er12 = False then
          begin
            Form1.PC_connect.Color := clRed;
            Form1.PC_connect.Caption := '�� �� ��������';
            er12 := True;

          end;
        end
        else
        begin
          er12 := False;
          Form1.PC_connect.Color := cllime;
          Form1.PC_connect.Caption := '����� �����������';
        end;
      end;

      Form1.query_scan_err.Next;
    end;

  end;
end;



procedure TForm1.Timer1Timer(Sender: TObject);
begin

  try

    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add('SELECT `name`,`level_water` FROM `sensor_level`');
    Form1.SQLQuery2.Active := True;

  except

    Form1.Timer_bd.Enabled := False;
    Form1.Panel17.Caption := '����� � ��';
    Form1.Panel17.Color := clRed;
    bd_c := False;
    Form1.Timer_bd.Enabled := False;
    Form1.T_bd_value_now.Enabled := False;
    form7.timer_bd_sc.Enabled := False;
    Form1.Timer1.Enabled := False;
    Form1.Button4.Enabled := True;
    MessageBox(Form1.Handle, '������ ����������� ��', '', MB_ICONError);
  end;

end;

procedure TForm1.Timer_bdTimer(Sender: TObject);
begin
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.SQL.Add
    ('SELECT name,status, procent_otk, level_metr FROM `status_zatvor`');
  Form1.SQLQuery1.Active := True;
  Form1.SQLQuery1.First;
  if Form1.SQLQuery1.fields[2].AsInteger > 0 then
    zatvor1(True)
   else
     zatvor1(false);


  if Form1.SQLQuery1.fields[1].AsString = '1' then
  begin
    Form1.Label8.Caption := '�����������...';
    form1.Shape1.Brush.Color:=clLime;
    form1.Shape2.Brush.Color:=Clgreen;
    form1.Shape3.Brush.Color:=clgreen;

    Form1.Label8.Font.Color := clLime;
    form1.gate1_t_level.Text:= Form1.SQLQuery1.fields[3].asstring;
    Form1.ProgressBar1.Position := Form1.SQLQuery1.fields[2].AsInteger;
    Form1.Label9.Caption := inttostr(Form1.SQLQuery1.fields[2].AsInteger) + '%';
    form1.gate1_open_lev.Caption:=form1.Label9.Caption;
          form1.Gate1_open_lev.Hint:='% �������� �������';
      form1.gate1_open_lev.ShowHint:=true;

  end
  else
  begin

    if Form1.SQLQuery1.fields[1].AsString = '2' then begin
      Form1.Label8.Caption := '�����������....';
           Form1.Label8.Font.Color := clred;
    form1.Shape3.Brush.Color:=clLime;
    form1.Shape1.Brush.Color:=Clgreen;
    form1.Shape2.Brush.Color:=clgreen;

    end
      else
    if Form1.SQLQuery1.fields[1].AsString = '0' then
    begin
       Form1.Label8.Caption := '����������';
      Form1.Label8.Font.Color := clolive;
    form1.Shape1.Brush.Color:=clgreen;
    form1.Shape2.Brush.Color:=Clgreen;
    form1.Shape3.Brush.Color:=clgreen;

      end;

    form1.gate1_t_level.Text:= Form1.SQLQuery1.fields[3].asstring;
    Form1.ProgressBar1.Position := Form1.SQLQuery1.fields[2].AsInteger;
    Form1.Label9.Caption := inttostr(Form1.SQLQuery1.fields[2].AsInteger) + '%';

  end;

  Form1.SQLQuery1.Next;
      if Form1.SQLQuery1.fields[2].AsInteger > 0 then
        zatvor2(True)
     else
       zatvor2(false);

  if Form1.SQLQuery1.fields[1].AsString = '1' then
  begin


    Form1.Label11.Caption := '�����������...';
    Form1.Label11.Font.Color := clLime;
    form1.Shape7.Brush.Color:=clLime;
    form1.Shape8.Brush.Color:=Clgreen;
    form1.Shape9.Brush.Color:=clgreen;
      form1.gate2_t_level.Text:= Form1.SQLQuery1.fields[3].asstring;
    Form1.ProgressBar2.Position := Form1.SQLQuery1.fields[2].AsInteger;
    Form1.Label12.Caption :=
      inttostr(Form1.SQLQuery1.fields[2].AsInteger) + '%';
    form1.gate2_open_lev.Caption:=form1.Label12.Caption;
          form1.Gate2_open_lev.Hint:='% �������� �������';
      form1.gate2_open_lev.ShowHint:=true;
  end
  else
  begin

         if Form1.SQLQuery1.fields[1].AsString = '2' then begin
      Form1.Label11.Caption := '�����������....';
           Form1.Label11.Font.Color := clred;
           form1.Shape9.Brush.Color:=clLime;
           form1.Shape8.Brush.Color:=Clgreen;
            form1.Shape7.Brush.Color:=clgreen;
    end
      else
    if Form1.SQLQuery1.fields[1].AsString = '0' then
    begin
       Form1.Label11.Caption := '����������';
      Form1.Label11.Font.Color := clolive;
      form1.Shape7.Brush.Color:=clgreen;
    form1.Shape8.Brush.Color:=Clgreen;
    form1.Shape9.Brush.Color:=clgreen;
      end;
        form1.gate2_t_level.Text:= Form1.SQLQuery1.fields[3].asstring;
    Form1.ProgressBar2.Position := Form1.SQLQuery1.fields[2].AsInteger;
    Form1.Label12.Caption :=
      inttostr(Form1.SQLQuery1.fields[2].AsInteger) + '%';
      form1.gate2_open_lev.Caption:=form1.Label12.Caption;
      form1.Gate2_open_lev.Hint:='% �������� �������';
      form1.gate2_open_lev.ShowHint:=true;
  end;

  Form1.SQLQuery1.Next;
    if Form1.SQLQuery1.fields[2].AsInteger > 0 then
    zatvor3(True)
   else
     zatvor3(false);

  if Form1.SQLQuery1.fields[1].AsString = '1' then
  begin

    Form1.Label14.Caption := '�����������...';
    Form1.Label14.Font.Color := clLime;
    form1.Shape4.Brush.Color:=clLime;
    form1.Shape5.Brush.Color:=Clgreen;
    form1.Shape6.Brush.Color:=clgreen;


    form1.gate3_t_level.Text:= Form1.SQLQuery1.fields[3].asstring;
    Form1.ProgressBar3.Position := Form1.SQLQuery1.fields[2].AsInteger;
    Form1.Label15.Caption := inttostr(Form1.SQLQuery1.fields[2].AsInteger) + '%';
    form1.gate3_open_lev.Caption:=form1.Label15.Caption;
          form1.Gate3_open_lev.Hint:='% �������� �������';
      form1.gate3_open_lev.ShowHint:=true;
  end
  else
  begin

    if Form1.SQLQuery1.fields[1].AsString = '2' then begin
      Form1.Label14.Caption := '�����������....';
           Form1.Label14.Font.Color := clred;
           form1.Shape6.Brush.Color:=clLime;
           form1.Shape5.Brush.Color:=Clgreen;
           form1.Shape4.Brush.Color:=clgreen;
    end
      else
    if Form1.SQLQuery1.fields[1].AsString = '0' then
    begin
       Form1.Label14.Caption := '����������';
      Form1.Label14.Font.Color := clolive;
      form1.Shape4.Brush.Color:=clgreen;
      form1.Shape5.Brush.Color:=Clgreen;
      form1.Shape6.Brush.Color:=clgreen;
      end;
    form1.gate3_t_level.Text:= Form1.SQLQuery1.fields[3].asstring;
    Form1.ProgressBar3.Position := Form1.SQLQuery1.fields[2].AsInteger;
    Form1.Label15.Caption :=
      inttostr(Form1.SQLQuery1.fields[2].AsInteger) + '%';
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
  Label6.Caption := FormatDateTime('hh:nn:ss',Res2);
  Label4.Caption := DateToStr(Res);

end;

procedure TForm1.T_bd_value_nowTimer(Sender: TObject);
var
  i, j: integer;
  k, all_sum:integer;
  sr:double;
  st: string;
begin
  all_sum:=0;
  if bd_c = True then
  begin

    for i := StringGrid1.FixedRows to StringGrid1.RowCount - 1 do
      StringGrid1.Rows[i].Clear;
    for i := StringGrid2.FixedRows to StringGrid2.RowCount - 1 do
      StringGrid2.Rows[i].Clear;
    for i := StringGrid3.FixedRows to StringGrid3.RowCount - 1 do
      StringGrid3.Rows[i].Clear;
    for i := StringGrid4.FixedRows to StringGrid4.RowCount - 1 do
      StringGrid4.Rows[i].Clear;
    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    if Form1.ComboBox1.Text = '��� ����' then
      Form1.SQLQuery2.SQL.Add
        ('SELECT sensors_hum.name, sensor_values.id_sensors, sensor_values.hum_val, sensor_values.hum_val_proc, sensor_values.temp_val FROM `sensors_hum` RIGHT JOIN `sensor_values` on sensors_hum.id_sensors=sensor_values.id_sensors where sensors_hum.Active="1"')
    else
      Form1.SQLQuery2.SQL.Add
        ('SELECT sensors_hum.name, sensor_values.id_sensors, sensor_values.hum_val, sensor_values.hum_val_proc, sensor_values.temp_val FROM `sensors_hum` RIGHT JOIN `sensor_values` on sensors_hum.id_sensors=sensor_values.id_sensors WHERE sensors_hum.id_pole='
        + Form1.ComboBox1.Text + ' and sensors_hum.Active="1"');
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    k:=Form1.SQLQuery2.RecordCount;
    Form1.StringGrid1.RowCount := Form1.SQLQuery2.RecordCount + 1;
    for j := 1 to Form1.SQLQuery2.RecordCount do
    begin
      for i := 0 to 4 do
      begin
        Form1.StringGrid1.Cells[i, j] := Form1.SQLQuery2.fields[i].AsString;
      end;
      all_sum:= all_sum+strtoint(Form1.SQLQuery2.fields[3].AsString);
      Form1.SQLQuery2.Next;
    end;
    FormatSettings.DecimalSeparator := '.';
    form1.sr_hum_sensor.Caption:= floattostr(all_sum/k);


    for i := 1 to 2 do
      begin
      Form1.SQLQuery2.Active := False;
      Form1.SQLQuery2.SQL.Clear;
      st:='SELECT sensors_hum.name, sensor_values.id_sensors, sensor_values.hum_val, sensor_values.hum_val_proc, sensor_values.temp_val FROM `sensors_hum` RIGHT JOIN `sensor_values` on '+' sensors_hum.id_sensors=sensor_values.id_sensors WHERE sensors_hum.id_pole="'+inttostr(i)+'" and sensors_hum.Active="1"';
      Form1.SQLQuery2.SQL.Add(st);
      Form1.SQLQuery2.Active := true;
      Form1.SQLQuery2.First;
      k:=Form1.SQLQuery2.RecordCount;
      all_sum:=0;
        for j := 1 to Form1.SQLQuery2.RecordCount do
          begin
            all_sum:= all_sum+strtoint(Form1.SQLQuery2.fields[3].AsString);
            Form1.SQLQuery2.Next;
          end;

      Form1.SQLQuery2.Active := False;
      Form1.SQLQuery2.SQL.Clear;
      FormatSettings.DecimalSeparator := '.';
      st:='UPDATE status_zatvor SET `average_value_h`='+floattostr(all_sum/k)+' WHERE id_pole="'+inttostr(i)+'"';
      Form1.SQLQuery2.SQL.Add(st);
      form1.SQLQuery2.ExecSQL();
      end;




    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add('SELECT `name`,`level_water` FROM `sensor_level`');
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    Form1.StringGrid2.RowCount := Form1.SQLQuery2.RecordCount + 1;
    for j := 1 to Form1.SQLQuery2.RecordCount do
    begin
      for i := 0 to 1 do
      begin
        Form1.StringGrid2.Cells[i, j] := Form1.SQLQuery2.fields[i].AsString;
      end;
      Form1.SQLQuery2.Next;
    end;

    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add
      ('SELECT name,status, level_metr, procent_otk FROM `status_zatvor`');
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    Form1.StringGrid4.RowCount := Form1.SQLQuery2.RecordCount + 1;
    for j := 1 to Form1.SQLQuery2.RecordCount do
    begin
      for i := 0 to 2 do
      begin
        if i = 1 then
          if Form1.SQLQuery2.fields[3].AsInteger=0 then
            Form1.StringGrid4.Cells[1, j] := '�������'
          else if Form1.SQLQuery2.fields[3].AsInteger>0 then
            Form1.StringGrid4.Cells[1, j] := '�������'
          else
          begin
          end
        else
          Form1.StringGrid4.Cells[i, j] := Form1.SQLQuery2.fields[i].AsString;
      end;
      Form1.SQLQuery2.Next;
    end;

    Form1.SQLQuery2.Active := False;
    Form1.SQLQuery2.SQL.Clear;
    Form1.SQLQuery2.SQL.Add
      ('SELECT name, rashod_s, rashod_k FROM `sensor_level`');
    Form1.SQLQuery2.Active := True;
    Form1.SQLQuery2.First;
    Form1.StringGrid3.RowCount := Form1.SQLQuery2.RecordCount + 1;
    for j := 1 to Form1.SQLQuery2.RecordCount do
    begin
      for i := 0 to 1 do
      begin
        Form1.StringGrid3.Cells[i, j] := Form1.SQLQuery2.fields[i].AsString;
      end;
      Form1.SQLQuery2.Next;
    end;

  end;
end;

end.

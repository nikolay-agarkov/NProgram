unit System_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.Menus, Data.DBXMySQL, Data.DB, Data.SqlExpr, Data.FMTBcd,
  Vcl.ComCtrls, Vcl.ButtonGroup, Vcl.Imaging.pngimage,IniFiles, Vcl.Grids,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    Image4: TImage;
    Image5: TImage;
    Panel6: TPanel;
    Image6: TImage;
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
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel15: TPanel;
    Image7: TImage;
    SQLConnection1: TSQLConnection;
    SQLQuery1: TSQLQuery;
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
    SQLQuery2: TSQLQuery;
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
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure con_sql;

var
  Form1: TForm1;
  bd_c: boolean;
implementation

{$R *.dfm}

uses lang, about, BD_connect, logo, task, data_log;

procedure con_sql();
var
  Ini: Tinifile;
  host,name_bd, pass, user: string;
begin
    Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'Settings.set');
    host:=Ini.ReadString('DB','host','');
    name_bd:=Ini.ReadString('DB','name_db','');
    user:=Ini.ReadString('DB','user','');
    pass:=Ini.ReadString('DB','pass','');
    Ini.Free;
  try
    Form1.SQLConnection1.Connected := False;
    Form1.SQLConnection1.DriverName := 'MySQL';
    Form1.SQLConnection1.ConnectionName := 'MySQLConnection';
    Form1.SQLConnection1.Params.Values['HostName'] := host;
    Form1.SQLConnection1.Params.Values['Database'] := name_bd;
    Form1.SQLConnection1.Params.Values['Password'] := pass;
    Form1.SQLConnection1.Params.Values['User_Name'] := user;
    Form1.SQLConnection1.Connected := True;
    Form1.Panel17.Caption := '����� � ��';
    Form1.Panel17.Color := clLime;
    bd_c:=true;
    form1.Timer_bd.Enabled:=true;
    form1.T_bd_value_now.Enabled:=true;
  except
    Form1.Timer_bd.Enabled := False;
    Form1.Panel17.Caption := '����� � ��';
    Form1.Panel17.Color := clRed;
    bd_c:=false;
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Timer_bd.Enabled := False;
  Form1.SQLQuery1.Active := False;
  Form1.SQLQuery1.SQL.Clear;

  if Form1.Label8.Caption = '������' then
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

  if Form1.Label11.Caption = '������' then
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

  if Form1.Label14.Caption = '������' then
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

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  DlgRes: integer;
begin
    form6.close;

{  // ������������� �� ��������.
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
  LogRec: TLOGFONT;     {Font informationen}
begin
  GetObject(C.Font.Handle,SizeOf(LogRec),Addr(LogRec));
  LogRec.lfEscapement := Trunc(A*10);
  C.Font.Handle := CreateFontIndirect(LogRec);
end;


procedure TForm1.FormCreate(Sender: TObject);

begin
     form1.Visible:=false;



   form1.StringGrid3.Cells[0,0]:='�������� �������';
   form1.StringGrid3.Cells[1,0]:='Q = m^3/c';
   form1.StringGrid3.Cells[2,0]:='W = m^3';


   form1.StringGrid4.Cells[0,0]:='�������� �������';
   form1.StringGrid4.Cells[1,0]:='������';
   form1.StringGrid4.Cells[2,0]:='�������';

   form1.StringGrid2.Cells[0,0]:='�������� ����������';
   form1.StringGrid2.Cells[1,0]:='��������� �������';

  form1.StringGrid1.Cells[0,0]:='�������� �������';
  form1.StringGrid1.Cells[1,0]:='';
  form1.StringGrid1.Cells[2,0]:='���������';
  form1.StringGrid1.Cells[3,0]:='% ���������';
  form1.StringGrid1.Cells[4,0]:='����������� �����';
  con_sql();

end;

procedure TForm1.Image7Click(Sender: TObject);
var
  DlgRes: integer;
begin
  if  bd_c=true then begin

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
  end else
  MessageBox(Form1.Handle, '��� ����� � ��', '',        MB_ICONINFORMATION);
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
    MessageBox(Form1.Handle, '��� ����� � ��', '',        MB_ICONINFORMATION);
end;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  Panel15.Enabled := False;
  Panel15.Color := clBtnShadow;
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
    Form1.Label8.Caption := '������';
    Form1.Label8.Font.Color := clLime;
    Form1.ProgressBar1.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label9.Caption := inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';

  end
  else
  begin
    zatvor1(False);
    Form1.Label8.Caption := '������';
    Form1.Label8.Font.Color := clRed;
    Form1.ProgressBar1.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label9.Caption := inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';

  end;

  Form1.SQLQuery1.Next;
  if Form1.SQLQuery1.Fields[1].AsString = '1' then
  begin
    zatvor2(True);
    Form1.Label11.Caption := '������';
    Form1.Label11.Font.Color := clLime;
    Form1.ProgressBar2.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label12.Caption :=
      inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';
  end
  else
  begin
    zatvor2(False);
    Form1.Label11.Caption := '������';
    Form1.Label11.Font.Color := clRed;
    Form1.ProgressBar2.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label12.Caption :=
      inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';
  end;

  Form1.SQLQuery1.Next;
  if Form1.SQLQuery1.Fields[1].AsString = '1' then
  begin
    zatvor3(True);
    Form1.Label14.Caption := '������';
    Form1.Label14.Font.Color := clLime;
    Form1.ProgressBar3.Position := Form1.SQLQuery1.Fields[2].AsInteger;
    Form1.Label15.Caption :=
      inttostr(Form1.SQLQuery1.Fields[2].AsInteger) + '%';
  end
  else
  begin
    zatvor3(False);
    Form1.Label14.Caption := '������';
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
    if form1.ComboBox1.Text='��� ����' then
    Form1.SQLQuery2.SQL.Add  ('SELECT sensors_hum.name, sensor_values.id_sensors, sensor_values.hum_val, sensor_values.hum_val_proc, sensor_values.temp_val FROM `sensors_hum` RIGHT JOIN `sensor_values` on sensors_hum.id_sensors=sensor_values.id_sensors')
    else
    Form1.SQLQuery2.SQL.Add  ('SELECT sensors_hum.name, sensor_values.id_sensors, sensor_values.hum_val, sensor_values.hum_val_proc, sensor_values.temp_val FROM `sensors_hum` RIGHT JOIN `sensor_values` on sensors_hum.id_sensors=sensor_values.id_sensors WHERE sensors_hum.id_pole='+form1.ComboBox1.Text);
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
            form1.StringGrid4.Cells[1,j]:='�������' else
          if Form1.SQLQuery2.Fields[1].AsString='1' then
            form1.StringGrid4.Cells[1,j]:='�������'else begin end
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

unit BD_connect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,IniFiles;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses System_;

procedure TForm4.Button1Click(Sender: TObject);
var
  Ini: Tinifile;
begin
  Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'Settings.set');
  ini.WriteString('DB','host',edit1.Text);
    ini.WriteString('DB','name_db',edit2.Text);
      ini.WriteString('DB','user',edit3.Text);
        ini.WriteString('DB','pass',edit4.Text);
        ini.Free;
  try
  con_sql();
  finally
  form4.Close;
  end;

end;

procedure TForm4.FormCreate(Sender: TObject);
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
    edit1.Text:=host;
    edit2.Text:=name_bd;
    edit3.Text:=user;
    edit4.Text:=pass;

end;

end.

unit logo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TForm6 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormPaint(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses System_;

procedure TForm6.FormActivate(Sender: TObject);
var
i: integer;
begin
{  for i:=0 to 255 do begin
     alphablendvalue := i;
     update;
     sleep(2);
  end;                       }

 end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  form6.AlphaBlendValue :=255;
  update;

  timer2.Enabled:=true;
end;

procedure TForm6.FormPaint(Sender: TObject);
var
i:integer;
begin

end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin


    timer1.Destroy;


end;

procedure TForm6.Timer2Timer(Sender: TObject);
var
i:integer;
begin
i:=i+1;
if i>2 then
 begin
  form6.AlphaBlendValue :=0;
  update;
  Application.CreateForm(TForm1, Form1);
  form1.Visible:=true;
  timer2.Enabled:=false;
 end;
end;

end.

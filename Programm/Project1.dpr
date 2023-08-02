program Project1;

uses
  Vcl.Forms,
  System_ in 'System_.pas' {Form1},
  about in 'about.pas' {Form2},
  lang in 'lang.pas' {Form3},
  BD_connect in 'BD_connect.pas' {Form4},
  sensors_hum in 'sensors_hum.pas' {Form5},
  logo in 'logo.pas' {Form6},
  task in 'task.pas' {Form7},
  data_log in 'data_log.pas' {Form8},
  sensor_set in 'sensor_set.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;


end.

program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {frmSplash},
  Unit2 in 'Unit2.pas' {editForm},
  Unit3 in 'Unit3.pas' {pictureForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Zolapin - Cementerio Santa Ifigenia';
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TeditForm, editForm);
  Application.CreateForm(TpictureForm, pictureForm);
  Application.Run;
end.

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Imaging.jpeg;

type
  TfrmSplash = class(TForm)
    imgSplash: TImage;
    ProgressBar: TProgressBar;
    Tiempo: TTimer;
    procedure TiempoTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure TfrmSplash.TiempoTimer(Sender: TObject);
begin
  Progressbar.Position := Progressbar.Position +1;

  if Progressbar.Position = Progressbar.Max  then
    Begin
      (Sender as TTimer).Enabled := False;
      frmSplash.Hide;
      editForm.Show;
      pictureForm.Show;
    end;
end;

end.

unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls;

type
  TpictureForm = class(TForm)
    templateImage: TImage;
    lblCargo: TLabel;
    lblAcceso: TLabel;
    lblNombre: TLabel;
    lblCarnet: TLabel;
    personImage: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure personImageClick(Sender: TObject);
    procedure lblAccesoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblAccesoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblNombreMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblCarnetMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblCargoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblNombreMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblCargoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblCarnetMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

    // My's Methods
    procedure tomarCoordenada(X, Y: Integer);
    procedure mover(Sender: TObject; Shift: TShiftState; X, Y: Integer);

  private
     MX, MY  :Integer;

  public

  end;

var
  pictureForm: TpictureForm;

implementation

uses Unit2;

{$R *.dfm}

procedure TpictureForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TpictureForm.personImageClick(Sender: TObject);
begin
  if editForm.OpenPictureDialog.Execute then
     personImage.Picture.LoadfromFile(editForm.OpenPictureDialog.FileName);
end;

procedure TpictureForm.lblCargoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  tomarCoordenada(X,Y);
  editForm.tipoData.ItemIndex := 2;
end;

procedure TpictureForm.lblCargoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  mover(Sender, Shift, X, Y);
end;

procedure TpictureForm.lblAccesoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  tomarCoordenada(X,Y);
end;

procedure TpictureForm.lblAccesoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    mover(Sender, Shift, X, Y);

end;

procedure TpictureForm.lblNombreMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  tomarCoordenada(X,Y);
  editForm.tipoData.ItemIndex := 0;
end;

procedure TpictureForm.lblNombreMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  mover(Sender, Shift, X, Y);
end;

procedure TpictureForm.lblCarnetMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  tomarCoordenada(X,Y);
  editForm.tipoData.ItemIndex := 1;
end;

procedure TpictureForm.lblCarnetMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  mover(Sender, Shift, X, Y);
end;

// My's Methods Implementation
procedure TpictureForm.tomarCoordenada(X,Y: Integer);
  Begin
     MX := x;
     MY := Y;
  End;

procedure TpictureForm.mover(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
Begin

  if (ssLeft in shift) then
    Begin
      TPanel(Sender).Left := TPanel(Sender).Left + X;
      TPanel(Sender).Top := TPanel(Sender).Top + Y;
    End;

End;


end.

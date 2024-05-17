unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ExtDlgs, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.jpeg, Vcl.Menus;

type
  TeditForm = class(TForm)
    btnSave: TBitBtn;
    tipoAcceso: TRadioGroup;
    GroupBox1: TGroupBox;
    comboPlantillas: TComboBox;
    GroupBox2: TGroupBox;
    inputNombre: TLabeledEdit;
    inputCarnet: TLabeledEdit;
    SavePictureDialog: TSavePictureDialog;
    ComboBoxEx1: TComboBoxEx;
    ImageList: TImageList;
    OpenPictureDialog: TOpenPictureDialog;
    inputCategoria: TLabeledEdit;
    FontDialog: TFontDialog;
    tipoData: TRadioGroup;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    imageEdicion: TImage;
    menuConext: TPopupMenu;
    EditarFuente1: TMenuItem;
    btnReset: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tipoAccesoClick(Sender: TObject);
    procedure inputNombreChange(Sender: TObject);
    procedure inputCarnetChange(Sender: TObject);
    procedure inputNombreClick(Sender: TObject);
    procedure inputCarnetClick(Sender: TObject);
    procedure inputCategoriaChange(Sender: TObject);
    procedure inputCategoriaClick(Sender: TObject);
    procedure comboPlantillasChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBoxEx1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);

    //My Methods

    procedure procesarFont;
    procedure EditarFuente1Click(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private

  public
    { Public declarations }

  protected
	  procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  editForm: TeditForm;

implementation

uses Unit3;

procedure TeditForm.CreateParams(var Params:TCreateParams);
Begin
  Inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
End;

procedure TeditForm.EditarFuente1Click(Sender: TObject);
begin
   procesarfont;
end;

{$R *.dfm}

procedure TeditForm.btnResetClick(Sender: TObject);
begin
  pictureForm.lblNombre.Caption :=  '-- NOMBRE Y APELLIDOS--';
  pictureForm.lblNombre.Top := 333;
  pictureForm.lblNombre.Left := 24;
  pictureForm.lblNombre.Font.Size  := 48;

  pictureForm.lblCarnet.Caption :=  '-- CARNET IDENTIDAD--';
  pictureForm.lblCarnet.Top := 437;
  pictureForm.lblCarnet.Left := 24;
  pictureForm.lblCarnet.Font.Size  := 48;

  pictureForm.lblCargo.Caption :=  '-- CARGO --';
  pictureForm.lblCargo.Top := 552;
  pictureForm.lblCargo.Left := 8;
  pictureForm.lblCargo.Font.Size  := 72;

  pictureForm.lblAcceso.Caption :=  '-- ACCESO --';
  pictureForm.lblAcceso.Top := 161;
  pictureForm.lblAcceso.Left := 829;

end;

procedure TeditForm.btnSaveClick(Sender: TObject);
Var
  Bitmap: Tbitmap;
begin
  Bitmap := pictureForm.GetFormImage;
  Try
    if SavePictureDialog.Execute then
    Bitmap.SaveToFile(SavePictureDialog.FileName);
  Finally
    bitmap.Free;
  End;
end;

procedure TeditForm.BitBtn1Click(Sender: TObject);
begin
    case tipoData.ItemIndex of
        0: pictureForm.lblNombre.Font.Size := pictureForm.lblNombre.Font.Size + 1;
        1: pictureForm.lblCarnet.Font.Size := pictureForm.lblCarnet.Font.Size + 1;
        2: pictureForm.lblCargo.Font.Size := pictureForm.lblCargo.Font.Size + 1;
    end;
end;

procedure TeditForm.BitBtn2Click(Sender: TObject);
begin
  procesarfont;
end;

procedure TeditForm.BitBtn3Click(Sender: TObject);
begin
  case tipoData.ItemIndex of
        0: pictureForm.lblNombre.Font.Size := pictureForm.lblNombre.Font.Size - 1;
        1: pictureForm.lblCarnet.Font.Size := pictureForm.lblCarnet.Font.Size - 1;
        2: pictureForm.lblCargo.Font.Size := pictureForm.lblCargo.Font.Size - 1;
  end;
end;

procedure TeditForm.Button1Click(Sender: TObject);
begin
   Case tipoData.ItemIndex of
      0: pictureForm.lblNombre.Top :=  pictureForm.lblNombre.Top - 5;
      1: pictureForm.lblCarnet.Top :=  pictureForm.lblCarnet.Top - 5;
      2: pictureForm.lblCargo.Top :=  pictureForm.lblCargo.Top - 5;
   end;
end;

procedure TeditForm.Button2Click(Sender: TObject);
begin
   Case tipoData.ItemIndex of
      0: pictureForm.lblNombre.Height :=  pictureForm.lblNombre.Height -5;
      1: pictureForm.lblCarnet.Height :=  pictureForm.lblCarnet.Height -5;
      2: pictureForm.lblCargo.Height :=  pictureForm.lblCargo.Height -5;
   end;
end;

procedure TeditForm.Button3Click(Sender: TObject);
begin
   Case tipoData.ItemIndex of
      0: pictureForm.lblNombre.Top :=  pictureForm.lblNombre.Top +5;
      1: pictureForm.lblCarnet.Top :=  pictureForm.lblCarnet.Top +5;
      2: pictureForm.lblCargo.Top :=  pictureForm.lblCargo.Top +5;
   end;
end;

procedure TeditForm.Button4Click(Sender: TObject);
begin
   Case tipoData.ItemIndex of
      0: pictureForm.lblNombre.Height :=  pictureForm.lblNombre.Height +5;
      1: pictureForm.lblCarnet.Height :=  pictureForm.lblCarnet.Height +5;
      2: pictureForm.lblCargo.Height :=  pictureForm.lblCargo.Height +5;
   end;
end;

procedure TeditForm.Button5Click(Sender: TObject);
begin
   Case tipoData.ItemIndex of
      0: pictureForm.lblNombre.Left :=  pictureForm.lblNombre.Left -5;
      1: pictureForm.lblCarnet.Left :=  pictureForm.lblCarnet.Left -5;
      2: pictureForm.lblCargo.Left :=  pictureForm.lblCargo.Left -5;
   end;
end;

procedure TeditForm.Button6Click(Sender: TObject);
begin
   Case tipoData.ItemIndex of
      0: pictureForm.lblNombre.Left :=  pictureForm.lblNombre.Left +5;
      1: pictureForm.lblCarnet.Left :=  pictureForm.lblCarnet.Left +5;
      2: pictureForm.lblCargo.Left :=  pictureForm.lblCargo.Left +5;
   end;
end;

procedure TeditForm.Button7Click(Sender: TObject);
begin
   Case tipoData.ItemIndex of
      0: pictureForm.lblNombre.Width :=  pictureForm.lblNombre.Width +5;
      1: pictureForm.lblCarnet.Width :=  pictureForm.lblCarnet.Width +5;
      2: pictureForm.lblCargo.Width :=  pictureForm.lblCargo.Width +5;
   end;
end;

procedure TeditForm.Button8Click(Sender: TObject);
begin
    Case tipoData.ItemIndex of
        0: pictureForm.lblNombre.Width :=  pictureForm.lblNombre.Width -5;
        1: pictureForm.lblCarnet.Width :=  pictureForm.lblCarnet.Width -5;
        2: pictureForm.lblCargo.Width :=  pictureForm.lblCargo.Width -5;
     end;
end;

procedure TeditForm.comboPlantillasChange(Sender: TObject);
begin
    pictureForm.lblCargo.Caption := comboPlantillas.Text;
end;

procedure TeditForm.ComboBoxEx1Change(Sender: TObject);
begin
  Case ComboBoxEx1.ItemIndex of
      0:  pictureForm.templateImage.Picture.LoadFromFile('DATA\1.jpg');
      1:  pictureForm.templateImage.Picture.LoadFromFile('DATA\2.jpg');
      2:  pictureForm.templateImage.Picture.LoadFromFile('DATA\3.jpg');
      3:  pictureForm.templateImage.Picture.LoadFromFile('DATA\4.jpg');
      4:  pictureForm.templateImage.Picture.LoadFromFile('DATA\5.jpg');
  end;
end;

procedure TeditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TeditForm.inputNombreChange(Sender: TObject);
begin
     if (inputNombre.Text = '') then
        inputNombre.Text := '-- NOMBRE Y APELLIDOS--'
     else
        pictureForm.lblNombre.Caption := inputNombre.Text;
end;

procedure TeditForm.inputNombreClick(Sender: TObject);
begin
   inputNombre.SelectAll;
end;

procedure TeditForm.inputCarnetChange(Sender: TObject);
begin
     if (inputCarnet.Text = '') then
        inputCarnet.Text := '-- CARNET IDENTIDAD--'
     else
        pictureForm.lblCarnet.Caption := inputCarnet.Text;
end;

procedure TeditForm.inputCarnetClick(Sender: TObject);
begin
   inputCarnet.SelectAll;
end;

procedure TeditForm.inputCategoriaChange(Sender: TObject);
begin
     if (inputCategoria.Text = '') then
        inputCategoria.Text := '-- CARGO --'
     else
        pictureForm.lblCargo.Caption := inputCategoria.Text;
end;

procedure TeditForm.inputCategoriaClick(Sender: TObject);
begin
   inputCategoria.SelectAll;
end;

procedure TeditForm.tipoAccesoClick(Sender: TObject);
begin
  case tipoAcceso.ItemIndex of
    0:  Begin
          pictureForm.lblAcceso.Caption := 'ACCESO LIMITADO';
          pictureForm.lblAcceso.Top := 75;
        End;

    1: Begin
          pictureForm.lblAcceso.Caption := 'ACCESO LIBRE   ';
          pictureForm.lblAcceso.Top := 105;
       End;
  end;
end;

procedure TeditForm.procesarFont;
Begin

  case tipoData.ItemIndex of
      0: Begin
            FontDialog.Font.Size := pictureForm.lblNombre.Font.Size;
            FontDialog.Font.Name := pictureForm.lblNombre.Font.Name;
            FontDialog.Font.Color := pictureForm.lblNombre.Font.Color;
            FontDialog.Font.Style := pictureForm.lblNombre.Font.Style;

          if FontDialog.Execute then
            Begin
              pictureForm.lblNombre.Font.Size := FontDialog.Font.Size;
              pictureForm.lblNombre.Font.Name := FontDialog.Font.Name;
              pictureForm.lblNombre.Font.Color := FontDialog.Font.Color;
              pictureForm.lblNombre.Font.Style := FontDialog.Font.Style;
            End;
          end;

      1: Begin
            FontDialog.Font.Size := pictureForm.lblCarnet.Font.Size;
            FontDialog.Font.Name := pictureForm.lblCarnet.Font.Name;
            FontDialog.Font.Color := pictureForm.lblCarnet.Font.Color;
            FontDialog.Font.Style := pictureForm.lblCarnet.Font.Style;

          if FontDialog.Execute then
             Begin
               pictureForm.lblCarnet.Font.Size := FontDialog.Font.Size;
               pictureForm.lblCarnet.Font.Name := FontDialog.Font.Name;
               pictureForm.lblCarnet.Font.Color := FontDialog.Font.Color;
               pictureForm.lblCarnet.Font.Style := FontDialog.Font.Style;
             End;
         End;

      2: Begin
            FontDialog.Font.Size := pictureForm.lblCargo.Font.Size;
            FontDialog.Font.Name := pictureForm.lblCargo.Font.Name;
            FontDialog.Font.Color := pictureForm.lblCargo.Font.Color;
            FontDialog.Font.Style := pictureForm.lblCargo.Font.Style;

          if FontDialog.Execute then
             Begin
                pictureForm.lblCargo.Font.Size := FontDialog.Font.Size;
                pictureForm.lblCargo.Font.Name := FontDialog.Font.Name;
                pictureForm.lblCargo.Font.Color := FontDialog.Font.Color;
                pictureForm.lblCargo.Font.Style := FontDialog.Font.Style;
             End;
        End;
  end;
End;
END.

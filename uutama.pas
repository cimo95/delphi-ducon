Unit uutama;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, FileCtrl, XPMan, IniFiles, ComCtrls, StdCtrls, Buttons;

Type
  Tfutama = Class(TForm)
    PageControl1: TPageControl;
    tshitung: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    cbdari: TComboBox;
    cbke: TComboBox;
    gbdari: TGroupBox;
    edari: TEdit;
    gbke: TGroupBox;
    eke: TEdit;
    bbbersih: TBitBtn;
    bbproses: TBitBtn;
    tstabel: TTabSheet;
    gbentri: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    endari: TEdit;
    evke: TEdit;
    enke: TEdit;
    bbdhapus: TBitBtn;
    bbdsimpan: TBitBtn;
    lvdaftar: TListView;
    Procedure bbdsimpanClick(Sender: TObject);
    Procedure evkeChange(Sender: TObject);
    Procedure bbdhapusClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure edariChange(Sender: TObject);
    Procedure bbbersihClick(Sender: TObject);
    Procedure bbprosesClick(Sender: TObject);
    Procedure edariKeyPress(Sender: TObject; Var Key: Char);
    Procedure evkeKeyPress(Sender: TObject; Var Key: Char);
    Procedure cbdariChange(Sender: TObject);
  Private
    Procedure wmNCLButtonDown(Var Msg: TWMNCLButtonDown); Message WM_NCLBUTTONDOWN;
    Procedure wmNCLButtonUp(Var Msg: TWMNCLButtonUp); Message WM_NCLBUTTONUP;
  Public
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
  End;

Var
  futama: Tfutama;

Implementation

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi

Function fa(fpa, fpb: String): Boolean;
Var
  a: integer;
Begin
  With futama Do
    For a := 0 To lvdaftar.Items.Count - 1 Do
      If AnsiLowerCase(lvdaftar.Items.Item[a].Caption) = AnsiLowerCase(fpa) Then
        Result := AnsiLowerCase(lvdaftar.Items.Item[a].SubItems.Strings[1]) = AnsiLowerCase(fpb);
End;

Procedure pa;
Var
  a: TIniFile;
  b: integer;
Begin
  With futama Do
  Begin
    a := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
    a.EraseSection('data');
    a.WriteInteger('data', 'jumlah', lvdaftar.Items.Count);
    For b := 0 To lvdaftar.Items.Count - 1 Do
    Begin
      a.WriteString('data', 'dari-' + inttostr(b), lvdaftar.Items.Item[b].Caption);
      a.WriteString('data', 'ke-' + inttostr(b), lvdaftar.Items.Item[b].SubItems.Strings[1]);
      a.WriteString('data', 'val-' + inttostr(b), lvdaftar.Items.Item[b].SubItems.Strings[0]);
    End;
    a.Free;
  End;
End;

Function fb(fpa, fpb: String; fpc: double): String;
Var
  a: integer;
  b: double;
Begin
  With futama Do
  Begin
    For a := 0 To lvdaftar.Items.Count - 1 Do
      If AnsiLowerCase(lvdaftar.Items.Item[a].Caption) = AnsiLowerCase(fpa) Then
        If AnsiLowerCase(lvdaftar.Items.Item[a].SubItems.Strings[1]) = AnsiLowerCase(fpb) Then
          b := StrToFloat(lvdaftar.Items.Item[a].SubItems.Strings[0]);
    Result := floattostr(fpc * b);
  End;
End;

Function fc: pchar;
Begin
  Result := StrAlloc(10);
  GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SDECIMAL, Result, 10);
End;

Procedure Tfutama.wmNCLButtonDown(Var Msg: TWMNCLButtonDown);
Begin
  If Msg.HitTest = HTHELP Then
  Begin
    Msg.Result := 0;
  End
  Else
    Inherited;
End;

Procedure Tfutama.wmNCLButtonUp(Var Msg: TWMNCLButtonUp);
Begin
  If Msg.HitTest = HTHELP Then
  Begin
    Msg.Result := 0;
    MessageBox(Handle, 'DUCon - Dynamic Unit Converter'#13'Aplikasi sederhana konverter satuan yang dapat diubah sesuai kebutuhan'#13#13'Hak Cipta (C) 2018 Arachmadi Putra', 'Tentang DUCon', 64);
  End
  Else
    Inherited;
End;

Procedure Tfutama.bbdsimpanClick(Sender: TObject);
Var
  a: TListItem;
  b: integer;
Begin
  If fa(endari.Text, enke.Text) Then
  Begin
    ShowMessage('Mohon masukkan data yang berbeda, data yang anda masukkan sudah ada.');
    Exit;
  End;
  a := lvdaftar.Items.Add;
  a.Caption := endari.Text;
  a.SubItems.Add(evke.Text);
  a.SubItems.Add(enke.Text);
  pa;
  cbdari.Items.Clear;
  For b := 0 To lvdaftar.Items.Count - 1 Do
    cbdari.Items.Add(lvdaftar.Items.Item[b].Caption);
  cbdari.ItemIndex := 0;
  For b := 0 To lvdaftar.Items.Count - 1 Do
    If cbdari.Items.Strings[0] = lvdaftar.Items.Item[b].Caption Then
      cbke.Items.Add(lvdaftar.Items.Item[b].SubItems.Strings[1]);
  endari.Clear;
  evke.Text := '0';
  enke.Clear;
End;

Procedure Tfutama.evkeChange(Sender: TObject);
Begin
  If evke.Text = '' Then
    evke.Text := '0';
End;

Procedure Tfutama.bbdhapusClick(Sender: TObject);
Var
  a: integer;
Begin
  If (lvdaftar.SelCount = 0) Or (lvdaftar.Items.Count = 1) Then
    Exit;
  If lvdaftar.SelCount = lvdaftar.Items.Count Then
    lvdaftar.Items.Item[0].Selected := False;
  If MessageBox(handle, 'Apakah anda yakin ingin menghapus item yang terpilih ?', 'HAPUS item', 48 + 4) = mrno Then
    Exit
  Else
  Begin
    lvdaftar.DeleteSelected;
    cbdari.Items.Clear;
    For a := 0 To lvdaftar.Items.Count - 1 Do
      cbdari.Items.Add(lvdaftar.Items.Item[a].Caption);
    cbdari.ItemIndex := 0;
    cbke.Items.Clear;
    For a := 0 To lvdaftar.Items.Count - 1 Do
      If cbdari.Items.Strings[0] = lvdaftar.Items.Item[a].Caption Then
        cbke.Items.Add(lvdaftar.Items.Item[a].SubItems.Strings[1]);
    cbke.ItemIndex := 0;
  End;
End;

Procedure Tfutama.FormCreate(Sender: TObject);
Var
  a, b: integer;
  c: TIniFile;
  d: TListItem;
Begin
  If Not FileExists(ChangeFileExt(Application.ExeName, '.ini')) Then
    Exit;
  cbdari.Items.Delete(0);
  cbke.Items.Delete(0);
  lvdaftar.Clear;
  c := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  a := c.ReadInteger('data', 'jumlah', 0);
  For b := 0 To a - 1 Do
  Begin
    d := lvdaftar.Items.Add;
    d.Caption := c.ReadString('data', 'dari-' + inttostr(b), '');
    d.SubItems.Add(c.ReadString('data', 'val-' + inttostr(b), ''));
    d.SubItems.Add(c.ReadString('data', 'ke-' + inttostr(b), ''));
  End;
  For a := 0 To lvdaftar.Items.Count - 1 Do
  Begin
    cbdari.Items.Add(lvdaftar.Items.Item[a].Caption);
    If lvdaftar.Items.Item[a].Caption = lvdaftar.Items.Item[0].Caption Then
      cbke.Items.Add(lvdaftar.Items.Item[a].SubItems.Strings[1])
  End;
  cbdari.ItemIndex := 0;
  cbke.ItemIndex := 0;
  c.Free;
End;

Procedure Tfutama.edariChange(Sender: TObject);
Begin
  If edari.Text = '' Then
    edari.Text := '0';
End;

Procedure Tfutama.bbbersihClick(Sender: TObject);
Begin
  edari.Text := '0';
  eke.Text := '0';
End;

Procedure Tfutama.bbprosesClick(Sender: TObject);
Begin
  eke.Text := fb(cbdari.Items.Strings[cbdari.itemindex], cbke.Items.Strings[cbke.itemindex], StrToFloat(edari.Text));
End;

Procedure Tfutama.edariKeyPress(Sender: TObject; Var Key: Char);
Var
  a: char;
Begin
  a := #0;
  If (Key = fc^) And (Pos(fc^, edari.Text) = 0) Then
    a := fc^;
  If Not (Key In ['0'..'9', #8, a]) Then
    Key := #0;
End;

Procedure Tfutama.evkeKeyPress(Sender: TObject; Var Key: Char);
Var
  a: char;
Begin
  a := #0;
  If (Key = fc^) And (Pos(fc^, edari.Text) = 0) Then
    a := fc^;
  If Not (Key In ['0'..'9', #8, a]) Then
    Key := #0;
End;

Procedure Tfutama.cbdariChange(Sender: TObject);
Var
  a: integer;
Begin
  cbke.Items.Clear;
  For a := 0 To lvdaftar.Items.Count - 1 Do
    If lvdaftar.Items.Item[a].Caption = cbdari.Items.Strings[cbdari.ItemIndex] Then
      cbke.Items.Add(lvdaftar.Items.Item[a].SubItems.Strings[1]);
  cbke.ItemIndex := 0;
  bbbersih.Click;
End;

End.


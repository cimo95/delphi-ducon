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

Function fDupCek(sDari, sKe: String): Boolean;
Var
  i, j: integer;
Begin
  With futama Do
    For i := 0 To lvdaftar.Items.Count - 1 Do
      If AnsiLowerCase(lvdaftar.Items.Item[i].Caption) = AnsiLowerCase(sDari) Then
        Result := AnsiLowerCase(lvdaftar.Items.Item[i].SubItems.Strings[1]) = AnsiLowerCase(sKe);
End;

Procedure pSimpanIni;
Var
  tif: TIniFile;
  i: integer;
Begin
  With futama Do
  Begin
    tif := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
    tif.EraseSection('data');
    tif.WriteInteger('data', 'jumlah', lvdaftar.Items.Count);
    For i := 0 To lvdaftar.Items.Count - 1 Do
    Begin
      tif.WriteString('data', 'dari-' + inttostr(i), lvdaftar.Items.Item[i].Caption);
      tif.WriteString('data', 'ke-' + inttostr(i), lvdaftar.Items.Item[i].SubItems.Strings[1]);
      tif.WriteString('data', 'val-' + inttostr(i), lvdaftar.Items.Item[i].SubItems.Strings[0]);
    End;
    tif.Free;
  End;
End;

Function fKonversi(sDari, sKe: String; rval: double): String;
Var
  i: integer;
  r: double;
Begin
  With futama Do
  Begin
    For i := 0 To lvdaftar.Items.Count - 1 Do
      If AnsiLowerCase(lvdaftar.Items.Item[i].Caption) = AnsiLowerCase(sDari) Then
        If AnsiLowerCase(lvdaftar.Items.Item[i].SubItems.Strings[1]) = AnsiLowerCase(sKe) Then
          r := StrToFloat(lvdaftar.Items.Item[i].SubItems.Strings[0]);
    Result := floattostr(rval * r);
  End;
End;

Function fKoma: pchar;
Begin
  result := StrAlloc(10);
  GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SDECIMAL, result, 10);
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
  tli: TListItem;
  i: integer;
Begin
  If fDupCek(endari.Text, enke.Text) Then
  Begin
    ShowMessage('Mohon masukkan data yang berbeda, data yang anda masukkan sudah ada.');
    Exit;
  End;
  tli := lvdaftar.Items.Add;
  tli.Caption := endari.Text;
  tli.SubItems.Add(evke.Text);
  tli.SubItems.Add(enke.Text);
  pSimpanIni;
  cbdari.Items.Clear;
  For i := 0 To lvdaftar.Items.Count - 1 Do
    cbdari.Items.Add(lvdaftar.Items.Item[i].Caption);
  cbdari.ItemIndex := 0;
  For i := 0 To lvdaftar.Items.Count - 1 Do
    If cbdari.Items.Strings[0] = lvdaftar.Items.Item[i].Caption Then
      cbke.Items.Add(lvdaftar.Items.Item[i].SubItems.Strings[1]);
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
  i: integer;
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
    For i := 0 To lvdaftar.Items.Count - 1 Do
      cbdari.Items.Add(lvdaftar.Items.Item[i].Caption);
    cbdari.ItemIndex := 0;
    cbke.Items.Clear;
    For i := 0 To lvdaftar.Items.Count - 1 Do
      If cbdari.Items.Strings[0] = lvdaftar.Items.Item[i].Caption Then
        cbke.Items.Add(lvdaftar.Items.Item[i].SubItems.Strings[1]);
    cbke.ItemIndex := 0;
  End;
End;

Procedure Tfutama.FormCreate(Sender: TObject);
Var
  i, j: integer;
  tif: TIniFile;
  tli: TListItem;
Begin
  If Not FileExists(ChangeFileExt(Application.ExeName, '.ini')) Then
    Exit;
  cbdari.Items.Delete(0);
  cbke.Items.Delete(0);
  lvdaftar.Clear;
  tif := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  i := tif.ReadInteger('data', 'jumlah', 0);
  For j := 0 To i - 1 Do
  Begin
    tli := lvdaftar.Items.Add;
    tli.Caption := tif.ReadString('data', 'dari-' + inttostr(j), '');
    tli.SubItems.Add(tif.ReadString('data', 'val-' + inttostr(j), ''));
    tli.SubItems.Add(tif.ReadString('data', 'ke-' + inttostr(j), ''));
  End;
  For i := 0 To lvdaftar.Items.Count - 1 Do
  Begin
    cbdari.Items.Add(lvdaftar.Items.Item[i].Caption);
    If lvdaftar.Items.Item[i].Caption = lvdaftar.Items.Item[0].Caption Then
      cbke.Items.Add(lvdaftar.Items.Item[i].SubItems.Strings[1])
  End;
  cbdari.ItemIndex := 0;
  cbke.ItemIndex := 0;
  tif.Free;
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
  eke.Text := fKonversi(cbdari.Items.Strings[cbdari.itemindex], cbke.Items.Strings[cbke.itemindex], StrToFloat(edari.Text));
End;

Procedure Tfutama.edariKeyPress(Sender: TObject; Var Key: Char);
Var
  c: char;
Begin
  c := #0;
  If (Key = fKoma^) And (Pos(fKoma^, edari.Text) = 0) Then
    c := fKoma^;
  If Not (Key In ['0'..'9', #8, c]) Then
    Key := #0;
End;

Procedure Tfutama.evkeKeyPress(Sender: TObject; Var Key: Char);
Var
  c: char;
Begin
  c := #0;
  If (Key = fKoma^) And (Pos(fKoma^, edari.Text) = 0) Then
    c := fKoma^;
  If Not (Key In ['0'..'9', #8]) Then
    Key := #0;
End;

Procedure Tfutama.cbdariChange(Sender: TObject);
Var
  i: integer;
Begin
  cbke.Items.Clear;
  For i := 0 To lvdaftar.Items.Count - 1 Do
    If lvdaftar.Items.Item[i].Caption = cbdari.Items.Strings[cbdari.ItemIndex] Then
      cbke.Items.Add(lvdaftar.Items.Item[i].SubItems.Strings[1]);
  cbke.ItemIndex := 0;
  bbbersih.Click;
End;

End.


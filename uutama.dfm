object futama: Tfutama
  Left = 500
  Top = 262
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Ducon 1.0'
  ClientHeight = 246
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  PrintScale = poPrintToFit
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 289
    Height = 233
    ActivePage = tshitung
    TabOrder = 0
    object tshitung: TTabSheet
      Caption = 'P&enghitung'
      object Label1: TLabel
        Left = 0
        Top = 3
        Width = 29
        Height = 13
        Caption = '&Dari : '
        FocusControl = cbdari
      end
      object Label2: TLabel
        Left = 143
        Top = 3
        Width = 22
        Height = 13
        Caption = '&Ke : '
        FocusControl = cbke
      end
      object cbdari: TComboBox
        Left = 27
        Top = 0
        Width = 110
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 0
        Text = 'menit'
        OnChange = cbdariChange
        Items.Strings = (
          'menit')
      end
      object cbke: TComboBox
        Left = 167
        Top = 0
        Width = 110
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 1
        Text = 'detik'
        Items.Strings = (
          'detik')
      end
      object gbdari: TGroupBox
        Left = 0
        Top = 24
        Width = 281
        Height = 73
        Caption = 'INPUT'
        TabOrder = 2
        object edari: TEdit
          Left = 8
          Top = 16
          Width = 265
          Height = 50
          AutoSize = False
          BiDiMode = bdLeftToRight
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -35
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 14
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnChange = edariChange
          OnKeyPress = edariKeyPress
        end
      end
      object gbke: TGroupBox
        Left = 0
        Top = 97
        Width = 281
        Height = 73
        Caption = 'HASIL'
        TabOrder = 3
        object eke: TEdit
          Left = 8
          Top = 16
          Width = 265
          Height = 50
          AutoSize = False
          BiDiMode = bdLeftToRight
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -35
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
      end
      object bbbersih: TBitBtn
        Left = 189
        Top = 176
        Width = 89
        Height = 25
        Caption = '&BERSIHKAN'
        TabOrder = 4
        OnClick = bbbersihClick
        Kind = bkNo
      end
      object bbproses: TBitBtn
        Left = 109
        Top = 176
        Width = 75
        Height = 25
        Caption = '&PROSES'
        TabOrder = 5
        OnClick = bbprosesClick
        Kind = bkAll
      end
    end
    object tstabel: TTabSheet
      Caption = 'D&aftar Satuan'
      ImageIndex = 1
      object gbentri: TGroupBox
        Left = 0
        Top = 0
        Width = 278
        Height = 65
        Caption = 'Entri'
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 17
          Width = 8
          Height = 16
          Caption = '1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 101
          Top = 17
          Width = 11
          Height = 16
          Caption = '='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object endari: TEdit
          Left = 19
          Top = 15
          Width = 78
          Height = 21
          TabOrder = 0
        end
        object evke: TEdit
          Left = 117
          Top = 15
          Width = 74
          Height = 21
          TabOrder = 1
          Text = '0'
          OnChange = evkeChange
          OnKeyPress = evkeKeyPress
        end
        object enke: TEdit
          Left = 194
          Top = 15
          Width = 80
          Height = 21
          TabOrder = 2
        end
        object bbdhapus: TBitBtn
          Left = 205
          Top = 40
          Width = 70
          Height = 17
          Caption = '&HAPUS'
          TabOrder = 3
          OnClick = bbdhapusClick
          Kind = bkNo
        end
        object bbdsimpan: TBitBtn
          Left = 2
          Top = 40
          Width = 75
          Height = 17
          Caption = '&SIMPAN'
          ModalResult = 1
          TabOrder = 4
          OnClick = bbdsimpanClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
      object lvdaftar: TListView
        Left = 0
        Top = 67
        Width = 278
        Height = 137
        BorderStyle = bsNone
        Columns = <
          item
            Caption = 'Dari'
            Width = 100
          end
          item
            Caption = 'Sebesar'
            Width = 70
          end
          item
            Caption = 'Ke'
            Width = 100
          end>
        Ctl3D = False
        GridLines = True
        Items.Data = {
          2F0000000100000000000000FFFFFFFFFFFFFFFF0200000000000000054D656E
          697402363005446574696BFFFFFFFF}
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
  end
end

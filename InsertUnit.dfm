object DataInsertForm: TDataInsertForm
  Left = 0
  Top = 0
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1085#1085#1099#1077' '
  ClientHeight = 280
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object labCategory: TLabel
    Left = 8
    Top = 40
    Width = 54
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
  end
  object labThing: TLabel
    Left = 8
    Top = 67
    Width = 44
    Height = 13
    Caption = #1055#1088#1077#1076#1084#1077#1090
  end
  object labPrice: TLabel
    Left = 8
    Top = 94
    Width = 54
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
  end
  object labQuantity: TLabel
    Left = 8
    Top = 121
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object labWho: TLabel
    Left = 8
    Top = 148
    Width = 24
    Height = 13
    Caption = #1050#1090#1086'?'
  end
  object labWhere: TLabel
    Left = 8
    Top = 175
    Width = 24
    Height = 13
    Caption = #1043#1076#1077'?'
  end
  object labStatus: TLabel
    Left = 8
    Top = 13
    Width = 37
    Height = 13
    Caption = #1057#1090#1072#1090#1100#1103
  end
  object labCommentary: TLabel
    Left = 8
    Top = 202
    Width = 67
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object editCategory: TEdit
    Left = 104
    Top = 37
    Width = 586
    Height = 21
    TabOrder = 0
  end
  object editThing: TEdit
    Left = 104
    Top = 64
    Width = 586
    Height = 21
    TabOrder = 1
  end
  object editPrice: TEdit
    Left = 104
    Top = 91
    Width = 586
    Height = 21
    TabOrder = 2
  end
  object editQuantity: TEdit
    Left = 104
    Top = 118
    Width = 586
    Height = 21
    TabOrder = 3
  end
  object bnAddButton: TButton
    Left = 296
    Top = 226
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = bnAddButtonClick
  end
  object cbStatus: TComboBox
    Left = 104
    Top = 9
    Width = 586
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 5
    Items.Strings = (
      #1044#1086#1093#1086#1076
      #1056#1072#1089#1093#1086#1076)
  end
  object editWho: TEdit
    Left = 104
    Top = 145
    Width = 586
    Height = 21
    TabOrder = 6
  end
  object editWhere: TEdit
    Left = 104
    Top = 172
    Width = 586
    Height = 21
    TabOrder = 7
  end
  object editCommentary: TEdit
    Left = 104
    Top = 199
    Width = 586
    Height = 21
    TabOrder = 8
  end
end

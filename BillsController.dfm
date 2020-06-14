object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'BillsController'
  ClientHeight = 550
  ClientWidth = 1189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object lvDataView: TListView
    Left = 8
    Top = 39
    Width = 1173
    Height = 502
    BevelWidth = 200
    BorderWidth = 1
    Color = clMoneyGreen
    Columns = <
      item
        Caption = #1044#1072#1090#1072
        MinWidth = 105
        Width = 105
      end
      item
        Caption = #1057#1090#1072#1090#1100#1103
        MinWidth = 50
      end
      item
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        MinWidth = 150
        Width = 150
      end
      item
        Caption = #1055#1088#1077#1076#1084#1077#1090
        MinWidth = 150
        Width = 150
      end
      item
        Caption = #1057#1090#1086#1080'-'#1089#1090#1100
        MinWidth = 60
        Width = 60
      end
      item
        Caption = #1050#1086#1083'-'#1074#1086
        MinWidth = 50
      end
      item
        Caption = #1040#1082#1094#1077#1087#1090#1072#1090#1086#1088
        MinWidth = 150
        Width = 150
      end
      item
        Caption = #1052#1077#1089#1090#1086' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
        MinWidth = 150
        Width = 150
      end
      item
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        MinWidth = -2
        Width = -2
        WidthType = (
          -2)
      end>
    GridLines = True
    RowSelect = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    ViewStyle = vsReport
  end
  object btnAdd: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnEdit: TButton
    Left = 127
    Top = 8
    Width = 113
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnEditClick
  end
  object btnDelete: TButton
    Left = 246
    Top = 8
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object MainMenu: TMainMenu
    Left = 388
    object FileAction: TMenuItem
      Caption = #1060#1072#1081#1083
      object Saving: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = SavingClick
      end
      object Open: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = OpenClick
      end
      object Close: TMenuItem
        Caption = #1042#1099#1093#1086#1076
      end
    end
    object Service: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object WinCalc: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1082#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
        OnClick = WinCalcClick
      end
    end
    object Help: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object About: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = AboutClick
      end
    end
  end
end

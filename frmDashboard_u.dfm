object frmDashboard: TfrmDashboard
  Left = 0
  Top = 0
  Caption = 'Dashboard'
  ClientHeight = 441
  ClientWidth = 1111
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = Menu
  Position = poDesktopCenter
  PrintScale = poPrintToFit
  WindowState = wsMaximized
  TextHeight = 21
  object Revenue: TMemo
    Left = 0
    Top = 48
    Width = 185
    Height = 337
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'Revenue')
    ParentFont = False
    TabOrder = 0
  end
  object Menu: TMainMenu
    Left = 8
    object Home1: TMenuItem
      Caption = 'Home'
      object Manger1: TMenuItem
        Caption = 'Mangers'
        OnClick = Manger1Click
      end
      object eamLeads1: TMenuItem
        Caption = 'Team Leads'
      end
      object Executives1: TMenuItem
        Caption = 'Executives'
      end
    end
    object About1: TMenuItem
      Caption = 'About'
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Exit1: TMenuItem
        Caption = 'Exit'
      end
    end
    object Exit2: TMenuItem
      Caption = 'Users'
    end
    object Exit3: TMenuItem
      Caption = 'Exit'
    end
  end
end

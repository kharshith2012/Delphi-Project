object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 232
  ClientWidth = 617
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 112
    Top = 70
    Width = 32
    Height = 21
    Caption = 'User'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 112
    Top = 110
    Width = 66
    Height = 21
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object txtUser: TEdit
    Left = 224
    Top = 70
    Width = 209
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 224
    Top = 107
    Width = 209
    Height = 23
    TabOrder = 1
  end
  object Login: TButton
    Left = 358
    Top = 166
    Width = 75
    Height = 35
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = LoginClick
  end
  object btnCancel: TButton
    Left = 270
    Top = 166
    Width = 75
    Height = 35
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end

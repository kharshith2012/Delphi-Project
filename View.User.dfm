object frmUser: TfrmUser
  Left = 0
  Top = 0
  Caption = 'User'
  ClientHeight = 458
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object pnlUser: TPanel
    Left = 8
    Top = 8
    Width = 585
    Height = 169
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 56
      Width = 58
      Height = 15
      Caption = 'User Name'
    end
    object btnCancel: TBitBtn
      Left = 136
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object btnSave: TButton
      Left = 217
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object edtUserName: TEdit
      Left = 136
      Top = 53
      Width = 201
      Height = 23
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 183
    Width = 585
    Height = 206
    Caption = 'Panel1'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 39
      Width = 577
      Height = 201
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object btnLoadUser: TButton
      Left = 502
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Load Users'
      TabOrder = 1
      OnClick = btnLoadUserClick
    end
    object edtUserID: TEdit
      Left = 375
      Top = 10
      Width = 121
      Height = 23
      TabOrder = 2
    end
  end
end

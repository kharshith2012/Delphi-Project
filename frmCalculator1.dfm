object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calculator'
  ClientHeight = 268
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Display: TEdit
    Left = 48
    Top = 24
    Width = 355
    Height = 25
    TabOrder = 0
  end
  object btn9: TButton
    Left = 232
    Top = 159
    Width = 75
    Height = 25
    Caption = '9'
    TabOrder = 1
    OnClick = NumberClick
  end
  object BtnEquals: TButton
    Left = 232
    Top = 207
    Width = 75
    Height = 25
    Caption = '='
    TabOrder = 2
    OnClick = EqualsClick
  end
  object btn0: TButton
    Left = 136
    Top = 207
    Width = 75
    Height = 25
    Caption = '0'
    TabOrder = 3
    OnClick = NumberClick
  end
  object btn1: TButton
    Left = 48
    Top = 63
    Width = 75
    Height = 25
    Caption = '1'
    TabOrder = 4
    OnClick = NumberClick
  end
  object btn2: TButton
    Left = 136
    Top = 63
    Width = 75
    Height = 25
    Caption = '2'
    TabOrder = 5
    OnClick = NumberClick
  end
  object btn3: TButton
    Left = 232
    Top = 63
    Width = 75
    Height = 25
    Caption = '3'
    TabOrder = 6
    OnClick = NumberClick
  end
  object btn4: TButton
    Left = 48
    Top = 111
    Width = 75
    Height = 25
    Caption = '4'
    TabOrder = 7
    OnClick = NumberClick
  end
  object btn5: TButton
    Left = 136
    Top = 111
    Width = 75
    Height = 25
    Caption = '5'
    TabOrder = 8
    OnClick = NumberClick
  end
  object btn6: TButton
    Left = 232
    Top = 111
    Width = 75
    Height = 25
    Caption = '6'
    TabOrder = 9
    OnClick = NumberClick
  end
  object btn7: TButton
    Left = 48
    Top = 159
    Width = 75
    Height = 25
    Caption = '7'
    TabOrder = 10
    OnClick = NumberClick
  end
  object btn8: TButton
    Left = 136
    Top = 159
    Width = 75
    Height = 25
    Caption = '8'
    TabOrder = 11
    OnClick = NumberClick
  end
  object Button10: TButton
    Left = 48
    Top = 207
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 12
    OnClick = ClearClick
  end
  object Add: TButton
    Left = 328
    Top = 63
    Width = 75
    Height = 25
    Caption = '+'
    TabOrder = 13
    OnClick = OperatorClick
  end
  object Subtract: TButton
    Left = 328
    Top = 111
    Width = 75
    Height = 25
    Caption = '-'
    TabOrder = 14
    OnClick = OperatorClick
  end
  object Multiply: TButton
    Left = 328
    Top = 159
    Width = 75
    Height = 25
    Caption = '*'
    TabOrder = 15
    OnClick = OperatorClick
  end
  object BtnDivide: TButton
    Left = 328
    Top = 207
    Width = 75
    Height = 25
    Caption = '/'
    TabOrder = 16
    OnClick = OperatorClick
  end
end

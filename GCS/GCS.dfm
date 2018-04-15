object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 573
  ClientWidth = 920
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clTeal
  Font.Height = -11
  Font.Name = 'Exo'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClick = Button1Click
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 914
    Height = 32
    Align = alTop
    Alignment = taCenter
    Caption = 'GROUND CONTROL STATION'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Exo'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 297
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 8
    Top = 41
    Width = 721
    Height = 289
    Caption = 'Graphics Box'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Chart2: TChart
      Left = 368
      Top = 22
      Width = 334
      Height = 203
      Legend.Font.Color = 8421440
      Title.Font.Color = 8421440
      Title.Font.Height = -13
      Title.Text.Strings = (
        'Gyroscope')
      View3D = False
      Color = clWhite
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 18
      object LineSeries1: TLineSeries
        Legend.Text = 'GyrX'
        LegendTitle = 'GyrX'
        SeriesColor = clRed
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object LineSeries2: TLineSeries
        Legend.Text = 'GyrY'
        LegendTitle = 'GyrY'
        SeriesColor = 16744448
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object LineSeries3: TLineSeries
        Legend.Text = 'GyrZ'
        LegendTitle = 'GyrZ'
        SeriesColor = clYellow
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart1: TChart
      Left = 20
      Top = 22
      Width = 334
      Height = 203
      Legend.Font.Color = 8421440
      Title.Font.Color = 8421440
      Title.Font.Height = -13
      Title.Text.Strings = (
        'Accelerometer')
      View3D = False
      Color = clWhite
      TabOrder = 1
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 18
      object Series1: TLineSeries
        Legend.Text = 'AccX'
        LegendTitle = 'AccX'
        SeriesColor = clRed
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series2: TLineSeries
        Legend.Text = 'AccY'
        LegendTitle = 'AccY'
        SeriesColor = 16744448
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series3: TLineSeries
        Legend.Text = 'AccZ'
        LegendTitle = 'AccZ'
        SeriesColor = clYellow
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Edit1: TEdit
      Left = 20
      Top = 248
      Width = 78
      Height = 24
      TabOrder = 2
      Text = 'Acc X'
    end
    object Edit2: TEdit
      Left = 148
      Top = 248
      Width = 78
      Height = 24
      TabOrder = 3
      Text = 'Acc Y'
    end
    object Edit3: TEdit
      Left = 276
      Top = 248
      Width = 78
      Height = 24
      TabOrder = 4
      Text = 'Acc Z'
    end
    object Edit4: TEdit
      Left = 368
      Top = 248
      Width = 78
      Height = 24
      TabOrder = 5
      Text = 'Gyro X'
    end
    object Edit5: TEdit
      Left = 496
      Top = 248
      Width = 78
      Height = 24
      TabOrder = 6
      Text = 'Gyro Y'
    end
    object Edit6: TEdit
      Left = 624
      Top = 248
      Width = 78
      Height = 24
      TabOrder = 7
      Text = 'Gyro Z'
    end
  end
  object GroupBox2: TGroupBox
    Left = 751
    Top = 192
    Width = 154
    Height = 138
    Caption = 'Send Box'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 36
      Width = 121
      Height = 25
      Caption = 'SEND'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 16
      Top = 86
      Width = 121
      Height = 25
      Caption = 'TAKE PICTURE'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 751
    Top = 41
    Width = 154
    Height = 136
    Caption = 'COM Box'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Button2: TButton
      Left = 16
      Top = 83
      Width = 121
      Height = 25
      Caption = 'OPEN'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button5: TButton
      Left = 16
      Top = 30
      Width = 121
      Height = 25
      Caption = 'SETTING'
      TabOrder = 1
      OnClick = Button5Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 336
    Width = 321
    Height = 229
    Caption = 'Terminal Box'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Button3: TButton
      Left = 104
      Top = 191
      Width = 97
      Height = 25
      Caption = 'SAVE'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button3Click
    end
    object Memo1: TMemo
      Left = 6
      Top = 24
      Width = 307
      Height = 161
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      OnChange = ScrollToLastLine
    end
  end
  object GroupBox5: TGroupBox
    Left = 352
    Top = 336
    Width = 553
    Height = 229
    Caption = 'Picture Box'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object PaintBox1: TPaintBox
      Left = 24
      Top = 23
      Width = 150
      Height = 150
    end
    object Label3: TLabel
      Left = 24
      Top = 192
      Width = 65
      Height = 16
      Alignment = taCenter
      Caption = 'COMPASS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Image1: TImage
      Left = 343
      Top = 18
      Width = 200
      Height = 200
      AutoSize = True
    end
    object Edit9: TEdit
      Left = 95
      Top = 189
      Width = 78
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Yaw'
    end
    object TypeGrp: TRadioGroup
      Left = 180
      Top = 16
      Width = 141
      Height = 81
      Caption = 'Compass Type'
      ItemIndex = 0
      Items.Strings = (
        'Rotate dial'
        'Rotate pointer')
      TabOrder = 1
    end
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnRxChar = ComPortRxChar
    Left = 880
    Top = 8
  end
end

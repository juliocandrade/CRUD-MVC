object frmConfiguracoes: TfrmConfiguracoes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 545
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnlPrincipal: TPanel
    Left = 5
    Top = 62
    Width = 435
    Height = 405
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 56
    ExplicitWidth = 185
    ExplicitHeight = 41
    object StackPanel2: TStackPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 405
      Align = alClient
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = Label1
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpTop
        end
        item
          Control = cbBanco
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = Label3
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpTop
        end
        item
          Control = edtProtocol
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = Label7
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpTop
        end
        item
          Control = edtServer
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = Label4
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpTop
        end
        item
          Control = edtPort
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = Label5
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpTop
        end
        item
          Control = edtDatabase
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = Label2
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpTop
        end
        item
          Control = edtUsername
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = Label6
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpTop
        end
        item
          Control = edtPassword
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end>
      Padding.Top = 5
      Padding.Right = 10
      Spacing = 4
      TabOrder = 0
      ExplicitWidth = 314
      ExplicitHeight = 111
      object Label1: TLabel
        Left = 0
        Top = 5
        Width = 425
        Height = 19
        Align = alTop
        Caption = 'Banco de dados'
      end
      object cbBanco: TComboBox
        Left = 0
        Top = 28
        Width = 425
        Height = 27
        Align = alClient
        Style = csDropDownList
        Sorted = True
        TabOrder = 2
        Items.Strings = (
          'FB'
          'SQLite')
      end
      object Label3: TLabel
        Left = 0
        Top = 59
        Width = 425
        Height = 19
        Align = alTop
        Caption = 'Protocol'
      end
      object edtProtocol: TEdit
        Left = 0
        Top = 82
        Width = 425
        Height = 27
        Align = alClient
        TabOrder = 6
      end
      object Label7: TLabel
        Left = 0
        Top = 113
        Width = 425
        Height = 19
        Align = alTop
        Caption = 'Server'
      end
      object edtServer: TEdit
        Left = 0
        Top = 136
        Width = 425
        Height = 27
        Align = alClient
        TabOrder = 3
      end
      object Label4: TLabel
        Left = 0
        Top = 167
        Width = 425
        Height = 19
        Align = alTop
        Caption = 'Port'
      end
      object edtPort: TEdit
        Left = 0
        Top = 190
        Width = 425
        Height = 27
        Align = alClient
        TabOrder = 4
      end
      object Label5: TLabel
        Left = 0
        Top = 221
        Width = 425
        Height = 19
        Align = alTop
        Caption = 'Database'
      end
      object edtDatabase: TEdit
        Left = 0
        Top = 244
        Width = 425
        Height = 27
        Align = alClient
        TabOrder = 0
      end
      object Label2: TLabel
        Left = 0
        Top = 275
        Width = 425
        Height = 19
        Align = alTop
        Caption = 'Username'
      end
      object edtUsername: TEdit
        Left = 0
        Top = 298
        Width = 425
        Height = 27
        Align = alClient
        TabOrder = 1
      end
      object Label6: TLabel
        Left = 0
        Top = 329
        Width = 425
        Height = 19
        Align = alTop
        Caption = 'Password'
      end
      object edtPassword: TEdit
        Left = 0
        Top = 352
        Width = 425
        Height = 27
        Align = alClient
        TabOrder = 5
      end
    end
  end
  object pnlCadastroBotoes: TPanel
    Left = 5
    Top = 467
    Width = 435
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = -224
    ExplicitTop = 360
    ExplicitWidth = 668
    object bntCancelar: TButton
      Left = 343
      Top = 0
      Width = 92
      Height = 73
      Align = alRight
      Caption = 'Cancelar'
      ImageIndex = 1
      ImageMargins.Top = 10
      TabOrder = 1
      OnClick = bntCancelarClick
      ExplicitLeft = 576
    end
    object btnSalvar: TButton
      Left = 251
      Top = 0
      Width = 92
      Height = 73
      Align = alRight
      Caption = 'Salvar'
      ImageIndex = 7
      ImageMargins.Top = 10
      TabOrder = 0
      OnClick = btnSalvarClick
      ExplicitLeft = 484
    end
  end
  object pnlCadastroTop: TPanel
    Left = 5
    Top = 5
    Width = 435
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 10
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = -224
    ExplicitTop = 0
    ExplicitWidth = 668
    object lblPage: TLabel
      Left = 10
      Top = 0
      Width = 425
      Height = 57
      Align = alClient
      Caption = 'Alterar Configura'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 178
      ExplicitHeight = 19
    end
  end
end

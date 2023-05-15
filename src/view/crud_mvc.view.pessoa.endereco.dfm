object frmPessoaEndereco: TfrmPessoaEndereco
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Endere'#231'o'
  ClientHeight = 350
  ClientWidth = 688
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
  PixelsPerInch = 96
  TextHeight = 19
  object pnlPrincipal: TPanel
    Left = 5
    Top = 5
    Width = 678
    Height = 340
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object pnlCadastroTop: TPanel
      Left = 0
      Top = 0
      Width = 678
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 10
      ParentBackground = False
      TabOrder = 0
      object lblPage: TLabel
        Left = 10
        Top = 0
        Width = 668
        Height = 57
        Align = alClient
        Caption = 'Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 73
        ExplicitHeight = 19
      end
    end
    object pnlCadastroPrincipal: TPanel
      Left = 0
      Top = 57
      Width = 678
      Height = 210
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 20
      Padding.Top = 10
      Padding.Right = 20
      Padding.Bottom = 10
      TabOrder = 1
      object pnlDados: TPanel
        Left = 20
        Top = 10
        Width = 638
        Height = 297
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object StackPanel1: TStackPanel
          Left = 0
          Top = 0
          Width = 638
          Height = 297
          Align = alClient
          BevelOuter = bvNone
          ControlCollection = <
            item
              Control = Panel1
              HorizontalPositioning = sphpFill
              VerticalPositioning = spvpTop
            end
            item
              Control = Panel2
              HorizontalPositioning = sphpFill
              VerticalPositioning = spvpTop
            end
            item
              Control = Panel3
              HorizontalPositioning = sphpFill
              VerticalPositioning = spvpTop
            end>
          Spacing = 4
          TabOrder = 0
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 638
            Height = 52
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Panel4: TPanel
              Left = 127
              Top = 0
              Width = 511
              Height = 52
              Align = alClient
              BevelOuter = bvNone
              Padding.Left = 10
              TabOrder = 1
              object Label5: TLabel
                Left = 10
                Top = 0
                Width = 501
                Height = 19
                Align = alTop
                Caption = 'Logradouro'
                ExplicitWidth = 82
              end
              object edtLogradouro: TEdit
                Left = 10
                Top = 23
                Width = 501
                Height = 27
                Align = alTop
                TabOrder = 0
              end
              object Panel10: TPanel
                Left = 10
                Top = 19
                Width = 501
                Height = 4
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 127
              Height = 52
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object Label6: TLabel
                Left = 0
                Top = 0
                Width = 127
                Height = 19
                Align = alTop
                Caption = 'CEP'
                ExplicitWidth = 28
              end
              object Panel9: TPanel
                Left = 0
                Top = 19
                Width = 127
                Height = 4
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
              end
              object Panel7: TPanel
                Left = 0
                Top = 23
                Width = 127
                Height = 29
                Align = alClient
                BevelOuter = bvNone
                Padding.Bottom = 2
                TabOrder = 1
                object edtCep: TEdit
                  Left = 0
                  Top = 0
                  Width = 127
                  Height = 27
                  Align = alClient
                  TabOrder = 0
                end
              end
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 56
            Width = 638
            Height = 52
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Panel5: TPanel
              Left = 306
              Top = 0
              Width = 332
              Height = 52
              Align = alRight
              BevelOuter = bvNone
              Padding.Left = 10
              TabOrder = 1
              object Label3: TLabel
                Left = 10
                Top = 0
                Width = 322
                Height = 19
                Align = alTop
                Caption = 'Bairro'
                ExplicitWidth = 42
              end
              object edtBairro: TEdit
                Left = 10
                Top = 23
                Width = 322
                Height = 27
                Align = alTop
                TabOrder = 0
              end
              object Panel12: TPanel
                Left = 10
                Top = 19
                Width = 322
                Height = 4
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
              end
            end
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 306
              Height = 52
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label4: TLabel
                Left = 0
                Top = 0
                Width = 306
                Height = 19
                Align = alTop
                Caption = 'Complemento'
                ExplicitWidth = 99
              end
              object edtComplemento: TEdit
                Left = 0
                Top = 23
                Width = 306
                Height = 27
                Align = alTop
                TabOrder = 0
              end
              object Panel11: TPanel
                Left = 0
                Top = 19
                Width = 306
                Height = 4
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
              end
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 112
            Width = 638
            Height = 52
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Panel16: TPanel
              Left = 306
              Top = 0
              Width = 332
              Height = 52
              Align = alRight
              BevelOuter = bvNone
              Padding.Left = 10
              TabOrder = 1
              object Label7: TLabel
                Left = 10
                Top = 0
                Width = 322
                Height = 19
                Align = alTop
                Caption = 'Cidade'
                ExplicitWidth = 48
              end
              object Panel17: TPanel
                Left = 10
                Top = 19
                Width = 322
                Height = 4
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
              end
              object Panel21: TPanel
                Left = 10
                Top = 23
                Width = 322
                Height = 29
                Align = alClient
                BevelOuter = bvNone
                Padding.Bottom = 2
                TabOrder = 1
                object edtCidade: TEdit
                  Left = 0
                  Top = 0
                  Width = 322
                  Height = 27
                  Align = alTop
                  TabOrder = 0
                end
              end
            end
            object Panel18: TPanel
              Left = 0
              Top = 0
              Width = 306
              Height = 52
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label8: TLabel
                Left = 0
                Top = 0
                Width = 306
                Height = 19
                Align = alTop
                Caption = 'UF'
                ExplicitWidth = 19
              end
              object Panel19: TPanel
                Left = 0
                Top = 19
                Width = 306
                Height = 4
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
              end
              object Panel15: TPanel
                Left = 0
                Top = 23
                Width = 306
                Height = 29
                Align = alClient
                BevelOuter = bvNone
                Padding.Bottom = 2
                TabOrder = 1
                object edtUf: TEdit
                  Left = 0
                  Top = 0
                  Width = 306
                  Height = 27
                  Align = alTop
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
    end
    object pnlCadastroBotoes: TPanel
      Left = 0
      Top = 267
      Width = 678
      Height = 73
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object bntCancelar: TButton
        Left = 586
        Top = 0
        Width = 92
        Height = 73
        Align = alRight
        Caption = 'Cancelar'
        ImageIndex = 1
        ImageMargins.Top = 10
        TabOrder = 1
        OnClick = bntCancelarClick
      end
      object btnSalvar: TButton
        Left = 494
        Top = 0
        Width = 92
        Height = 73
        Align = alRight
        Caption = 'Salvar'
        ImageIndex = 7
        ImageMargins.Top = 10
        TabOrder = 0
        OnClick = btnSalvarClick
      end
    end
  end
end

object frmPessoas: TfrmPessoas
  Left = 0
  Top = 0
  Caption = 'Cadastrar Pessoas'
  ClientHeight = 443
  ClientWidth = 678
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
  object PnlPrincipal: TCardPanel
    Left = 5
    Top = 5
    Width = 668
    Height = 433
    Align = alClient
    ActiveCard = cardCadastro
    BevelOuter = bvNone
    Caption = 'PnlPrincipal'
    ParentBackground = False
    TabOrder = 0
    OnCardChange = PnlPrincipalCardChange
    object cardCadastro: TCard
      Left = 0
      Top = 0
      Width = 668
      Height = 433
      Caption = 'cardCadastro'
      CardIndex = 0
      TabOrder = 1
      object pnlCadastroBotoes: TPanel
        Left = 0
        Top = 360
        Width = 668
        Height = 73
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object bntCancelar: TButton
          Left = 576
          Top = 0
          Width = 92
          Height = 73
          Align = alRight
          Caption = 'Cancelar'
          ImageAlignment = iaTop
          ImageIndex = 1
          ImageMargins.Top = 10
          TabOrder = 1
          OnClick = bntCancelarClick
        end
        object btnSalvar: TButton
          Left = 484
          Top = 0
          Width = 92
          Height = 73
          Align = alRight
          Caption = 'Salvar'
          ImageAlignment = iaTop
          ImageIndex = 7
          ImageMargins.Top = 10
          TabOrder = 0
          OnClick = btnSalvarClick
        end
      end
      object pnlCadastroPrincipal: TPanel
        Left = 0
        Top = 57
        Width = 668
        Height = 303
        Align = alClient
        BevelOuter = bvNone
        Padding.Left = 20
        Padding.Top = 10
        Padding.Right = 20
        Padding.Bottom = 10
        TabOrder = 1
        object pnlDadosPessoa: TPanel
          Left = 20
          Top = 10
          Width = 628
          Height = 111
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object StackPanel1: TStackPanel
            Left = 314
            Top = 0
            Width = 314
            Height = 111
            Align = alRight
            BevelOuter = bvNone
            ControlCollection = <
              item
                Control = Label6
                HorizontalPositioning = sphpFill
                VerticalPositioning = spvpTop
              end
              item
                Control = edtDocumento
                HorizontalPositioning = sphpFill
                VerticalPositioning = spvpFill
              end
              item
                Control = Label3
                HorizontalPositioning = sphpFill
                VerticalPositioning = spvpTop
              end
              item
                Control = edtTelefone
                HorizontalPositioning = sphpFill
                VerticalPositioning = spvpFill
              end>
            Padding.Left = 10
            Spacing = 4
            TabOrder = 1
            ExplicitLeft = 324
            object Label6: TLabel
              Left = 10
              Top = 0
              Width = 304
              Height = 19
              Align = alTop
              Caption = 'Documento'
            end
            object edtDocumento: TEdit
              Left = 10
              Top = 23
              Width = 304
              Height = 27
              Align = alClient
              TabOrder = 0
            end
            object Label3: TLabel
              Left = 10
              Top = 54
              Width = 304
              Height = 19
              Align = alTop
              Caption = 'Telefone'
            end
            object edtTelefone: TEdit
              Left = 10
              Top = 77
              Width = 304
              Height = 27
              Align = alClient
              TabOrder = 1
            end
          end
          object StackPanel2: TStackPanel
            Left = 0
            Top = 0
            Width = 314
            Height = 111
            Align = alClient
            BevelOuter = bvNone
            ControlCollection = <
              item
                Control = Label5
                HorizontalPositioning = sphpFill
                VerticalPositioning = spvpTop
              end
              item
                Control = edtNome
                HorizontalPositioning = sphpFill
                VerticalPositioning = spvpFill
              end
              item
                Control = Label2
                HorizontalPositioning = sphpFill
                VerticalPositioning = spvpTop
              end
              item
                Control = edtEmail
                HorizontalPositioning = sphpFill
                VerticalPositioning = spvpFill
              end>
            Padding.Right = 10
            Spacing = 4
            TabOrder = 0
            ExplicitWidth = 324
            object Label5: TLabel
              Left = 0
              Top = 0
              Width = 304
              Height = 19
              Align = alTop
              Caption = 'Nome'
            end
            object edtNome: TEdit
              Left = 0
              Top = 23
              Width = 304
              Height = 27
              Align = alClient
              TabOrder = 0
            end
            object Label2: TLabel
              Left = 0
              Top = 54
              Width = 304
              Height = 19
              Align = alTop
              Caption = 'Email'
            end
            object edtEmail: TEdit
              Left = 0
              Top = 77
              Width = 304
              Height = 27
              Align = alClient
              TabOrder = 1
            end
          end
        end
        object pnlDadosEndereco: TPanel
          Left = 20
          Top = 121
          Width = 628
          Height = 172
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 628
            Height = 19
            Align = alTop
            Caption = 'Endere'#231'os'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 72
          end
          object pnlDadosEnderecoButtons: TPanel
            Left = 0
            Top = 135
            Width = 628
            Height = 37
            Align = alBottom
            BevelOuter = bvNone
            Padding.Top = 5
            TabOrder = 1
            ExplicitTop = 145
            ExplicitWidth = 638
            object btnEnderecoExcluir: TButton
              Left = 184
              Top = 5
              Width = 92
              Height = 32
              Align = alLeft
              Caption = 'Excluir'
              ImageAlignment = iaTop
              ImageIndex = 1
              ImageMargins.Top = 10
              TabOrder = 2
              OnClick = btnEnderecoExcluirClick
            end
            object btnEnderecoIncluir: TButton
              Left = 0
              Top = 5
              Width = 92
              Height = 32
              Align = alLeft
              Caption = 'Incluir'
              ImageAlignment = iaTop
              ImageIndex = 7
              ImageMargins.Top = 10
              TabOrder = 0
              OnClick = btnEnderecoIncluirClick
            end
            object btnEnderecoAlterar: TButton
              Left = 92
              Top = 5
              Width = 92
              Height = 32
              Align = alLeft
              Caption = 'Alterar'
              ImageAlignment = iaTop
              ImageIndex = 1
              ImageMargins.Top = 10
              TabOrder = 1
              OnClick = btnEnderecoAlterarClick
            end
          end
          object dbGridEnderecos: TDBGrid
            Left = 0
            Top = 19
            Width = 628
            Height = 116
            Align = alClient
            DataSource = dsEnderecos
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -16
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'cep'
                Title.Caption = 'CEP'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'logradouro'
                Title.Caption = 'Logradouro'
                Width = 303
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'complemento'
                Title.Caption = 'Complemento'
                Width = 108
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'bairro'
                Title.Caption = 'Bairro'
                Width = 112
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cidade'
                Title.Caption = 'Cidade'
                Width = 145
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'uf'
                Title.Caption = 'UF'
                Width = 72
                Visible = True
              end>
          end
        end
      end
      object pnlCadastroTop: TPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 10
        ParentBackground = False
        TabOrder = 2
        object lblPage: TLabel
          Left = 10
          Top = 0
          Width = 658
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
    end
    object cardPesquisa: TCard
      Left = 0
      Top = 0
      Width = 668
      Height = 433
      Caption = 'cardPesquisa'
      CardIndex = 1
      TabOrder = 0
      object pnlPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 75
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnPesquisar: TButton
          Left = 576
          Top = 0
          Width = 92
          Height = 75
          Align = alRight
          Caption = 'Pesquisar'
          ImageAlignment = iaTop
          ImageIndex = 5
          ImageMargins.Top = 10
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 576
          Height = 75
          Align = alLeft
          BevelOuter = bvNone
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 20
          TabOrder = 0
          object Label1: TLabel
            Left = 0
            Top = 5
            Width = 571
            Height = 19
            Align = alTop
            Caption = 'Pesquisar'
            ExplicitWidth = 67
          end
          object edtPesquisar: TEdit
            Left = 0
            Top = 28
            Width = 571
            Height = 27
            Align = alBottom
            TabOrder = 0
            ExplicitTop = 34
          end
        end
      end
      object pnlPesquisarBotoes: TPanel
        Left = 0
        Top = 360
        Width = 668
        Height = 73
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object btnFechar: TButton
          Left = 576
          Top = 0
          Width = 92
          Height = 73
          Align = alRight
          Caption = 'Fechar'
          ImageAlignment = iaTop
          ImageIndex = 3
          ImageMargins.Top = 10
          TabOrder = 3
          OnClick = btnFecharClick
        end
        object btnIncluir: TButton
          Left = 0
          Top = 0
          Width = 92
          Height = 73
          Align = alLeft
          Caption = 'Incluir'
          ImageAlignment = iaTop
          ImageIndex = 4
          ImageMargins.Top = 10
          TabOrder = 0
          OnClick = btnIncluirClick
        end
        object btnAlterar: TButton
          Left = 92
          Top = 0
          Width = 92
          Height = 73
          Align = alLeft
          Caption = 'Alterar'
          ImageAlignment = iaTop
          ImageIndex = 0
          ImageMargins.Top = 10
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnExcluir: TButton
          Left = 184
          Top = 0
          Width = 92
          Height = 73
          Align = alLeft
          Caption = 'Excluir'
          ImageAlignment = iaTop
          ImageIndex = 2
          ImageMargins.Top = 10
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object pnlGrid: TPanel
        Left = 0
        Top = 75
        Width = 668
        Height = 285
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
        object pnlResume: TPanel
          Left = 0
          Top = 254
          Width = 668
          Height = 31
          Align = alBottom
          BevelOuter = bvNone
          Padding.Left = 10
          TabOrder = 0
          object lblRegistros: TLabel
            Left = 603
            Top = 0
            Width = 65
            Height = 31
            Align = alRight
            Caption = 'Registros'
            Layout = tlCenter
            ExplicitLeft = 633
            ExplicitHeight = 19
          end
        end
        object dbGridCadastro: TDBGrid
          Left = 0
          Top = 0
          Width = 668
          Height = 254
          Align = alClient
          DataSource = dsCadastro
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -16
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbGridCadastroDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 205
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documento'
              Title.Caption = 'Documento'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'email'
              Title.Caption = 'Email'
              Width = 195
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'telefone'
              Title.Caption = 'Telefone'
              Width = 119
              Visible = True
            end>
        end
      end
    end
  end
  object dsCadastro: TDataSource
    Left = 528
    Top = 323
  end
  object dsEnderecos: TDataSource
    Left = 608
    Top = 323
  end
end

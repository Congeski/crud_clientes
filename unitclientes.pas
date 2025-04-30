unit unitClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  Buttons, StdCtrls, DBGrids, unitDM, minhas_funcoes, LCLType;

type

  { TFormClientes }

  TFormClientes = class(TForm)
    btIncluir: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btCancelar: TBitBtn;
    btGravar: TBitBtn;
    btSair: TBitBtn;
    ComboBoxUF: TComboBox;
    DBGrid1: TDBGrid;
    EditNome: TEdit;
    EditCidade: TEdit;
    EditEndereco: TEdit;
    EditID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pagina1: TPageControl;
    Panel1: TPanel;
    TabArquivo: TTabSheet;
    TabDados: TTabSheet;
    procedure btCancelarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LimpaCampos;
    procedure HabilitarCampos(valor:Boolean);
    procedure Hab_botoes(Sender:TObject);
    procedure Desab_botoes(Sender:TObject);
    procedure TabArquivoShow(Sender: TObject);
  private

  public

  end;

var
  FormClientes: TFormClientes;
  situacao: integer; // situacao = 1 -> incluir
                     // situacao = 2 -> alterar

implementation

{$R *.lfm}

{ TFormClientes }

procedure TFormClientes.btSairClick(Sender: TObject);
begin
  FormClientes.Close;
end;

procedure TFormClientes.btIncluirClick(Sender: TObject);
begin
  TabArquivo.TabVisible:= false;
  TabDados.TabVisible:= true;
  pagina1.ActivePage:= (TabDados);
  situacao:= 1;
  LimpaCampos;
  HabilitarCampos(true);
  Desab_botoes(FormClientes);

  EditNome.SetFocus;
end;

procedure TFormClientes.btCancelarClick(Sender: TObject);
begin
  TabArquivo.TabVisible:= true;
  pagina1.ActivePage:= (TabArquivo);
  TabArquivo.SetFocus;
  Hab_botoes(FormClientes);
  HabilitarCampos(false);
end;

procedure TFormClientes.btGravarClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a Inclusão deste Cliente?',
  'Confirmação', Mb_YesNo + MB_ICONINFORMATION) = idyes then
  begin
    case situacao of
    1: // incluir novo registro
      begin
        incluir_cliente(DM.ZQueryAux, EditNome.Text, EditEndereco.Text,
                         EditCidade.Text, ComboBoxUF.Text);
      end;
    end; //case
  end; //if

  TabDados.TabVisible:= true;
  TabArquivo.TabVisible:= true;
  pagina1.ActivePage:= (TabArquivo);
  TabArquivo.SetFocus;
  Hab_botoes(FormClientes);
  HabilitarCampos(false);
  situacao:= -1;
end;

procedure TFormClientes.FormActivate(Sender: TObject);
begin
  Hab_botoes(FormClientes);
end;

procedure TFormClientes.FormCreate(Sender: TObject);
begin
  pagina1.ActivePage:=(TabArquivo);
end;

procedure TFormClientes.FormShow(Sender: TObject);
begin
  situacao:= -1;
  try
    exibir_clientes(DM.ZQueryClientes);
  except
    ShowMessage('Erro ao acessar o banco de dados!');
    Exit;
  end;
end;

procedure TFormClientes.LimpaCampos;
begin
  EditID.Caption:='';
  EditNome.Caption:='';
  EditEndereco.Caption:='';
  EditCidade.Caption:='';
  ComboBoxUF.ItemIndex:=0;
end;

procedure TFormClientes.HabilitarCampos(valor:Boolean);
begin
  EditNome.Enabled:= valor;
  EditEndereco.Enabled:= valor;
  EditCidade.Enabled:= valor;
  ComboBoxUF.Enabled:= valor;
end;

procedure TFormClientes.Hab_botoes(Sender:TObject);
begin
  btIncluir.Enabled:= true;
  btAlterar.Enabled:= true;
  btExcluir.Enabled:= true;
  btCancelar.Enabled:= false;
  btGravar.Enabled:= false;
  btSair.Enabled:= true;
end;

procedure TFormClientes.Desab_botoes(Sender:TObject);
begin
  btIncluir.Enabled:= false;
  btAlterar.Enabled:= false;
  btExcluir.Enabled:= false;
  btCancelar.Enabled:= true;
  btGravar.Enabled:= true;
  btSair.Enabled:= false;
end;

procedure TFormClientes.TabArquivoShow(Sender: TObject);
begin
  try
    exibir_clientes(DM.ZQueryClientes);
  except
    ShowMessage('Erro ao acessar o banco de dados!');
    Exit;
  end;
end;

end.


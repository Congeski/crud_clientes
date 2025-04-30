unit unitClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  Buttons, StdCtrls, DBGrids, unitDM, minhas_funcoes;

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
    procedure btSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LimpaCampos;
    procedure HabilitarCampos(valor:Boolean);
    procedure Hab_botoes(Sender:TObject);
    procedure Desab_botoes(Sender:TObject);
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

end.


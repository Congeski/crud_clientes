unit unitClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  Buttons;

type

  { TFormClientes }

  TFormClientes = class(TForm)
    btIncluir: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btCancelar: TBitBtn;
    btGravar: TBitBtn;
    btSair: TBitBtn;
    pagina1: TPageControl;
    Panel1: TPanel;
    TabArquivo: TTabSheet;
    TabDados: TTabSheet;
    procedure btSairClick(Sender: TObject);
  private

  public

  end;

var
  FormClientes: TFormClientes;

implementation

{$R *.lfm}

{ TFormClientes }

procedure TFormClientes.btSairClick(Sender: TObject);
begin
  FormClientes.Close;
end;

end.


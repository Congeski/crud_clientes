unit unitPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, unitClientes;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    btCliente: TBitBtn;
    Panel1: TPanel;
    procedure btClienteClick(Sender: TObject);
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.btClienteClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFormClientes, FormClientes);
    FormClientes.ShowModal;
  finally
    FormClientes.Free;
  end;

end;

end.


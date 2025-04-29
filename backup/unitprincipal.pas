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
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

end.


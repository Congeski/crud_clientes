unit unitDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DataSourceClientes: TDataSource;
    ZConnection1: TZConnection;
    ZQueryClientes: TZQuery;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.


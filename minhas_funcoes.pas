unit minhas_funcoes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, sqldb, ZDataset;

procedure exibir_clientes(Query:TzQuery);
procedure incluir_cliente(Query:TzQuery;Nome:String;Endereco:String;
                          Cid:String;UF:String);
procedure alterar_cliente(Query:TzQuery;Nome:String;Endereco:String;
                          Cid:String;UF:String; ID:integer);

implementation

procedure exibir_clientes(Query:TzQuery);
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add(' SELECT * FROM CLIENTE');
  Query.ExecSQL;
  Query.Open;
end;

procedure incluir_cliente(Query:TzQuery;Nome:String;Endereco:String;
                          Cid:String;UF:String);
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add(' INSERT INTO CLIENTE(ID,NOME,ENDERECO,CIDADE,ESTADO)');
  Query.SQL.Add('VALUES (gen_id(id_cliente,1),:NOME,:ENDERECO,:CIDADE,:ESTADO)');

  Query.Params[0].AsString:= Nome;
  Query.Params[1].AsString:= Endereco;
  Query.Params[2].AsString:= Cid;
  Query.Params[3].AsString:= UF;

  Query.ExecSQL;
end;

procedure alterar_cliente(Query:TzQuery;Nome:String;Endereco:String;
                          Cid:String;UF:String; ID:integer);
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('UPDATE CLIENTE SET NOME=:NOME,ENDERECO=:ENDERECO,CIDADE=:CIDADE, ');
  Query.SQL.Add('ESTADO=:ESTADO');
  Query.SQL.Add('WHERE ID=:ID');

  Query.Params[0].AsString:= Nome;
  Query.Params[1].AsString:= Endereco;
  Query.Params[2].AsString:= Cid;
  Query.Params[3].AsString:= UF;
  Query.Params[4].AsInteger:= ID;

  Query.ExecSQL;
end;

end.


unit uEmpresaCorrente;

interface

uses
   SysUtils, SqlExpr, uDM_Conexao;

type
  TEmpresaCorrente = Class
  private
    FId             : Integer;
    FRSocial        : String;
  public
    procedure CarregarEmpresaCorrente;

    property Id             : Integer  read FId              write FId;
    property RSocial        : String   read FRSocial         write FRSocial;
  end;

var
  EmpresaCorrente: TEmpresaCorrente;

implementation

{ TEmpresaCorrente }

procedure TEmpresaCorrente.CarregarEmpresaCorrente;
var
  VQry: TSQLQuery;
  VSql: String;
begin
  VQry := TSQLQuery.Create(nil);
  try
    VQry.SQLConnection := dm_Conexao.Conn;

    VSql :=
      'select ' +
      '  id, ' +
      '  rsocial ' +
      'from empresa ' +
      'where ' +
      '  (id = %d)' ;

    VSql := Format(VSql, [Self.FId]);

    VQry.Close;
    VQry.CommandText := VSql;
    VQry.Open;
    try
      if VQry.RecordCount = 0 then
        raise Exception.Create('Empresa não encotrada.');

      Self.FId      := VQry.Fields[0].AsInteger;
      Self.FRSocial := VQry.Fields[1].AsString;
    finally
      VQry.Close;
    end;
  finally
    FreeAndNil(VQry);
  end;
end;

end.

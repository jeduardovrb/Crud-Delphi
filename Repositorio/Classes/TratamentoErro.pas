unit TratamentoErro;

interface

uses
  DBClient, SysUtils;

type
  TTratamentoErro = class
  private
    class var FMensagemErroApplyUpdate: String;
  public
    class procedure HandleReconcileError(MensagemErro: String;
      var Acao: TReconcileAction);
    class function Execute(MensagemErro: String): String;
    class function GetMensagemErroApplyUpdate: String;
  end;

var
  TratarErro: TTratamentoErro;

implementation

{ TTratamentoErro }

class procedure TTratamentoErro.HandleReconcileError(MensagemErro: String;
  var Acao: TReconcileAction);
var
  PosicaoInicial: Integer;
  PosicaoFinal: Integer;
begin
  // Ação que o ClientDataSet irá executar.
  Acao := raAbort;

  // Mensagem de erro original.
  FMensagemErroApplyUpdate := MensagemErro;

  // Primary Key
  if Pos('PRIMARY OR UNIQUE KEY', UpperCase(MensagemErro)) > 0 then
  begin
    PosicaoInicial := Pos('PK_', UpperCase(MensagemErro));

    if (PosicaoInicial = 0) then
    begin
      PosicaoInicial := Pos('UNQ_', UpperCase(MensagemErro));
    end;

    PosicaoFinal := Pos('ON TABLE', UpperCase(MensagemErro)) - 2;

    FMensagemErroApplyUpdate := 'Violação de chave primária. ' +
      Copy(MensagemErro, PosicaoInicial, (PosicaoFinal - PosicaoInicial));
  end

  // Foreing Key
  else if Pos('FOREIGN KEY', UpperCase(MensagemErro)) > 0 then
  begin
    PosicaoInicial := Pos('FK_', UpperCase(MensagemErro));
    PosicaoFinal := Pos('ON TABLE', UpperCase(MensagemErro)) - 2;

    FMensagemErroApplyUpdate := 'Violação de chave estrangeira. ' +
      Copy(MensagemErro, PosicaoInicial, (PosicaoFinal - PosicaoInicial));
  end;
end;

class function TTratamentoErro.Execute(MensagemErro: String): String;
var
  VAction: TReconcileAction;
begin
  Self.HandleReconcileError(MensagemErro, VAction);
  Result := Self.GetMensagemErroApplyUpdate();
end;

class function TTratamentoErro.GetMensagemErroApplyUpdate: String;
begin
  Result := Self.FMensagemErroApplyUpdate;
end;

end.

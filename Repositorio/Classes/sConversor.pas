unit sConversor;

interface

uses sEnumerados;

type
  TConversor = Class
    class function SomenteNumeroStr(Text: String): String;
    class function ParaString(ATipo: TTipoPessoa): String; overload;
    class function ParaString(ATpProduto: TTipoProduto): String; overload;
    class function ParaTipoProduto(ATpProduto: String): TTipoProduto;
  end;

implementation

{ TFuncoes_v3 }

class function TConversor.ParaString(ATpProduto: TTipoProduto): String;
begin
  case ATpProduto of
    tproIndefinido: Result := '';
    tproProduto   : Result := 'P';
    tproLente     : Result := 'L';
  end;
end;

class function TConversor.ParaTipoProduto(ATpProduto: String): TTipoProduto;
begin
  if ATpProduto = 'P' then
    Result := sEnumerados.tproProduto
  else if ATpProduto = 'L' then
    Result := sEnumerados.tproLente;
end;

class function TConversor.SomenteNumeroStr(Text: String): String;
begin

end;

class function TConversor.ParaString(ATipo: TTipoPessoa): String;
begin
  case ATipo of
    sEnumerados.tpFisico:
      Result := 'F';
    sEnumerados.tpJuridico:
      Result := 'J';
  end;
end;

end.

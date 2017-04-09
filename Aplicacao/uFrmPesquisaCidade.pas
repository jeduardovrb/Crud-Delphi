unit uFrmPesquisaCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPesquisar, Data.FMTBcd, Datasnap.Provider, Data.SqlExpr, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisarCidade = class(TfrmPesquisar)
    DBGrid1: TDBGrid;
    dst_LocalizarID: TIntegerField;
    dst_LocalizarNOME: TStringField;
    cds_LocalizarID: TIntegerField;
    cds_LocalizarNOME: TStringField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisarCidade: TfrmPesquisarCidade;

implementation

{$R *.dfm}

procedure TfrmPesquisarCidade.FormShow(Sender: TObject);
begin
  inherited;

  cbxField.ItemIndex := 0;
end;

end.

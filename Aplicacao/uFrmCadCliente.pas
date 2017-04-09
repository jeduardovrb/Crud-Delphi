unit uFrmCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form_Modelo, Data.FMTBcd, System.ImageList, Vcl.ImgList, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, uDM_Conexao, uDM_Cliente, Vcl.Mask, Vcl.DBCtrls, sFuncoes,
  uDM_Cidade;

type
  TfrmCadCliente = class(TfrmForm_Modelo)
    DBGrid1: TDBGrid;
    dst_LocalizarCODIGO: TIntegerField;
    dst_LocalizarRSOCIAL: TStringField;
    dst_LocalizarCIDADE: TIntegerField;
    dst_LocalizarNOME: TStringField;
    cds_LocalizarCODIGO: TIntegerField;
    cds_LocalizarRSOCIAL: TStringField;
    cds_LocalizarCIDADE: TIntegerField;
    cds_LocalizarNOME: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure CamposDefault; override;
    procedure ValidarRegraNegocio; override;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

procedure TfrmCadCliente.CamposDefault;
begin
  inherited;
  ShowMessage('carregar campos');
end;

procedure TfrmCadCliente.DBEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  VDM_Cidade: Tdm_cidade;
  VCodigo: Integer;
begin
  inherited;
  VDM_Cidade := Tdm_cidade.Create(Self);
  try
    if Key = VK_F2 then
    begin
      VCodigo := VDM_Cidade.Pesquisar();

      if VCodigo > 0 then
        dts.DataSet.FieldByName('cidade').AsInteger := VCodigo;
    end;
  finally
    FreeAndNIl(VDM_Cidade);
  end;

end;

procedure TfrmCadCliente.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  TFuncoes.ColorirGrid(Sender, Rect, DataCol, Column, State, $00FFE6E6);
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(dm_Cliente);
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  dm_Cliente := Tdm_Cliente.Create(Self);

  inherited;

end;

procedure TfrmCadCliente.ValidarRegraNegocio;
begin
ShowMessage('regra negocio');
end;

end.

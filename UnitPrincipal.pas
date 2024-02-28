unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, uFormat,
  REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Layout1: TLayout;
    Layout5: TLayout;
    Rectangle3: TRectangle;
    Image5: TImage;
    rectBusca: TRectangle;
    Label1: TLabel;
    edtCEP: TEdit;
    lblEndereco: TLabel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemTable: TFDMemTable;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    MemTable2: TFDMemTable;
    procedure edtCEPTyping(Sender: TObject);
    procedure rectBuscaClick(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
  private
    procedure ConsultarCEP(cep: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.edtCEPExit(Sender: TObject);
begin
     ConsultarCEP(edtCEP.Text);
end;

procedure TForm1.edtCEPTyping(Sender: TObject);
begin
  Formatar(edtCEP, TFormato.CEP);
end;

procedure TForm1.ConsultarCEP(cep: String);

begin
    if SomenteNumero(edtCEP.Text).Length <> 8	 then

    begin
      showMessage ('CEP Inválido');
      exit;
    end;

    RESTrequest1.Resource := SomenteNumero(edtCEP.Text)  + '/json';
    RESTrequest1.Execute;

    if RESTrequest1.Response.StatusCode	= 200	 then
    begin
      if RESTrequest1.Response.Content.IndexOf('erro') > 0 then
        showMessage ('CEP Não encontrado')

        else
        begin
          with MemTable do
          begin
            lblEndereco.Text := 'CEP: ' + FieldByName('cep').AsString + sLineBreak +
                                'Endereço: ' + FieldByName('logradouro').AsString + sLineBreak +
                                'Complemento: ' + FieldByName('complemento').AsString + sLineBreak +
                                'Bairro: ' + FieldByName('bairro').AsString + sLineBreak +
                                'Cidade: ' + FieldByName('localidade').AsString + sLineBreak +
                                'UF: ' + FieldByName('uf').AsString + sLineBreak +
                                'Cód. IBGE: ' + FieldByName('ibge').AsString + sLineBreak +
                                'DDD: ' + FieldByName('ddd').AsString + sLineBreak;

          end;

        end;
    end
    else     // se o primeiro ficar offline vai chamar o segundo
    begin

    RESTrequest2.Resource := '/json' + SomenteNumero(edtCEP.Text);
    RESTrequest2.Execute;

    if RESTrequest2.Response.StatusCode	= 200	 then
    begin
      if RESTrequest2.Response.Content.IndexOf('erro') > 0 then
        showMessage ('CEP Não encontrado')

        else
        begin
          with MemTable2 do
          begin
            lblEndereco.Text := 'CEP: ' + FieldByName('cep').AsString + sLineBreak +
                                'Endereço: ' + FieldByName('address').AsString + sLineBreak +
                                'Bairro: ' + FieldByName('district').AsString + sLineBreak +
                                'Cidade: ' + FieldByName('city').AsString + sLineBreak +
                                'UF: ' + FieldByName('state').AsString + sLineBreak +
                                'Cód. IBGE: ' + FieldByName('city_ibge').AsString + sLineBreak +
                                'DDD: ' + FieldByName('ddd').AsString + sLineBreak;

          end;

        end;

     end
     else
     showMessage ('Erro ao consultar o CEP')

    end;
end;

procedure TForm1.rectBuscaClick(Sender: TObject);
begin
  ConsultarCEP(edtCEP.Text);
end;

end.

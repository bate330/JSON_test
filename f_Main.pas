unit f_Main;

interface

uses
  c_Reader, c_Saver, System.JSON, System.JSON.Types, System.JSON.Readers, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXJSON, System.IOUtils, uCustomTypes;

type
  TMainForm = class(TForm)
    Saver: TSaver;
    Reader: TReaderC;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Memo2: TMemo;
    Memo3: TMemo;
    SourceEdit: TEdit;
    Label1: TLabel;
    procedure Log(s: string);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  end;
var
  MainForm: TMainForm;

implementation

uses JSON.Writers, JSON.Builders, REST.JSON, JsonUtils;

{$R *.dfm}

//==============================================================================
procedure TMainForm.FormCreate(Sender: TObject);
begin
  Saver := TSaver.Create;
  Reader := TReaderC.Create;
  Memo3.Lines[0] := '1 - Fruit Name..';
  Memo3.Lines[1] := '2 - Fruit Size..';
  Memo3.Lines[2] := '3 - Fruit Color..';
end;

//==============================================================================
procedure TMainForm.Button1Click(Sender: TObject);
var
Stock: TStock;
begin
   Stock:= TStock.Create;
   Stock.fruit := Memo3.Lines[0];
   Stock.size := Memo3.Lines[1];
   Stock.color := Memo3.Lines[2];
   Saver.Save(Stock);
end;

//==============================================================================
procedure TMainForm.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Text := Reader.Read;
end;

//==============================================================================
procedure TMainForm.Button3Click(Sender: TObject);
var jtr: TJsonTextReader; sr: TStringReader; stocks: TStocks; Stock: TStock;
begin
  Memo2.Lines.Clear;
  Reader.Translator;
end;

//==============================================================================
procedure TMainForm.Log(s: string);
begin
  Memo2.Lines.Add(s);
end;


end.

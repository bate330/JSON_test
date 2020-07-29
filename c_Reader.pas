unit c_Reader;

interface uses System.SysUtils, System.Variants, System.Classes, System.JSON, System.JSON.Types, System.JSON.Readers, Data.DBXJSON, System.IOUtils, uCustomTypes;

type
  TReaderC = Class
    private
      procedure DisplayStocks(stocks: TStocks; Stock: TStock);
      function ProcessStockRead(stocks: TStocks; jtr: TJsonTextReader): TStock;
    protected

    public
      function GetJsonText: string;
      function Read: string;
      procedure Translator;
  End;

implementation

uses  JSON.Writers, JSON.Builders, REST.JSON, JsonUtils, f_Main;

//==============================================================================
function TReaderC.Read: string;
var
JSonRead: TStringList;
begin
  JSonRead := TStringList.Create;
  JSonRead.LoadFromFile(MainForm.SourceEdit.Text);
  Result := JSonRead.Text;
end;

//==============================================================================
procedure TReaderC.DisplayStocks(stocks: TStocks; Stock: TStock);
var i: integer;
begin

  MainForm.Log(DateTimeToStr(Now));
  if stocks <> nil then
  begin
    MainForm.Log('Stocks count = ' + stocks.Count.ToString);
    MainForm.Log('==================');

    for i := 0 to stocks.Count-1 do
    begin
      MainForm.Log('Fruit: ' + stock.fruit);
      MainForm.Log('Size: ' + stock.size);
      MainForm.Log('Color: ' + stock.color);
      MainForm.Log('==================');
    end;
  end
  else
    MainForm.Log('No stocks found.');
end;

//==============================================================================
function TReaderC.ProcessStockRead(stocks: TStocks; jtr: TJsonTextReader): TStock;
var stock: TStock;
begin
  stock := TStock.Create;

  while jtr.Read do
  begin
    if jtr.TokenType = TJsonToken.PropertyName then
    begin
      if jtr.Value.ToString = 'fruit' then
      begin
        jtr.Read;
        stock.fruit := jtr.Value.AsString;
      end

      else if jtr.Value.ToString = 'size' then
      begin
        jtr.Read;
        stock.size := jtr.Value.AsString;
      end

      else if jtr.Value.ToString = 'color' then
      begin
        jtr.Read;
        stock.color := jtr.Value.AsString;
      end
    end

    else if jtr.TokenType = TJsonToken.EndObject then
    begin
      stocks.add(stock);
    end;
  end;
  Result := stock;
end;

//==============================================================================
procedure TReaderC.Translator;
var jtr: TJsonTextReader; sr: TStringReader; stocks: TStocks; Stock: TStock;
begin
  stocks := TStocks.Create;
  try
    sr := TStringReader.Create(GetJsonText);
    try
      jtr := TJsonTextReader.Create(sr);
      try
        Stock := ProcessStockRead(stocks, jtr);
      finally
        jtr.Free;
      end;
    finally
      sr.Free;
    end;
    DisplayStocks(stocks, Stock);
  finally
    stocks.Free;
  end;
end;

//==============================================================================
function TReaderC.GetJsonText: string;
var s: string;
begin
  for s in Read do      //Memo1.Lines
    Result := Result + s;
end;
end.

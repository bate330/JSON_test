unit c_Saver;

interface  uses System.SysUtils, System.Variants, System.Classes, System.JSON, System.JSON.Types, System.JSON.Readers, Data.DBXJSON, System.IOUtils, uCustomTypes;

type
  TSaver = Class
    private

    protected

    public
      function Save(Stock: TStock): string;
  End;

implementation

uses  JSON.Writers, JSON.Builders, REST.JSON, JsonUtils, f_Main;

//==============================================================================
function TSaver.Save(Stock: TStock): string;
var
JSonFile: TStringlist;
begin
  JSonFile:= TStringlist.Create;
try
  JsonFile.Add(TJson.ObjectToJsonString(Stock));
  JSonFile.SaveToFile(MainForm.SourceEdit.Text);
finally
  Stock.Free;
end;

end;


end.

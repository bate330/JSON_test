unit uCustomTypes;

interface

uses
  System.Generics.Collections;

type
  TStock = class
  private
    FFruit: string;
    FSize: string;
    FColor: string;
    procedure SetFruit(const Value: string);
    procedure SetSize(const Value: string);
    procedure SetColor(const Value: string);
  public
    property fruit: string read FFruit write SetFruit;
    property size: string read FSize write SetSize;
    property color: string read FColor write SetColor;
  end;

  TStocks = TObjectList<TStock>;

implementation

{ TStock }

procedure TStock.SetFruit(const Value: string);
begin
  FFruit := Value;
end;

procedure TStock.SetSize(const Value: string);
begin
  FSize := Value;
end;

procedure TStock.SetColor(const Value: string);
begin
  FColor := Value;
end;

end.

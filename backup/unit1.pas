unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids,
  ZConnection, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    try
      ZConnection1.Connect;
      ZTable1.Open;
    finally
      ShowMessage('Bağlantı kuruldu.');
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Bağlantı yapılırken hata oluştu' + sLineBreak +
        E.Message);
      Halt;
    end;
  end;

end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  ZConnection1.Disconnect;
end;

end.

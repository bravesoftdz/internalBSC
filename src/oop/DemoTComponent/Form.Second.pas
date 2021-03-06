﻿{ * ------------------------------------------------------------------------
  * ♥  Bogdan Polak © 2019  ♥
  *  ----------------------------------------------------------------------- * }
unit Form.Second;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Base.Receiver;

type
  TForm2 = class(TForm)
    btnCreateTBarClass: TButton;
    GroupBox1: TGroupBox;
    btnTBarOwnerSelf: TButton; 
    btnTBarOwnerReceiver: TButton;
    procedure btnCreateTBarClassClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTBarOwnerSelfClick(Sender: TObject);
    procedure btnTBarOwnerReceiverClick(Sender: TObject);
  private
    FReceiver: TReceiver;
  public
    property Receiver: TReceiver read FReceiver write FReceiver;
  end;


implementation

{$R *.dfm}

uses
  Base.Bar,
  Base.Foo;

procedure TForm2.btnCreateTBarClassClick(Sender: TObject);
var
  bar: TBar;
begin
  Self.Tag := Self.Tag +1;
  bar := TBar.Create(Application);
  bar.Name := 'Bar'+Self.Tag.ToString;
  bar.Info := 'time='+TimeToStr(Now);
  bar.Free;
end;

procedure TForm2.btnTBarOwnerReceiverClick(Sender: TObject);
begin
  if FReceiver<>nil then
    TBar.Create(FReceiver).Free;
end;

procedure TForm2.btnTBarOwnerSelfClick(Sender: TObject);
begin
  TBar.Create(Self).Free;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

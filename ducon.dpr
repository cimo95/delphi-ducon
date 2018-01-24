program ducon;

uses
  Forms,
  uutama in 'uutama.pas' {futama};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DUCon - Dynamic Unit Converter';
  Application.CreateForm(Tfutama, futama);
  Application.Run;
end.

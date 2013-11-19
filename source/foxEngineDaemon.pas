(* foxEngineDaemon.pas

This program is free software.
You are hereby licensed to copy, modify, share,
recreate, transmit, remix, record, or whatever.
The full license terms may be found in LICENSE.md.

This was written by Alex J. Maurin, AKA "coyo."
The author can be contacted on skype or steam
with the username "coyotama."
He can also be contacted by email or xmpp with
coyo@darkdna.net .

Thank you, and I hope this is useful to you.

*)

program foxEngineDaemon;
(* i have no idea what this does... *)
{$mode objfpc}{$H+}

uses
  (* delicious cThreads, you must nom them *)
  {$IFDEF UNIX}
    {$IFDEF UseCThreads}
      cthreads,
    {$ENDIF}
  {$ENDIF}
  classes,
  sysUtils,
  custApp,
  crt,
  //blkSock;

(* using gotos because I am evil *)
(* rawr *)

(* doesn't seem to work

label doItNao;
label gtfo;

*)
var
  foxEngineDaemon: foxEngineDaemon
type
  (* class definition *)
  foxEngineDaemon = class(tCustomApplication)
  protected
    (* where doRun plays *)
    procedure doRun; override;
  public
    constructor create(theOwner: tComponent); override;
    destructor destroy; override;
    procedure writeHelp; virtual;
    procedure main; virtual;
  end;
end;

(* delicious boilerplate which you must nom *)

procedure foxEngineDaemon.doRun;
var
  errorMsg: string;
  doItNow: integer;
  fullOfFail: integer;
  gtfo: integer;

begin
  (* initialize variables, just to be safe *)
  errorMSG:='';
  doItNow:=1;
  fullOfFail:=0;
  gtfo:=0;

  (* quick check parameters *)
  errorMsg:=checkOptions('h','help','t','test','hello');
  if errorMsg<>'' then begin
    fullOfFail:=1;
    showException(exception.create(errorMsg));
    terminate;
    exit;
  end;

  (* parse parameters *)
  (* check if the help switch is called *)
  if hasOption('h','help') then begin
    help;
    terminate;
    exit;
  end;

  (* check if the testing switch is called *)
  if hasOption('t','test') then begin
    helloWorld;
    terminate;
    exit;
  end;

  (* doing actual shit here *)
  if not fullOfFail then begin
    (* delicious do-until loop is delicious *)
    do
      (* some shit *)
      main;
    until gtfo;
    terminate;
    exit;
  end;
end;
(* end of doRun *)

  (* HelloWorld procedure to test compilation *)
  (* Tests are always a good thing, I hear *)
  procedure foxEngineDaemon.main;
  var
    (* create some basic variables for the main procedure *)
    yoDawg: String;
  begin
    yoDawg:='I herd u liek variables';
    (* i'm super serial, we'll actually do something here *)
    case doItNow of
    0: begin
      println('What a digital dummy.');
      end
    1: begin
      println('Your mother was a hampster');
      println('And your father smelt of elderberries.');
      end;
    end;
  end;

  (* stop program loop *)
  terminate;
  exit;
end;

(* constructor and destructor procedures *)
constructor foxEngineDaemon.create(theOwner: tComponent);
begin
  inherited create(theOwner);
  stopOnException:=true;
end;

destructor foxEngineDaemon.destroy;
begin
  inherited destroy;
end;

procedure foxEngineDaemon.help;
begin
  (* help logic *)
  writeln('Usage: ', exeName);
  writeln;
  writeln('-h for this most helpful help ever.');
  writeln;
  writeln('A great emptiness');
  writeln('Within the logic and code');
  writeln('Passes by unseen');
  writeln;
  writeln('Bear with me, this code is not bleeding edge ');
  writeln('it is a primordial soup of logic and code.');
  writeln('Thank you for your patience and understanding.');
end;

var
  application: foxEngineDaemon;

(* no idea what this does, if anything *)
{$R *.res}

begin
  application:=foxEngineDaemon.create(nil);
  application.title:='Fox Engine Daemon';
  application.run;
  application.free;
end.

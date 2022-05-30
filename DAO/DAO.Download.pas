unit DAO.Download;

interface

Uses
  Model.Download, System.Generics.Collections;

type
  TContato = class
    function insert (Download: TDownload): Boolean;
    function Update (Download: TDownload): Boolean;
    function Delete (Download: TDownload): Boolean;
    function GetById (OID: Integer): TDownload;
    function GetALL : TList<TDownload>;
  end;

implementation

{ TContato }

function TContato.Delete(Download: TDownload): Boolean;
begin

end;

function TContato.GetALL: TList<TDownload>;
begin

end;

function TContato.GetById(OID: Integer): TDownload;
begin

end;

function TContato.insert(Download: TDownload): Boolean;
begin

end;

function TContato.Update(Download: TDownload): Boolean;
begin

end;

end.

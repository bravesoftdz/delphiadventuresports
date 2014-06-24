unit Activity;

interface

Type
  TActivity = Class
  private
    _ActivityID: Integer;
    _Label: String;
    _Description: String;

  public
    property activityID: Integer read _ActivityID write _ActivityID;
    property labelActivity: String read _Label write _Label;
    property description: string read _Description write _Description;
    constructor Create(activityID: Integer; labelActivity: string;
      description: string);
    destructor Destroy; override;

  End;

implementation

constructor TActivity.Create(activityID: Integer; labelActivity: string;
  description: string);
begin
  _ActivityID := activityID;
  _Label := labelActivity;
  _Description := description;
end;

destructor TActivity.Destroy;
begin
  inherited;

end;

end.

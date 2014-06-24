unit SportsTraining;

interface

Type
  TSportsTraining = Class
  private
    _SportsTrainingID: Integer;
    _ActivityID: Integer;
    _Label: String;
    _Description: String;
    _StartDate: TDateTime;
    _RegistrationDeadLine: TDateTime;
    _Duration: Integer;
    _RegistrationMax: Integer;
    _Level: Integer;
    _Price: Double;
    _MinAge: Integer;
    _RegistrationCount: Integer;

  public
    numberOfField: Integer;
    property sportsTrainingID: Integer read _SportsTrainingID
      write _SportsTrainingID;
    property activityID: Integer read _ActivityID write _ActivityID;
    property labelSportsTraining: String read _Label write _Label;
    property description: string read _Description write _Description;
    property starDate: TDateTime read _StartDate write _StartDate;
    property registrationDeadLine: TDateTime read _RegistrationDeadLine
      write _RegistrationDeadLine;
    property duration: Integer read _Duration write _Duration;
    property registrationMax: Integer read _RegistrationMax
      write _RegistrationMax;
    property level: Integer read _Level write _Level;
    property price: Double read _Price write _Price;
    property minAge: Integer read _MinAge write _MinAge;
    property registrationCount: Integer read _RegistrationCount
      write _RegistrationCount;
    constructor Create(sportsTrainingID: Integer; activityID: Integer;
      labelSportsTraining: String; description: string; starDate: TDateTime;
      registrationDeadLine: TDateTime; duration: Integer;
      registrationMax: Integer; level: Integer; price: Double; minAge: Integer;
      registrationCount: Integer);
    destructor Destroy; override;

  End;

implementation

constructor TSportsTraining.Create(sportsTrainingID: Integer;
  activityID: Integer; labelSportsTraining: String; description: string;
  starDate: TDateTime; registrationDeadLine: TDateTime; duration: Integer;
  registrationMax: Integer; level: Integer; price: Double; minAge: Integer;
  registrationCount: Integer);
begin
  _SportsTrainingID := sportsTrainingID;
  _ActivityID := activityID;
  _Label := labelSportsTraining;
  _Description := description;
  _StartDate := starDate;
  _RegistrationDeadLine := registrationDeadLine;
  _Duration := duration;
  _RegistrationMax := registrationMax;
  _Level := level;
  _Price := price;
  _MinAge := minAge;
  _RegistrationCount := registrationCount;
  numberOfField := 12;
end;

destructor TSportsTraining.Destroy;
begin
  inherited;
end;

end.

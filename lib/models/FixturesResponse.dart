class FixturesResponse {
  List<Data>? data;
  Pagination? pagination;

  FixturesResponse({this.data, this.pagination});

  FixturesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Null? idCountry;
  Null? countryName;
  int? idLeague;
  String? leagueName;
  int? idSeason;
  String? seasonName;
  int? idHome;
  String? homeName;
  int? idAway;
  String? awayName;
  Null? idStage;
  Null? idVenue;
  Null? venueName;
  String? date;
  String? status;
  Null? round;
  Null? attendance;
  int? teamHome90minGoals;
  int? teamAway90minGoals;
  int? teamHomeETGoals;
  int? teamAwayETGoals;
  int? teamHomePENGoals;
  int? teamAwayPENGoals;
  int? teamHome1stHalfGoals;
  int? teamAway1stHalfGoals;
  int? teamHome2ndHalfGoals;
  int? teamAway2ndHalfGoals;
  Null? elapsed;
  Null? elapsedPlus;
  Null? eventsHash;
  Null? lineupsHash;
  Null? statsHash;
  Null? referees;

  Data(
      {this.id,
        this.idCountry,
        this.countryName,
        this.idLeague,
        this.leagueName,
        this.idSeason,
        this.seasonName,
        this.idHome,
        this.homeName,
        this.idAway,
        this.awayName,
        this.idStage,
        this.idVenue,
        this.venueName,
        this.date,
        this.status,
        this.round,
        this.attendance,
        this.teamHome90minGoals,
        this.teamAway90minGoals,
        this.teamHomeETGoals,
        this.teamAwayETGoals,
        this.teamHomePENGoals,
        this.teamAwayPENGoals,
        this.teamHome1stHalfGoals,
        this.teamAway1stHalfGoals,
        this.teamHome2ndHalfGoals,
        this.teamAway2ndHalfGoals,
        this.elapsed,
        this.elapsedPlus,
        this.eventsHash,
        this.lineupsHash,
        this.statsHash,
        this.referees});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCountry = json['idCountry'];
    countryName = json['countryName'];
    idLeague = json['idLeague'];
    leagueName = json['leagueName'];
    idSeason = json['idSeason'];
    seasonName = json['seasonName'];
    idHome = json['idHome'];
    homeName = json['homeName'];
    idAway = json['idAway'];
    awayName = json['awayName'];
    idStage = json['idStage'];
    idVenue = json['idVenue'];
    venueName = json['venueName'];
    date = json['date'];
    status = json['status'];
    round = json['round'];
    attendance = json['attendance'];
    teamHome90minGoals = json['team_home_90min_goals'];
    teamAway90minGoals = json['team_away_90min_goals'];
    teamHomeETGoals = json['team_home_ET_goals'];
    teamAwayETGoals = json['team_away_ET_goals'];
    teamHomePENGoals = json['team_home_PEN_goals'];
    teamAwayPENGoals = json['team_away_PEN_goals'];
    teamHome1stHalfGoals = json['team_home_1stHalf_goals'];
    teamAway1stHalfGoals = json['team_away_1stHalf_goals'];
    teamHome2ndHalfGoals = json['team_home_2ndHalf_goals'];
    teamAway2ndHalfGoals = json['team_away_2ndHalf_goals'];
    elapsed = json['elapsed'];
    elapsedPlus = json['elapsedPlus'];
    eventsHash = json['eventsHash'];
    lineupsHash = json['lineupsHash'];
    statsHash = json['statsHash'];
    referees = json['referees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idCountry'] = this.idCountry;
    data['countryName'] = this.countryName;
    data['idLeague'] = this.idLeague;
    data['leagueName'] = this.leagueName;
    data['idSeason'] = this.idSeason;
    data['seasonName'] = this.seasonName;
    data['idHome'] = this.idHome;
    data['homeName'] = this.homeName;
    data['idAway'] = this.idAway;
    data['awayName'] = this.awayName;
    data['idStage'] = this.idStage;
    data['idVenue'] = this.idVenue;
    data['venueName'] = this.venueName;
    data['date'] = this.date;
    data['status'] = this.status;
    data['round'] = this.round;
    data['attendance'] = this.attendance;
    data['team_home_90min_goals'] = this.teamHome90minGoals;
    data['team_away_90min_goals'] = this.teamAway90minGoals;
    data['team_home_ET_goals'] = this.teamHomeETGoals;
    data['team_away_ET_goals'] = this.teamAwayETGoals;
    data['team_home_PEN_goals'] = this.teamHomePENGoals;
    data['team_away_PEN_goals'] = this.teamAwayPENGoals;
    data['team_home_1stHalf_goals'] = this.teamHome1stHalfGoals;
    data['team_away_1stHalf_goals'] = this.teamAway1stHalfGoals;
    data['team_home_2ndHalf_goals'] = this.teamHome2ndHalfGoals;
    data['team_away_2ndHalf_goals'] = this.teamAway2ndHalfGoals;
    data['elapsed'] = this.elapsed;
    data['elapsedPlus'] = this.elapsedPlus;
    data['eventsHash'] = this.eventsHash;
    data['lineupsHash'] = this.lineupsHash;
    data['statsHash'] = this.statsHash;
    data['referees'] = this.referees;
    return data;
  }
}

class Pagination {
  int? page;
  int? itemsPerPage;
  bool? hasNextPage;
  bool? hasPrevPage;

  Pagination(
      {this.page, this.itemsPerPage, this.hasNextPage, this.hasPrevPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    itemsPerPage = json['itemsPerPage'];
    hasNextPage = json['hasNextPage'];
    hasPrevPage = json['hasPrevPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['itemsPerPage'] = this.itemsPerPage;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPrevPage'] = this.hasPrevPage;
    return data;
  }
}

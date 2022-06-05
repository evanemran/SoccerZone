class SeasonsResponse {
  List<Data>? data;
  Pagination? pagination;

  SeasonsResponse({this.data, this.pagination});

  SeasonsResponse.fromJson(Map<String, dynamic> json) {
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
  int? idLeague;
  String? leagueName;
  int? start;
  int? end;

  Data({this.id, this.idLeague, this.leagueName, this.start, this.end});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLeague = json['idLeague'];
    leagueName = json['leagueName'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idLeague'] = this.idLeague;
    data['leagueName'] = this.leagueName;
    data['start'] = this.start;
    data['end'] = this.end;
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

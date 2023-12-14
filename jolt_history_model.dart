class JoltHistory {
  Success? success;
  Null? error;

  JoltHistory({this.success, this.error});

  JoltHistory.fromJson(Map<String, dynamic> json) {
    success =
        json['success'] != null ?  Success.fromJson(json['success']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (success != null) {
      data['success'] = success!.toJson();
    }
    data['error'] = error;
    return data;
  }
}

class Success {
  int? code;
  List<Data>? data;
  String? message;

  Success({this.code, this.data, this.message});

  Success.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? object;
  String? id;
  String? from;
  String? to;
  String? toUser;
  String? message;
  String? createdAt;
  String? status;

  Data(
      {this.object,
      this.id,
      this.from,
      this.to,
      this.toUser,
      this.message,
      this.createdAt,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
    from = json['from'];
    to = json['to'];
    toUser = json['toUser'];
    message = json['message'];
    createdAt = json['createdAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['object'] = object;
    data['id'] = id;
    data['from'] = from;
    data['to'] = to;
    data['toUser'] = toUser;
    data['message'] = message;
    data['createdAt'] = createdAt;
    data['status'] = status;
    return data;
  }
}
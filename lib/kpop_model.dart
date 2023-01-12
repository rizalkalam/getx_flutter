class KpopModel {
  List<Members>? members;

  KpopModel({this.members});

  KpopModel.fromJson(Map<String, dynamic> json) {
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  int? id;
  int? groupId;
  String? name;
  int? age;
  String? birthPlace;
  String? birthDate;
  String? image;
  Null? createdAt;
  String? updatedAt;

  Members(
      {this.id,
      this.groupId,
      this.name,
      this.age,
      this.birthPlace,
      this.birthDate,
      this.image,
      this.createdAt,
      this.updatedAt});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    name = json['name'];
    age = json['age'];
    birthPlace = json['birth_place'];
    birthDate = json['birth_date'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['name'] = this.name;
    data['age'] = this.age;
    data['birth_place'] = this.birthPlace;
    data['birth_date'] = this.birthDate;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

import 'package:equatable/equatable.dart';
import 'package:getx_clean_architechture/TDD/domain/entities/User.dart';

class UserModel extends Equatable {
  UserModel({
    this.id,
    this.nodeId,
    this.name,
    this.owner,
    this.defaultBranch,
  });

  int? id;
  String? nodeId;
  String? name;

  Owner? owner;
  DefaultBranch? defaultBranch;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        defaultBranch: defaultBranchValues.map[json["default_branch"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "owner": owner?.toJson(),
        "default_branch": defaultBranchValues.reverse[defaultBranch],
      };

  User toEntity() =>
      User(id: id, name: name, owner: owner, defaultBranch: defaultBranch);

  @override
  List<Object?> get props => [id, nodeId, name, owner, defaultBranch];
}

enum DefaultBranch { MAIN, MASTER }

final defaultBranchValues =
    EnumValues({"main": DefaultBranch.MAIN, "master": DefaultBranch.MASTER});

class Owner extends Equatable {
  Owner({
    this.id,
    this.avatarUrl,
    this.eventsUrl,
  });

  int? id;
  String? avatarUrl;
  EventsUrl? eventsUrl;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        avatarUrl: json["avatar_url"],
        eventsUrl: eventsUrlValues.map[json["events_url"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar_url": avatarUrl,
        "events_url": eventsUrlValues.reverse[eventsUrl],
      };

  Owner toEntity() => Owner(id: id, avatarUrl: avatarUrl, eventsUrl: eventsUrl);

  @override
  List<Object?> get props => [id, avatarUrl, eventsUrl];
}

enum EventsUrl { HTTPS_API_GITHUB_COM_USERS_FREE_CODE_CAMP_EVENTS_PRIVACY }

final eventsUrlValues = EnumValues({
  "https://api.github.com/users/freeCodeCamp/events{/privacy}":
      EventsUrl.HTTPS_API_GITHUB_COM_USERS_FREE_CODE_CAMP_EVENTS_PRIVACY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

import 'package:equatable/equatable.dart';

import '../../data/model/userModel.dart';

class User extends Equatable {
  User({
    this.id,
    this.name,
    this.owner,
    this.defaultBranch,
  });

  int? id;
  String? name;
  Owner? owner;

  DefaultBranch? defaultBranch;

  @override
  List<Object?> get props => [id, name, owner, defaultBranch];
}
 
 
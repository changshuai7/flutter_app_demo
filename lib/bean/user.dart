/// [注意：由于user.g.dart是使用了part关键字引入的
/// 而user.g.dart通过新版的build_runner生成的dart文件顶部自动声明了dart版本。
/// 所以这里也必须指明dart版本，语法就是通过注释@dart=x.x来指定]
//@dart=2.12

import 'package:json_annotation/json_annotation.dart';

/// [user.g.dart 将在我们运行生成命令后自动生成]
part 'user.g.dart';

/// [这个标注是告诉生成器，这个类是需要生成Model类的]
@JsonSerializable()
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  /// [不同的类使用不同的mixin即可]
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/bean/author.dart';

class AuthorItemState extends BaseItem<Author> {
  @override
  String type='head';

  @override
  AuthorItemState clone() {
    return AuthorItemState()
      ..type = type
      ..bean = bean;
  }
}

AuthorItemState initAuthorItemState(Author author) {
  return AuthorItemState()..bean = author;
}

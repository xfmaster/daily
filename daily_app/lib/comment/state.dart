import 'package:fish_redux/fish_redux.dart';

class CommentState with MapLike implements Cloneable<CommentState> {

  @override
  CommentState clone() {
    return CommentState();
  }
}

CommentState initState(Map<String, dynamic> args) {
  return CommentState();
}

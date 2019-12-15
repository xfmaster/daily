class BaseListBean<T> extends Base {
  List<T> list;

  BaseListBean(lastKey, bool hasMore, this.list, bool isRefresh)
      : super(lastKey, hasMore, isRefresh);
}

class BaseBean<T, P> extends Base {
  List<T> list;
  P p;

  BaseBean(lastKey, bool hasMore, this.list, this.p, bool isRefresh)
      : super(lastKey, hasMore, isRefresh);
}

class Base {
  dynamic lastKey;
  bool hasMore;
  bool isRefresh;

  Base(this.lastKey, this.hasMore, this.isRefresh);
}

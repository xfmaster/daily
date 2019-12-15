

class DateUtil {
  static String getOffsetDate(int pushTime) {
    String timeStr;
    int now=DateTime.now().millisecondsSinceEpoch;
    int offset = now ~/ 1000 - pushTime;
    if (offset < 60) {
      timeStr = '刚刚';
    } else if (offset >= 60 * 60 && offset < 60 * 60) {
      int minute = offset ~/ 60;
      timeStr = '$minute分钟前';
    } else if (offset >= 60 * 60 && offset < 24 * 60 * 60) {
      int h = offset ~/ 60 ~/ 60;
      timeStr = '$h小时前';
    } else {
      var dateTime = new DateTime.fromMillisecondsSinceEpoch(pushTime * 1000);
      var month = dateTime.month;
      var day = dateTime.day;
      timeStr = '$month月$day日';
    }
    return timeStr;
  }
}

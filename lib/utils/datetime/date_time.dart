import 'package:intl/intl.dart';

String calculateTimeSince(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);

  Duration difference = DateTime.now().difference(dateTime);

  if (difference.inDays > 365) {
    int years = (difference.inDays / 365).floor();
    return '$years year${years != 1 ? 's' : ''} ago';
  } else if (difference.inDays >= 30) {
    int months = (difference.inDays / 30).floor();
    return '$months month${months != 1 ? 's' : ''} ago';
  } else if (difference.inDays >= 1) {
    return '${difference.inDays} day${difference.inDays != 1 ? 's' : ''} ago';
  } else if (difference.inHours >= 1) {
    return '${difference.inHours} hour${difference.inHours != 1 ? 's' : ''} ago';
  } else if (difference.inMinutes >= 1) {
    return '${difference.inMinutes} minute${difference.inMinutes != 1 ? 's' : ''} ago';
  } else {
    return 'Just now';
  }
}


String calculateTimeLeft(String dateString) {
  DateTime targetDate = DateTime.parse(dateString);
  DateTime currentDate = DateTime.now();
  Duration difference = targetDate.difference(currentDate);

  if (difference.inDays > 0) {
    return '${difference.inDays} day${difference.inDays != 1 ? 's' : ''} left';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hour${difference.inHours != 1 ? 's' : ''} left';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minute${difference.inMinutes != 1 ? 's' : ''} left';
  } else {
    return 'Less than a minute left';
  }
}


String formatDateFromString(String dateString) {
  DateTime date = DateTime.parse(dateString);
  return DateFormat('dd MMMM, yyyy').format(date);
}


String formatTimeString(String inputString) {
  DateTime dateTime = DateTime.parse(inputString);
  String formattedTime = DateFormat('EEEE, h a').format(dateTime);
  return formattedTime;
}
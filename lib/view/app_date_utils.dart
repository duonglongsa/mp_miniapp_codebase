// import 'package:flutter/foundation.dart';

// /// Date from API
// const dateTimeAPIFormat = 'dd/MM/yyyy HH:mm:ss';

// /// Date format full
// const dateTimeDisplayFormat = 'HH:mm dd/MM/yyyy';

// /// DateFormat
// const dateAPIFormat = 'dd/MM/yyyy';

// /// DateFormat
// const monthYearAPIFormat = 'MM/yyyy';

// /// Time format
// const timeFormatDisplay = 'HH:mm';

// /// App Date Time Utils
// class AppDateTimeUtils {
//   AppDateTimeUtils._();

//   /// Convert date from String
//   static DateTime? fromString(
//     String date, {
//     String? format,
//   }) {
//     return DateTimeExtension.fromString(date, format: format);
//   }

//   /// Convert DateTime to string
//   static String toDateTimeString(
//     DateTime? dateTime, {
//     String format = dateTimeDisplayFormat,
//   }) {
//     if (dateTime == null) return '';
//     try {
//       return DateFormat(format).format(dateTime.toLocal());
//     } catch (e) {
//       return '';
//     }
//   }

//   /// Convert Date API string
//   static String toDateAPIString(
//     DateTime? dateTime, {
//     String format = dateAPIFormat,
//   }) {
//     if (dateTime == null) return '';
//     try {
//       return DateFormat(format).format(dateTime);
//     } catch (e) {
//       return '';
//     }
//   }

//   /// Convert string to date Api
//   static DateTime? stringToMonthYearAPI(String? date) {
//     if (date == null) return null;
//     try {
//       return DateFormat(monthYearAPIFormat).parse(date);
//     } catch (e) {
//       return null;
//     }
//   }

//   /// Convert date to string Api
//   static String? monthYearToStringApi(DateTime? date) {
//     if (date == null) return null;
//     try {
//       return DateFormat(monthYearAPIFormat).format(date);
//     } catch (e) {
//       return null;
//     }
//   }

//   /// Convert DateTme API string
//   static String toDateTimeAPIString(
//     DateTime? dateTime, {
//     String format = dateTimeAPIFormat,
//   }) {
//     if (dateTime == null) {
//       return '';
//     }
//     try {
//       return DateFormat(format).format(dateTime);
//     } catch (e) {
//       return '';
//     }
//   }

//   /// Convert Time to string
//   static String toTimeString(
//     DateTime? dateTime, {
//     String format = timeFormatDisplay,
//   }) {
//     if (dateTime == null) return '';
//     try {
//       return DateFormat(format).format(dateTime);
//     } catch (e) {
//       return '';
//     }
//   }

//   /// Start day
//   static DateTime startOfDay(DateTime dateTime) {
//     return DateTime(dateTime.year, dateTime.month, dateTime.day);
//   }

//   /// End day
//   static DateTime endOfDay(DateTime dateTime) {
//     return DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59);
//   }

//   /// Convert date from string
//   static DateTime? toDateFromString(
//     String? date, {
//     String dateFormat = dateAPIFormat,
//   }) {
//     if (date == null) return null;
//     try {
//       final inputFormat = DateFormat(dateAPIFormat);
//       return inputFormat.parse(date);
//     } catch (e) {
//       return null;
//     }
//   }

//   /// Convert date time from string
//   static DateTime? toDateTimeFromString(
//     String? date, {
//     String dateTimeFormat = dateTimeDisplayFormat,
//   }) {
//     if (date == null) return null;
//     try {
//       final time = date.substring('dd/MM/yyyy'.length, date.length);
//       final times = time.split(':');
//       final hour = int.tryParse(times[0]);
//       final minute = int.tryParse(times[1]);
//       final inputFormat = DateFormat(dateAPIFormat);
//       final dateTime = inputFormat.parse(date);
//       return DateTime(
//         dateTime.year,
//         dateTime.month,
//         dateTime.day,
//         hour ?? 0,
//         minute ?? 0,
//       );
//     } catch (e) {
//       return null;
//     }
//   }
// }

// /// DateTimeExtension
// extension DateTimeExtension on DateTime {
//   /// Date time from String
//   static DateTime? fromString(
//     String date, {
//     String? format,
//   }) {
//     if ((format ?? '').isNotEmpty) {
//       try {
//         return DateFormat(format).parse(date);
//       } catch (e) {
//         if (kDebugMode) {
//           print(e);
//         }
//       }
//     }
//     try {
//       return DateTime.parse(date);
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     try {
//       return DateFormat('yyyy/MM/dd').parse(date);
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     return null;
//   }

//   /// DateTime to String
//   String toDateTimeString({
//     String format = dateTimeDisplayFormat,
//   }) {
//     try {
//       return DateFormat(format).format(toLocal());
//     } catch (e) {
//       return '';
//     }
//   }

//   /// Date Api to String
//   String toDateAPIString({
//     String format = dateAPIFormat,
//   }) {
//     try {
//       return DateFormat(format).format(this);
//     } catch (e) {
//       return '';
//     }
//   }

//   /// DateTime Api to String
//   String toDateTimeAPIString({
//     String format = dateTimeAPIFormat,
//   }) {
//     try {
//       return toIso8601String();
//     } catch (e) {
//       return '';
//     }
//   }

//   /// Calculate time difference between this date and now
//   String timeAgo() {
//     final now = DateTime.now();
//     final difference = now.difference(this);
//     if (difference.inDays >= 7) {
//       return toDateTimeString();
//     } else if (difference.inDays >= 2) {
//       return '${difference.inDays} ngày trước';
//     } else if (difference.inHours >= 2) {
//       return '${difference.inHours} giờ trước';
//     } else if (difference.inMinutes >= 1) {
//       return '${difference.inMinutes} phút trước';
//     } else if (difference.inSeconds >= 3) {
//       return '${difference.inSeconds} giây trước';
//     } else {
//       return 'Vừa xong';
//     }
//   }
// }

// /// Extension
// extension IntExtension on int {
//   /// Get date tome from Milliseconds
//   DateTime get getDateTimeFromMillisecondsSinceEpoch {
//     return DateTime.fromMillisecondsSinceEpoch(this);
//   }
// }

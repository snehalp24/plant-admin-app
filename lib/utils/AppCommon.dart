import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:mighty_plant_admin/main.dart';
import 'package:mighty_plant_admin/models/ProductDetailResponse.dart';
import 'package:mighty_plant_admin/utils/AppColors.dart';
import 'package:mighty_plant_admin/utils/AppWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppConstants.dart';

BoxDecoration boxDecoration(BuildContext context, {double radius = 10, Color color = Colors.transparent, Color bgColor = white_color, var showShadow = false}) {
  return BoxDecoration(
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      color: appStore.isDarkModeOn == true ? appStore.appBarColor : bgColor,
      boxShadow: showShadow ? [BoxShadow(color: Theme.of(context).hoverColor.withOpacity(0.2), blurRadius: 4, spreadRadius: 3, offset: Offset(1, 3))] : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

extension SExt on String {
  String get translate => appLocalizations!.translate(this);
}

String parseHtmlString(String? htmlString) {
  return parse(parse(htmlString).body!.text).documentElement!.text;
}

String convertDate(date) {
  try {
    return date != null ? DateFormat(orderDateFormat).format(DateTime.parse(date)) : '';
  } catch (e) {
    print(e);
    return '';
  }
}

bool get isVendor => getStringAsync(USER_ROLE) == "seller";

List<LanguageDataModel> getLocalLanguage() {
  List<LanguageDataModel> data = [];
  data.add(LanguageDataModel(id: 0, name: 'English', languageCode: 'en', flag: 'images/flags/ic_us.png'));
  data.add(LanguageDataModel(id: 2, name: 'Hindi', languageCode: 'hi', flag: 'images/flags/ic_india.png'));

  data.add(LanguageDataModel(id: 1, name: 'Marathi', languageCode: 'mr', flag: 'images/flags/ic_india.png'));
  return data;
}

class QueryString {
  static Map parse(String query) {
    var search = new RegExp('([^&=]+)=?([^&]*)');
    var result = new Map();

    // Get rid off the beginning ? in query strings.
    if (query.startsWith('?')) query = query.substring(1);

    // A custom decoder.
    decode(String s) => Uri.decodeComponent(s.replaceAll('+', ' '));

    // Go through all the matches and build the result map.
    for (Match match in search.allMatches(query)) {
      result[decode(match.group(1)!)] = decode(match.group(2)!);
    }

    return result;
  }
}

InputDecoration commonInputDecoration(
  BuildContext context, {
  String? label,
  Widget? prefixIcon,
  String? prefixText,
  String? hintText,
}) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.all(12),
    prefixText: prefixText,
    prefixIcon: prefixIcon,
    alignLabelWithHint: true,
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
    labelText: label,
    labelStyle: secondaryTextStyle(),
    hintText: hintText,
    hintStyle: primaryTextStyle(color: Colors.grey),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: Colors.transparent)),
    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: context.theme.colorScheme.error)),
    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: Colors.transparent)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: primaryColor)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: Colors.transparent)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: context.theme.colorScheme.error)),
  );
}

Color statusColor(String? status) {
  Color color = primaryColor;
  switch (status) {
    case "pending":
      return pendingColor;
    case "processing":
      return processingColor;
    case "on-hold":
      return primaryColor;
    case "completed":
      return completeColor;
    case "cancelled":
      return cancelledColor;
    case "refunded":
      return refundedColor;
    case "failed":
      return failedColor;
    case "any":
      return primaryColor;
  }
  return color;
}

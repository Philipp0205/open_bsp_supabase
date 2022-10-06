import 'package:flutter/material.dart';
import 'package:very_good_supabase/account/account.dart';
import 'package:very_good_supabase/app/app.dart';
import 'package:very_good_supabase/login/login.dart';

import '../../categories/view/category_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.unauthenticated:
      return [LoginPage.page()];

    // case AppStatus.authenticated:
    //   return [AccountPage.page()];

    case AppStatus.authenticated:
      return [CategoryPage.page()];
  }
}

// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:very_good_supabase/app/app.dart';

class App extends StatelessWidget {
  const App(
      {super.key,
      required this.userRepository,
      required this.categoryRepository});

  final UserRepository userRepository;
  final CategoryRepository categoryRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(create: (context) => userRepository),
        RepositoryProvider<CategoryRepository>(
            create: (_) => categoryRepository)
      ],
      child: BlocProvider(
        create: (context) => AppBloc(),
        child: const AppView(),
      ),
    );
    // return RepositoryProvider.value(
    //   value: userRepository,
    //   child: BlocProvider(
    //     create: (context) => AppBloc(),
    //     child: const AppView(),
    //   ),
    // );
  }
}

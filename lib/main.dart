import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/repositories/repositories.dart';
import 'package:qr_code/routes/router.dart';

void main() async {
  MyRouter myRouter = MyRouter();

  await Hive.initFlutter();
  await Hive.openBox("email");
  await Hive.openBox("event");
  await Hive.openBox("sms");
  await Hive.openBox("url");
  await Hive.openBox("vcard");
  await Hive.openBox("wifi");

  runApp(MyApp(
    router: myRouter.router,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => const CreateQrRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ApplicationBloc(),
          ),
          BlocProvider(
            create: (context) => CreateQrBloc(
                createQrRepository:
                    RepositoryProvider.of<CreateQrRepository>(context)),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp.router(
              title: 'Flutter Demo',
              routeInformationProvider: router.routeInformationProvider,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
            );
          },
        ),
      ),
    );
  }
}

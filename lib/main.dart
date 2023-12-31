import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/models/models.dart';
import 'package:qr_code/repositories/repositories.dart';
import 'package:qr_code/routes/router.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  MyRouter myRouter = MyRouter();

  await Hive.initFlutter();

  Hive.registerAdapter(EmailModelAdapter());
  Hive.registerAdapter(EventModelAdapter());
  Hive.registerAdapter(SmsModelAdapter());
  Hive.registerAdapter(UrlModelAdapter());
  Hive.registerAdapter(VCardModelAdapter());
  Hive.registerAdapter(WifiModelAdapter());

  Hive.registerAdapter(EmailHiveModelAdapter());
  Hive.registerAdapter(EventHiveModelAdapter());
  Hive.registerAdapter(SmsHiveModelAdapter());
  Hive.registerAdapter(UrlHiveModelAdapter());
  Hive.registerAdapter(VCardHiveModelAdapter());
  Hive.registerAdapter(WifiHiveModelAdapter());

  await Hive.openBox("emailBox");
  await Hive.openBox("eventBox");
  await Hive.openBox("smsBox");
  await Hive.openBox("urlBox");
  await Hive.openBox("vcardBox");
  await Hive.openBox("wifiBox");

  runApp(MyApp(
    router: myRouter.router,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => const CreateQrRepository(),
        ),
        RepositoryProvider(
          create: (context) => const ListRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ApplicationBloc(),
          ),
          BlocProvider(
            create: (context) => CreateQrBloc(
              createQrRepository:
                  RepositoryProvider.of<CreateQrRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ListBloc(
              listRepository: RepositoryProvider.of<ListRepository>(context),
            ),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp.router(
              title: 'QR Code App',
              debugShowCheckedModeBanner: false,
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

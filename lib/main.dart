import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/repositories/app_repository_impl.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Cómo funciona WidgetsFlutterBinding?
  // WidgetsFlutterBinding es una clase que se encarga de inicializar los Widgets de Flutter.

  // Para qué es el WidgetsFlutterBinding.ensureInitialized()?
  // Es para asegurarse de que los Widgets de Flutter estén inicializados antes de ejecutar el código.
  // Y esto sirve para prevenir errores en la inicialización de los Widgets.
  // porque de lo contrario, se podría intentar acceder a los Widgets antes de que estén inicializados.
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImpl(
              remoteDataSource:
                  AuthRemoteDataSourceImpl(supabaseClient: supabase.client),
            ),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));

  //en resumen: la función main() se encarga de inicializar los Widgets de Flutter y de inicializar Supabase.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Keep going',
        theme: AppTheme.darkThemeMode,
        home: const LoginPage());
  }
}

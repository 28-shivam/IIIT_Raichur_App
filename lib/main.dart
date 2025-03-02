import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiit_raichur/presentation/blocs/auth/auth_bloc.dart';
import 'package:iiit_raichur/presentation/screens/auth_screens/login/login_screen.dart';
import 'package:iiit_raichur/presentation/screens/profile_screen/profile_page.dart';
import 'package:iiit_raichur/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'core/utils/auth_storage.dart';
import 'data/models/user_model.dart';
import 'data/repositories/auth/auth_repository.dart';
import 'presentation/blocs/theme/theme_bloc.dart';
import 'presentation/blocs/theme/theme_state.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await AuthStorage.getToken();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => AuthBloc(AuthRepository())),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MyApp(token: token?? ""),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final String token;
  const MyApp({super.key, required this.token});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void fetchUserDetails(BuildContext context, String token) async {
    final userData = await AuthRepository().getUser(token);
    final User user = User.fromJson(userData['data']);
    Provider.of<UserProvider>(context, listen: false).setUser(user);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.token != "") {
      fetchUserDetails(context, widget.token);
    }
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
          home: ProfilePage(),
        );
      },
    );
  }
}

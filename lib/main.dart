import 'package:flutter_flight_ticket_booking/cubit/cubit.dart';
import 'package:flutter_flight_ticket_booking/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        title: "Flight Ticket Booking",
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/get-started': (context) => const GetStartedScreen(),
          '/sign-up': (context) => SignUpScreen(),
          '/sign-in': (context) => SignInScreen(),
          '/bonus': (context) => const BonusScreen(),
          '/main': (context) => const MainScreen(),
          '/success': (context) => const SuccessCheckoutScreen(),
        },
      ),
    );
  }
}

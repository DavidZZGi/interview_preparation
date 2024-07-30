import 'package:go_router/go_router.dart';
import 'package:interview_preparation/presentation/screens/screens.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name:
          'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'productdetail',
      path: '/productdetail',
      builder: (context, state) => const ProductDetail(),
    ),
  ],
);

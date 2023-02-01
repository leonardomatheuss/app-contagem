import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });

    print(count);
  }

  void incremente() {
    setState(() {
      count++;
    });

    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/474x/f8/6e/09/f86e0961c0a05a7bc2d08123aaa16eac.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFull ? 'lotado' : 'Pode entrar!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  '$count',
                  style: TextStyle(
                      fontSize: 100, color: isFull ? Colors.red : Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  TextButton(
                    onPressed: isFull ? null : incremente,
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: isFull
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        fixedSize: const Size(100, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:random_number_generator/constants/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [123, 456, 789];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 제목과 아이콘을 가진 AppBar
              _Header(),
              // 숫자가 있는곳
              _Body(
                numbers: numbers,
              ),
              // 버튼이 있는곳
              _Footer(
                onPressed: () {
                  setState(() {
                    numbers = [111, 222, 333];
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          color: redColor,
          onPressed: () {},
          icon: Icon(Icons.settings),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> numbers;
  const _Body({super.key, required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: numbers
          .map((e) => e.toString().split(''))
          .map((e) => Row(
                children: e
                    .map(
                      (num) => Image.asset(
                        'asset/img/$num.png',
                        width: 50,
                        height: 70,
                      ),
                    )
                    .toList(),
              ))
          .toList(),
    ));
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      child: Text('생성하기!'),
    );
  }
}

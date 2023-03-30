import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login Screen', style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 65, 65, 65),
            ),
            child: Column(
              children: [TextFormField(), TextFormField()],
            ),
          )
        ],
      ),
    ));
  }
}

// class _Header extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();
//     paint.color = Color.fromARGB(255, 65, 65, 65);
//     paint.style = PaintingStyle.fill;
//     paint.strokeWidth = 5;

//     final path = Path();

//     path.moveTo(0, size.height * 0.2);
//     path.lineTo(0, size.height * 0.8);
//     // path.lineTo(size.width * 0.5, size.height * 0.5);
//     path.quadraticBezierTo(
//         size.width * 0.9, size.height * 0.5, 0, size.height * 0.2);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

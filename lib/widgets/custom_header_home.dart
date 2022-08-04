import 'package:flutter/material.dart';


class BackgroundHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final paint = Paint();
    paint.color = Color(0xFF353535);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;



    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.25, size.height , size.width * 0.5,size.height * 0.6 );
    path.lineTo(size.width * 0.3,size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.4, size.height, size.width,size.height * 0.80 );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(size.width, size.height * 0.4 );

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

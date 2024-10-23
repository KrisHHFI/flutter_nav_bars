import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint for the triangle
    final paint = Paint()
      //..color = Colors.red //testing colour
      ..color = Color.fromRGBO(0, 0, 0, 0.2)
      ..style = PaintingStyle.fill; // Fill the shape

    // Define the path for the vertically flipped right-angled triangle
    var path = Path();
    path.moveTo(0, 0); // Top-left point (right angle, previously bottom-left)
    path.lineTo(size.width, 0); // Top-right point
    path.lineTo(0, size.height); // Bottom-left point
    path.close(); // Close the path to form the triangle

    // Draw the triangle on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint in this static example
  }
}

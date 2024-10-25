import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final bool flippedVertically;
  final bool flippedSideWays;

// Provides default values for the optional parameters
  const TrianglePainter({
    this.flippedVertically = false,
    this.flippedSideWays = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint for the triangle
    final paint = Paint()
      //..color = Colors.red //testing colour
      ..color = Color.fromRGBO(0, 0, 0, 0.2)
      ..style = PaintingStyle.fill; // Fill the shape

    var path = Path();

    // Each path represents a corners x,y

    // Upside down triangle
    if (flippedVertically) {
      path.moveTo(0, size.height); // Bottom-left point
      path.lineTo(size.width, size.height); // Bottom-right point
      path.lineTo(0, 0); // Top-left point (flipped)
      // Basic triangle
    } else {
      path.moveTo(0, 0); // Top-left point (right angle)
      path.lineTo(size.width, 0); // Right point
      path.lineTo(0, size.height); // Bottom-left point
    }
    path.close(); // Close the path to form the triangle

    // Draw the triangle on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint in this static example
  }
}

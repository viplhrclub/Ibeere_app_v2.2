import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_buttons.dart';

class SplashOnboarding2Screen extends StatelessWidget {
  const SplashOnboarding2Screen({super.key});

  static const String routeName = '/splash-onboarding-2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Stack(
          children: [
            _buildDecorativeShapes(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildTopBar(context),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        _buildIllustration(),
                        const SizedBox(height: 80),
                        _buildContent(),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  _buildBottomSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildProgressIndicator(2),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Skip',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator(int activeIndex) {
    return Row(
      children: List.generate(3, (index) {
        final isActive = index == activeIndex - 1;
        return Container(
          margin: const EdgeInsets.only(right: 8),
          width: isActive ? 40 : 12,
          height: 12,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
            borderRadius: BorderRadius.circular(6),
          ),
        );
      }),
    );
  }

  Widget _buildIllustration() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Transform.translate(
          offset: const Offset(-30, -10),
          child: Transform.rotate(
            angle: -0.1,
            child: Container(
              width: 150,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xFFFFE4E6),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: IbeereDesignTokens.primaryPink,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFE4E6),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Melissa_lin...',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(50, 30),
          child: Transform.rotate(
            angle: 0.15,
            child: Container(
              width: 150,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xFFD4B896),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD4B896),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'fawazgladi...',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: -20,
          child: CustomPaint(
            size: const Size(40, 40),
            painter: DoodlePainter(),
          ),
        ),
        Positioned(
          bottom: -30,
          right: -10,
          child: CustomPaint(
            size: const Size(50, 50),
            painter: DoodlePainter(),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2A4A9A).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        children: [
          Text(
            'The Ultimate Quiz Challenge',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            '"Think you\'re a genius ? Prove it\nwith our Challenge quizzes !"',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xFFD1D5DB),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        IbeereButton(
          text: 'Next',
          onPressed: () {},
          icon: Icons.arrow_forward_rounded,
          variant: IbeereButtonVariant.primary,
        ),
        const SizedBox(height: 32),
        _buildLogo(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildLogo() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ibeere',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF8B5CF6),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildDecorativeShapes() {
    return Stack(
      children: [
        Positioned(
          top: 120,
          left: 20,
          child: _buildShape(60, const Color(0xFF4B1D3F), ShapeType.blob),
        ),
        Positioned(
          top: 180,
          right: 30,
          child: _buildShape(70, const Color(0xFF3B5F4E), ShapeType.blob),
        ),
        Positioned(
          bottom: 400,
          left: 40,
          child: _buildShape(25, const Color(0xFFFBBF24), ShapeType.circle),
        ),
        Positioned(
          bottom: 350,
          right: 40,
          child: _buildShape(20, const Color(0xFF10B981), ShapeType.circle),
        ),
        Positioned(
          top: 250,
          left: 100,
          child: _buildShape(18, const Color(0xFF9CA3AF), ShapeType.square),
        ),
        Positioned(
          top: 300,
          right: 120,
          child: _buildShape(22, const Color(0xFFEC4899), ShapeType.circle, outlined: true),
        ),
        Positioned(
          bottom: 300,
          left: 200,
          child: _buildShape(20, const Color(0xFF06B6D4), ShapeType.triangle),
        ),
        Positioned(
          bottom: 320,
          right: 200,
          child: _buildShape(16, const Color(0xFFEF4444), ShapeType.circle, outlined: true),
        ),
        Positioned(
          bottom: 200,
          left: 80,
          child: _buildShape(15, const Color(0xFF8B5CF6), ShapeType.diamond),
        ),
        Positioned(
          top: 400,
          right: 60,
          child: _buildShape(18, const Color(0xFF10B981), ShapeType.circle),
        ),
      ],
    );
  }

  Widget _buildShape(double size, Color color, ShapeType shape, {bool outlined = false}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : color.withOpacity(0.6),
        shape: shape == ShapeType.circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: shape == ShapeType.square ? BorderRadius.circular(4) : null,
        border: outlined ? Border.all(color: color.withOpacity(0.6), width: 2) : null,
      ),
    );
  }
}

enum ShapeType { circle, square, triangle, blob, diamond }

class DoodlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(
        size.width / 2,
        0,
        size.width,
        size.height / 2,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

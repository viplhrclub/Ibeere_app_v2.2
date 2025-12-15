import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_buttons.dart';

class ReferralRewardsScreen extends StatelessWidget {
  const ReferralRewardsScreen({super.key});

  static const String routeName = '/referral-rewards';

  final String referralCode = '0WLN5392';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _buildBackgroundShapes(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildBanner(),
                    const SizedBox(height: 32),
                    _buildAvatarGrid(),
                    const SizedBox(height: 40),
                    _buildReferralCodeSection(context),
                    const SizedBox(height: 40),
                    _buildRewardSection(),
                    const SizedBox(height: 32),
                    _buildShareButton(),
                    const SizedBox(height: 24),
                    _buildHowItWorksLink(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5B4B8A),
            Color(0xFF3B82F6),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5B4B8A).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildBannerDecorations(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Refer your friends',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '& Earn Commissions !',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            right: -20,
            top: -10,
            child: Transform.rotate(
              angle: 0.3,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.campaign,
                  size: 60,
                  color: IbeereDesignTokens.accentYellow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerDecorations() {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 120,
          child: _buildShape(10, Colors.white, ShapeType.diamond),
        ),
        Positioned(
          bottom: 15,
          left: 80,
          child: _buildShape(8, const Color(0xFFEF4444), ShapeType.circle, outlined: true),
        ),
        Positioned(
          top: 40,
          left: 50,
          child: _buildShape(6, Colors.white, ShapeType.circle, outlined: true),
        ),
        Positioned(
          bottom: 25,
          left: 150,
          child: _buildShape(12, const Color(0xFF10B981), ShapeType.circle, outlined: true),
        ),
        Positioned(
          top: 20,
          right: 120,
          child: _buildShape(8, const Color(0xFFFBBF24), ShapeType.circle),
        ),
        Positioned(
          bottom: 20,
          right: 140,
          child: _buildShape(10, const Color(0xFF06B6D4), ShapeType.triangle),
        ),
        Positioned(
          top: 50,
          right: 100,
          child: _buildShape(8, const Color(0xFFEC4899), ShapeType.circle, outlined: true),
        ),
        Positioned(
          bottom: 10,
          right: 100,
          child: _buildShape(6, Colors.white, ShapeType.diamond),
        ),
      ],
    );
  }

  Widget _buildAvatarGrid() {
    final List<Color> avatarColors = [
      const Color(0xFF7DD3FC),
      const Color(0xFF1E293B),
      const Color(0xFFFFDDDD),
      const Color(0xFF86EFAC),
      const Color(0xFF4F46E5),
      const Color(0xFF6B7280),
      const Color(0xFFE0E7FF),
      const Color(0xFFFDE68A),
      const Color(0xFFFAE8FF),
    ];

    return Stack(
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: List.generate(8, (index) {
            return Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: avatarColors[index],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 48,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            );
          }),
        ),
        Positioned(
          top: 20,
          right: 40,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.primaryPurple.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.primaryPurple.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReferralCodeSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Referral Code',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: IbeereDesignTokens.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: referralCode.split('').map((char) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  char,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: IbeereDesignTokens.textPrimary,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: referralCode));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Referral code copied to clipboard!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.copy_outlined,
                size: 18,
                color: IbeereDesignTokens.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(
                'Click to copy Code',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: IbeereDesignTokens.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRewardSection() {
    return Column(
      children: [
        Text(
          '500 Kauris',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w700,
            color: IbeereDesignTokens.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Invite your friends to join & earn Kauris as Reward.',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: IbeereDesignTokens.textSecondary,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'You will get',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: IbeereDesignTokens.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 14,
                        color: IbeereDesignTokens.textTertiary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '500 Kauris',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'They will get',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: IbeereDesignTokens.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 14,
                        color: IbeereDesignTokens.textTertiary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '500 Kauris',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShareButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            IbeereDesignTokens.primaryRed,
            const Color(0xFFDC2626),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: IbeereDesignTokens.primaryRed.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.group_outlined,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 12),
              const Text(
                'Share now',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHowItWorksLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.help_outline,
          size: 20,
          color: IbeereDesignTokens.textSecondary,
        ),
        const SizedBox(width: 8),
        Text(
          'How it works ? ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: IbeereDesignTokens.textSecondary,
          ),
        ),
        const Text(
          'Steps',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4B5563),
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundShapes() {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: -40,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.decorativePink.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 400,
          right: -50,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.decorativeYellow.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 200,
          left: -30,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.decorativePink.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          right: 20,
          child: _buildShape(15, const Color(0xFFFBBF24), ShapeType.circle),
        ),
        Positioned(
          top: 600,
          left: 30,
          child: _buildShape(12, const Color(0xFF10B981), ShapeType.circle),
        ),
        Positioned(
          top: 300,
          right: 50,
          child: _buildShape(10, const Color(0xFF06B6D4), ShapeType.triangle),
        ),
        Positioned(
          bottom: 300,
          left: 80,
          child: _buildShape(14, const Color(0xFF9CA3AF), ShapeType.diamond),
        ),
        Positioned(
          bottom: 400,
          right: 100,
          child: _buildShape(12, const Color(0xFFEF4444), ShapeType.circle, outlined: true),
        ),
      ],
    );
  }

  Widget _buildShape(double size, Color color, ShapeType shape, {bool outlined = false}) {
    Widget shapeWidget;

    if (shape == ShapeType.triangle) {
      shapeWidget = CustomPaint(
        size: Size(size, size),
        painter: TrianglePainter(color: outlined ? Colors.transparent : color, outlined: outlined),
      );
    } else if (shape == ShapeType.diamond) {
      shapeWidget = Transform.rotate(
        angle: 0.785398,
        child: Container(
          width: size * 0.7,
          height: size * 0.7,
          decoration: BoxDecoration(
            color: outlined ? Colors.transparent : color.withOpacity(0.6),
            border: outlined ? Border.all(color: color.withOpacity(0.6), width: 1.5) : null,
          ),
        ),
      );
    } else {
      shapeWidget = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: outlined ? Colors.transparent : color.withOpacity(0.6),
          shape: BoxShape.circle,
          border: outlined ? Border.all(color: color.withOpacity(0.6), width: 1.5) : null,
        ),
      );
    }

    return shapeWidget;
  }
}

enum ShapeType { circle, triangle, diamond }

class TrianglePainter extends CustomPainter {
  final Color color;
  final bool outlined;

  TrianglePainter({required this.color, this.outlined = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = outlined ? color.withOpacity(0.6) : color.withOpacity(0.6)
      ..style = outlined ? PaintingStyle.stroke : PaintingStyle.fill
      ..strokeWidth = outlined ? 1.5 : 0;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

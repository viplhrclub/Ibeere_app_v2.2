import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class BadgesCollectionScreen extends StatelessWidget {
  const BadgesCollectionScreen({super.key});

  static const String routeName = '/badges-collection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      body: SafeArea(
        child: Stack(
          children: [
            _buildBackgroundShapes(),
            Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        _buildTopCollectorsBanner(),
                        const SizedBox(height: 32),
                        _buildBadgeGrid(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 40),
          Text(
            'Badges Room',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: IbeereDesignTokens.textPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: IbeereDesignTokens.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopCollectorsBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 60,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  child: _buildCollectorAvatar(0),
                ),
                Positioned(
                  left: 30,
                  child: _buildCollectorAvatar(1),
                ),
                Positioned(
                  left: 60,
                  child: _buildCollectorAvatar(2),
                ),
                Positioned(
                  left: 90,
                  child: _buildCollectorAvatar(3),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: IbeereDesignTokens.primaryPink.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '+5K',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: IbeereDesignTokens.primaryPink,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'The best badge collectors',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: IbeereDesignTokens.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollectorAvatar(int index) {
    final colors = [
      const Color(0xFF7DD3FC),
      const Color(0xFF1E293B),
      const Color(0xFFFFDDDD),
      const Color(0xFF3B82F6),
    ];

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: colors[index],
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.person,
          color: Colors.white.withOpacity(0.8),
          size: 28,
        ),
      ),
    );
  }

  Widget _buildBadgeGrid() {
    final badges = [
      BadgeData('SUPER ELITE', Icons.emoji_events, const Color(0xFFE0E7EB), false),
      BadgeData('SUPER POWER', Icons.emoji_events, const Color(0xFF8B5CF6), true),
      BadgeData('MAGICIAN', Icons.auto_awesome, const Color(0xFF93C5FD), false),
      BadgeData('QUIZ WARRIOR', Icons.ice_skating, const Color(0xFF4F46E5), true),
      BadgeData('SUPER ELITE', Icons.rocket_launch, const Color(0xFFFDE68A), false),
      BadgeData('QUIZ WARRIOR', Icons.auto_graph, const Color(0xFF1E293B), true),
      BadgeData('MAGICIAN', Icons.star, const Color(0xFFE9D5FF), false),
      BadgeData('SUPER POWER', Icons.rocket, const Color(0xFFDDD6FE), false),
      BadgeData('SUPER ELITE', Icons.diamond, const Color(0xFFBAE6FD), false),
      BadgeData('SUPER POWER', Icons.emoji_events, const Color(0xFF8B5CF6), true),
      BadgeData('MAGICIAN', Icons.auto_awesome, const Color(0xFFE0E7EB), false),
      BadgeData('QUIZ WARRIOR', Icons.ice_skating, const Color(0xFFDDD6FE), false),
      BadgeData('MAGICIAN', Icons.star, const Color(0xFFE9D5FF), false),
      BadgeData('SUPER ELITE', Icons.rocket_launch, const Color(0xFFFDE68A), false),
      BadgeData('QUIZ WARRIOR', Icons.auto_graph, const Color(0xFF1E293B), true),
      BadgeData('SUPER POWER', Icons.rocket, const Color(0xFFDDD6FE), false),
      BadgeData('SUPER ELITE', Icons.diamond, const Color(0xFFBAE6FD), false),
      BadgeData('MAGICIAN', Icons.auto_awesome, const Color(0xFF93C5FD), false),
      BadgeData('QUIZ WARRIOR', Icons.ice_skating, const Color(0xFF4F46E5), true),
      BadgeData('SUPER POWER', Icons.emoji_events, const Color(0xFF8B5CF6), true),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
        childAspectRatio: 0.75,
      ),
      itemCount: badges.length,
      itemBuilder: (context, index) {
        return _buildBadgeItem(badges[index]);
      },
    );
  }

  Widget _buildBadgeItem(BadgeData badge) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: badge.isEarned ? badge.color : badge.color.withOpacity(0.3),
            shape: BoxShape.circle,
            boxShadow: badge.isEarned
                ? [
                    BoxShadow(
                      color: badge.color.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Icon(
              badge.icon,
              color: badge.isEarned
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
              size: 36,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          badge.name,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: badge.isEarned
                ? IbeereDesignTokens.textPrimary
                : IbeereDesignTokens.textTertiary,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildBackgroundShapes() {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 20,
          child: _buildShape(12, const Color(0xFF6B7280), ShapeType.square),
        ),
        Positioned(
          top: 150,
          right: 30,
          child: _buildShape(10, const Color(0xFFFBBF24), ShapeType.circle),
        ),
        Positioned(
          top: 200,
          left: 50,
          child: _buildShape(8, const Color(0xFF10B981), ShapeType.circle, outlined: true),
        ),
        Positioned(
          top: 300,
          right: 40,
          child: _buildShape(14, const Color(0xFF06B6D4), ShapeType.diamond),
        ),
        Positioned(
          top: 400,
          left: 30,
          child: _buildShape(10, const Color(0xFFEC4899), ShapeType.circle, outlined: true),
        ),
        Positioned(
          top: 500,
          right: 60,
          child: _buildShape(12, const Color(0xFF8B5CF6), ShapeType.triangle),
        ),
        Positioned(
          top: 600,
          left: 80,
          child: _buildShape(8, const Color(0xFFEF4444), ShapeType.circle),
        ),
        Positioned(
          bottom: 200,
          right: 100,
          child: _buildShape(10, const Color(0xFF10B981), ShapeType.circle),
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
    } else if (shape == ShapeType.square) {
      shapeWidget = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: outlined ? Colors.transparent : color.withOpacity(0.6),
          borderRadius: BorderRadius.circular(2),
          border: outlined ? Border.all(color: color.withOpacity(0.6), width: 1.5) : null,
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

class BadgeData {
  final String name;
  final IconData icon;
  final Color color;
  final bool isEarned;

  BadgeData(this.name, this.icon, this.color, this.isEarned);
}

enum ShapeType { circle, square, triangle, diamond }

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

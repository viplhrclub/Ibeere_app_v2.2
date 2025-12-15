import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class HomeQuizFeedScreen extends StatefulWidget {
  const HomeQuizFeedScreen({super.key});

  static const String routeName = '/home-quiz-feed';

  @override
  State<HomeQuizFeedScreen> createState() => _HomeQuizFeedScreenState();
}

class _HomeQuizFeedScreenState extends State<HomeQuizFeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> _questions = [
    {
      'category': 'General Knowledge',
      'question': 'Qu\'est-ce que l\'indice des prix à la consommation (IPC) ?...'
    },
    {
      'category': 'Economy',
      'question': 'Qu\'est-ce que l\'externalité ?'
    },
    {
      'category': 'History',
      'question': 'Quel pays a construit le mur de Berlin en 1961 ?'
    },
    {
      'category': 'General Knowledge',
      'question': 'Qu\'est-ce que l\'indice des prix à la consommation (IPC) ?...'
    },
    {
      'category': 'General Knowledge',
      'question': 'Qu\'est-ce que le capital humain ?'
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildQuizFeed(),
                  _buildPlaceholder('Guess the Word'),
                  _buildPlaceholder('Audio Quiz'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TabBar(
        controller: _tabController,
        indicatorColor: IbeereDesignTokens.primaryPurple,
        indicatorWeight: 3,
        labelColor: IbeereDesignTokens.textPrimary,
        unselectedLabelColor: IbeereDesignTokens.textTertiary,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        tabs: const [
          Tab(text: 'Quiz Zone'),
          Tab(text: 'Guess the Word'),
          Tab(text: 'Audio Quiz'),
        ],
      ),
    );
  }

  Widget _buildQuizFeed() {
    return Stack(
      children: [
        _buildBackgroundShapes(),
        ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _questions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _buildQuestionCard(
                _questions[index]['category']!,
                _questions[index]['question']!,
                index,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildQuestionCard(String category, String question, int index) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildCardDecorations(index),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: IbeereDesignTokens.textTertiary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 4,
                    height: 60,
                    decoration: BoxDecoration(
                      color: _getCategoryColor(category),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      question,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: IbeereDesignTokens.textPrimary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardDecorations(int index) {
    final offset = index * 30.0;
    return Stack(
      children: [
        Positioned(
          top: -8 + offset,
          left: 15,
          child: _buildFloatingShape(10, const Color(0xFF10B981), ShapeType.circle),
        ),
        Positioned(
          top: 25 + offset,
          left: 5,
          child: _buildFloatingShape(8, const Color(0xFFFBBF24), ShapeType.circle),
        ),
        Positioned(
          top: 50 + offset,
          left: 10,
          child: _buildFloatingShape(10, const Color(0xFF94A3B8), ShapeType.circle, outlined: true),
        ),
        Positioned(
          top: 70 + offset,
          left: 8,
          child: _buildFloatingShape(12, const Color(0xFF8B5CF6), ShapeType.diamond),
        ),
        Positioned(
          top: -5 + offset,
          right: 15,
          child: _buildFloatingShape(12, const Color(0xFF8B5CF6), ShapeType.diamond),
        ),
        Positioned(
          top: 30 + offset,
          right: 5,
          child: _buildFloatingShape(10, const Color(0xFF06B6D4), ShapeType.triangle),
        ),
        Positioned(
          top: 55 + offset,
          right: 8,
          child: _buildFloatingShape(8, const Color(0xFFFBBF24), ShapeType.circle),
        ),
        Positioned(
          bottom: 10 + offset,
          right: 12,
          child: _buildFloatingShape(10, const Color(0xFFEF4444), ShapeType.circle, outlined: true),
        ),
      ],
    );
  }

  Widget _buildBackgroundShapes() {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: -20,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.decorativePink.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 400,
          right: -30,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.decorativePurple.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 700,
          left: 20,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.decorativeYellow.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingShape(double size, Color color, ShapeType shape, {bool outlined = false}) {
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

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'general knowledge':
        return IbeereDesignTokens.primaryPurple;
      case 'economy':
        return IbeereDesignTokens.primaryPink;
      case 'history':
        return IbeereDesignTokens.accentCyan;
      default:
        return IbeereDesignTokens.primaryPurple;
    }
  }

  Widget _buildPlaceholder(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: IbeereDesignTokens.textSecondary,
        ),
      ),
    );
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

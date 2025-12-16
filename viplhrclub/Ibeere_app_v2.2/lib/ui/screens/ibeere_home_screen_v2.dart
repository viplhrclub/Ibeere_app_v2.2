import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class IbeereHomeScreenV2 extends StatefulWidget {
  const IbeereHomeScreenV2({super.key});

  static const String routeName = '/home-v2';

  @override
  State<IbeereHomeScreenV2> createState() => _IbeereHomeScreenV2State();
}

class _IbeereHomeScreenV2State extends State<IbeereHomeScreenV2> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
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
                  _buildQuizZone(),
                  _buildGuessTheWord(),
                  _buildAudioQuiz(),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          _buildTab('Quiz Zone', 0),
          const SizedBox(width: 20),
          _buildTab('Guess the Word', 1),
          const SizedBox(width: 20),
          _buildTab('Audio Quiz', 2),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(index);
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: IbeereDesignTokens.fontSizeMedium,
          fontWeight: isSelected ? IbeereDesignTokens.fontWeightSemiBold : IbeereDesignTokens.fontWeightMedium,
          color: isSelected ? IbeereDesignTokens.textPrimary : IbeereDesignTokens.textTertiary,
        ),
      ),
    );
  }

  Widget _buildQuizZone() {
    final questions = [
      {
        'category': 'General Knowledge',
        'question': "Qu'est-ce que l'indice des prix à la consommation (IPC) ?...",
      },
      {
        'category': 'Economy',
        'question': "Qu'est-ce que l'externalité ?",
      },
      {
        'category': 'History',
        'question': 'Quel pays a construit le mur de Berlin en 1961 ?',
      },
      {
        'category': 'General Knowledge',
        'question': "Qu'est-ce que l'indice des prix à la consommation (IPC) ?...",
      },
      {
        'category': 'General Knowledge',
        'question': "Qu'est-ce que le capital humain ?",
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return _buildQuestionCard(
          category: questions[index]['category']!,
          question: questions[index]['question']!,
        );
      },
    );
  }

  Widget _buildGuessTheWord() {
    return Center(
      child: Text(
        'Guess the Word',
        style: TextStyle(
          color: IbeereDesignTokens.textSecondary,
          fontSize: IbeereDesignTokens.fontSizeMedium,
        ),
      ),
    );
  }

  Widget _buildAudioQuiz() {
    return Center(
      child: Text(
        'Audio Quiz',
        style: TextStyle(
          color: IbeereDesignTokens.textSecondary,
          fontSize: IbeereDesignTokens.fontSizeMedium,
        ),
      ),
    );
  }

  Widget _buildQuestionCard({
    required String category,
    required String question,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: IbeereDesignTokens.backgroundWhite,
        borderRadius: BorderRadius.circular(IbeereDesignTokens.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: IbeereDesignTokens.primaryPurple,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(IbeereDesignTokens.borderRadius),
                  bottomLeft: Radius.circular(IbeereDesignTokens.borderRadius),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: IbeereDesignTokens.fontSizeSmall,
                    color: IbeereDesignTokens.textTertiary,
                    fontWeight: IbeereDesignTokens.fontWeightMedium,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: IbeereDesignTokens.fontSizeMedium,
                    color: IbeereDesignTokens.textPrimary,
                    fontWeight: IbeereDesignTokens.fontWeightSemiBold,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          ..._buildDecorativeShapes(),
        ],
      ),
    );
  }

  List<Widget> _buildDecorativeShapes() {
    return [
      Positioned(
        top: 16,
        left: 16,
        child: _DecorativeShape(
          color: const Color(0xFF64748B),
          size: 6,
          shape: _ShapeType.square,
          rotation: 45,
        ),
      ),
      Positioned(
        top: 20,
        left: 36,
        child: _DecorativeShape(
          color: IbeereDesignTokens.accentCyan,
          size: 6,
          shape: _ShapeType.circle,
        ),
      ),
      Positioned(
        top: 30,
        left: 20,
        child: _DecorativeShape(
          color: IbeereDesignTokens.accentYellow,
          size: 6,
          shape: _ShapeType.circle,
        ),
      ),
      Positioned(
        top: 50,
        left: 8,
        child: _DecorativeShape(
          color: const Color(0xFF94A3B8),
          size: 8,
          shape: _ShapeType.circle,
        ),
      ),
      Positioned(
        bottom: 30,
        left: 14,
        child: _DecorativeShape(
          color: IbeereDesignTokens.primaryPurple,
          size: 8,
          shape: _ShapeType.square,
          rotation: 45,
        ),
      ),
      Positioned(
        top: 16,
        right: 16,
        child: _DecorativeShape(
          color: IbeereDesignTokens.primaryPurple,
          size: 8,
          shape: _ShapeType.square,
          rotation: 45,
        ),
      ),
      Positioned(
        top: 24,
        right: 40,
        child: _DecorativeShape(
          color: IbeereDesignTokens.accentGreen,
          size: 6,
          shape: _ShapeType.triangle,
        ),
      ),
      Positioned(
        top: 40,
        right: 24,
        child: _DecorativeShape(
          color: IbeereDesignTokens.accentYellow,
          size: 6,
          shape: _ShapeType.circle,
        ),
      ),
      Positioned(
        bottom: 24,
        right: 18,
        child: _DecorativeShape(
          color: IbeereDesignTokens.primaryRed,
          size: 8,
          shape: _ShapeType.circle,
        ),
      ),
      Positioned(
        bottom: 40,
        right: 40,
        child: _DecorativeShape(
          color: const Color(0xFF64748B),
          size: 6,
          shape: _ShapeType.diamond,
          rotation: 45,
        ),
      ),
    ];
  }
}

enum _ShapeType { circle, square, triangle, diamond }

class _DecorativeShape extends StatelessWidget {
  final Color color;
  final double size;
  final _ShapeType shape;
  final double rotation;

  const _DecorativeShape({
    required this.color,
    required this.size,
    required this.shape,
    this.rotation = 0,
  });

  @override
  Widget build(BuildContext context) {
    Widget shapeWidget;

    switch (shape) {
      case _ShapeType.circle:
        shapeWidget = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        );
        break;
      case _ShapeType.square:
        shapeWidget = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1),
          ),
        );
        break;
      case _ShapeType.triangle:
        shapeWidget = CustomPaint(
          size: Size(size, size),
          painter: _TrianglePainter(color),
        );
        break;
      case _ShapeType.diamond:
        shapeWidget = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1),
          ),
        );
        break;
    }

    if (rotation != 0) {
      return Transform.rotate(
        angle: rotation * 3.14159 / 180,
        child: shapeWidget,
      );
    }

    return shapeWidget;
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

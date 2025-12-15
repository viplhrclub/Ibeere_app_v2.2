import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class MiniGamesScreen extends StatelessWidget {
  const MiniGamesScreen({super.key});

  static const String routeName = '/mini-games';

  final List<MiniGame> games = const [
    MiniGame(
      name: 'Trivia World',
      icon: Icons.public,
      gradient: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
      gameUrl: 'https://ibeere.fun/games/trivia-world',
    ),
    MiniGame(
      name: 'Number Puzzle',
      icon: Icons.grid_3x3,
      gradient: [Color(0xFFEC4899), Color(0xFFF43F5E)],
      gameUrl: 'https://ibeere.fun/games/number-puzzle',
    ),
    MiniGame(
      name: 'Trivia World II',
      icon: Icons.psychology,
      gradient: [Color(0xFF10B981), Color(0xFF059669)],
      gameUrl: 'https://ibeere.fun/games/trivia-world-2',
    ),
    MiniGame(
      name: 'Memory Games',
      icon: Icons.memory,
      gradient: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
      gameUrl: 'https://ibeere.fun/games/memory',
    ),
    MiniGame(
      name: 'Tic Tac Toe Game',
      icon: Icons.tag,
      gradient: [Color(0xFF06B6D4), Color(0xFF0891B2)],
      gameUrl: 'https://ibeere.fun/games/tic-tac-toe',
    ),
    MiniGame(
      name: 'Maths Games',
      icon: Icons.calculate,
      gradient: [Color(0xFFEF4444), Color(0xFFDC2626)],
      gameUrl: 'https://ibeere.fun/games/maths',
    ),
    MiniGame(
      name: '2048 Game',
      icon: Icons.apps,
      gradient: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
      gameUrl: 'https://ibeere.fun/games/2048',
    ),
    MiniGame(
      name: 'Focus Game',
      icon: Icons.visibility,
      gradient: [Color(0xFF0EA5E9), Color(0xFF0284C7)],
      gameUrl: 'https://ibeere.fun/games/focus',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: Stack(
                children: [
                  _buildBackgroundShapes(),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: games.length,
                      itemBuilder: (context, index) {
                        return _buildGameCard(context, games[index]);
                      },
                    ),
                  ),
                ],
              ),
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
          Text(
            'Mini Games',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: IbeereDesignTokens.textPrimary,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: IbeereDesignTokens.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, MiniGame game) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MiniGameWebView(game: game),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: game.gradient,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: game.gradient.first.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            _buildGameCardDecorations(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      game.icon,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    game.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCardDecorations() {
    return Stack(
      children: [
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 20,
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
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
          left: 20,
          child: _buildShape(15, const Color(0xFFFBBF24)),
        ),
        Positioned(
          top: 150,
          right: 30,
          child: _buildShape(12, const Color(0xFF10B981)),
        ),
        Positioned(
          bottom: 200,
          left: 40,
          child: _buildShape(18, const Color(0xFFEC4899)),
        ),
        Positioned(
          bottom: 100,
          right: 50,
          child: _buildShape(14, const Color(0xFF06B6D4)),
        ),
      ],
    );
  }

  Widget _buildShape(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
    );
  }
}

class MiniGame {
  final String name;
  final IconData icon;
  final List<Color> gradient;
  final String gameUrl;

  const MiniGame({
    required this.name,
    required this.icon,
    required this.gradient,
    required this.gameUrl,
  });
}

class MiniGameWebView extends StatefulWidget {
  final MiniGame game;

  const MiniGameWebView({required this.game, super.key});

  @override
  State<MiniGameWebView> createState() => _MiniGameWebViewState();
}

class _MiniGameWebViewState extends State<MiniGameWebView> {
  bool _isLoading = true;
  int _currentScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.game.name),
        backgroundColor: widget.game.gradient.first,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Score: $_currentScore',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.game.icon,
                  size: 80,
                  color: Colors.white.withOpacity(0.3),
                ),
                const SizedBox(height: 20),
                Text(
                  'Game Loading...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'HTML5 game will load here',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    _simulateGameScore();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.game.gradient.first,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('Simulate Game End (Test)'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _simulateGameScore() {
    setState(() {
      _currentScore = 150 + (DateTime.now().second * 10);
    });

    _syncScoreToBackend(_currentScore);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.game.gradient,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.emoji_events,
                color: Colors.white,
                size: 48,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Game Complete!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: IbeereDesignTokens.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Score: $_currentScore',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8B5CF6),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You earned ${(_currentScore / 10).round()} Kauris!',
              style: TextStyle(
                fontSize: 16,
                color: IbeereDesignTokens.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.game.gradient.first,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _syncScoreToBackend(int score) async {
    try {
    } catch (e) {
      debugPrint('Failed to sync score: $e');
    }
  }
}

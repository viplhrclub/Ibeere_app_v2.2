import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class MiniGamesScreen extends StatelessWidget {
  const MiniGamesScreen({super.key});

  static const String routeName = '/mini-games';

  @override
  Widget build(BuildContext context) {
    final games = [
      MiniGame('Trivia World', Icons.public, [IbeereDesignTokens.primaryPurple, IbeereDesignTokens.primaryPink]),
      MiniGame('Number Puzzle', Icons.grid_3x3, [IbeereDesignTokens.primaryPink, Color(0xFFF472B6)]),
      MiniGame('Trivia World II', Icons.psychology, [IbeereDesignTokens.accentGreen, Color(0xFF34D399)]),
      MiniGame('Memory Games', Icons.memory, [IbeereDesignTokens.accentYellow, Color(0xFFFBBF24)]),
      MiniGame('Tic Tac Toe', Icons.tag, [IbeereDesignTokens.accentCyan, Color(0xFF22D3EE)]),
      MiniGame('Maths Games', Icons.calculate, [IbeereDesignTokens.primaryRed, Color(0xFFF87171)]),
      MiniGame('2048 Game', Icons.apps, [Color(0xFF8B5CF6), Color(0xFFA78BFA)]),
      MiniGame('Focus Game', Icons.visibility, [Color(0xFF3B82F6), Color(0xFF60A5FA)]),
    ];

    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: IbeereDesignTokens.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Mini Games', style: TextStyle(color: IbeereDesignTokens.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Positioned(top: 40, right: -20, child: _DecorativeCircle(color: IbeereDesignTokens.primaryPurple.withOpacity(0.05), size: 120)),
          Positioned(bottom: 60, left: -30, child: _DecorativeCircle(color: IbeereDesignTokens.primaryPink.withOpacity(0.05), size: 140)),
          GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
            ),
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Opening ${game.name}...'), duration: Duration(seconds: 1)),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: game.gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: game.gradient[0].withOpacity(0.3), blurRadius: 12, offset: Offset(0, 6))],
                  ),
                  child: Stack(
                    children: [
                      Positioned(top: -10, right: -10, child: Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), shape: BoxShape.circle))),
                      Positioned(bottom: -20, left: -20, child: Container(width: 80, height: 80, decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), shape: BoxShape.circle))),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(game.icon, size: 32, color: Colors.white),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            game.name,
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MiniGame {
  final String name;
  final IconData icon;
  final List<Color> gradient;

  MiniGame(this.name, this.icon, this.gradient);
}

class _DecorativeCircle extends StatelessWidget {
  final Color color;
  final double size;
  const _DecorativeCircle({required this.color, required this.size});
  @override
  Widget build(BuildContext context) => Container(width: size, height: size, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
}

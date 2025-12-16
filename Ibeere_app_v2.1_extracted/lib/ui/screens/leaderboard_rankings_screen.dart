import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class LeaderboardRankingsScreen extends StatefulWidget {
  const LeaderboardRankingsScreen({super.key});

  static const String routeName = '/leaderboard-rankings';

  @override
  State<LeaderboardRankingsScreen> createState() => _LeaderboardRankingsScreenState();
}

class _LeaderboardRankingsScreenState extends State<LeaderboardRankingsScreen> {
  String _selectedPeriod = 'Daily';

  final List<Map<String, dynamic>> _topPlayers = [
    {'rank': 2, 'name': 'Sarah_Johnson', 'points': 45600, 'avatar': Icons.person, 'color': Color(0xFFC0C0C0)},
    {'rank': 1, 'name': 'Melissa_lin', 'points': 52800, 'avatar': Icons.person, 'color': Color(0xFFFFD700)},
    {'rank': 3, 'name': 'Alex_Parker', 'points': 38900, 'avatar': Icons.person, 'color': Color(0xFFCD7F32)},
  ];

  final List<Map<String, dynamic>> _otherPlayers = [
    {'rank': 4, 'name': 'John_Doe', 'points': 34500, 'avatar': Icons.person, 'color': IbeereDesignTokens.accentCyan},
    {'rank': 5, 'name': 'Emma_Wilson', 'points': 32100, 'avatar': Icons.person, 'color': IbeereDesignTokens.primaryPink},
    {'rank': 6, 'name': 'David_Brown', 'points': 29800, 'avatar': Icons.person, 'color': IbeereDesignTokens.accentGreen},
    {'rank': 7, 'name': 'Lisa_Anderson', 'points': 27600, 'avatar': Icons.person, 'color': IbeereDesignTokens.primaryPurple},
    {'rank': 8, 'name': 'Michael_Lee', 'points': 25400, 'avatar': Icons.person, 'color': IbeereDesignTokens.accentYellow},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top: 100, right: -30, child: _DecorativeCircle(color: Color(0xFF8B5CF6).withOpacity(0.08), size: 100)),
            Positioned(bottom: 150, left: -40, child: _DecorativeCircle(color: Color(0xFFEC4899).withOpacity(0.08), size: 120)),
            Column(
              children: [
                _buildHeader(),
                _buildPeriodSelector(),
                const SizedBox(height: 32),
                _buildTopThree(),
                const SizedBox(height: 24),
                Expanded(child: _buildRankingsList()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: IbeereDesignTokens.textPrimary),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Text(
              'Leaderboard',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: IbeereDesignTokens.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Expanded(child: _buildPeriodButton('Daily')),
          const SizedBox(width: 12),
          Expanded(child: _buildPeriodButton('Weekly')),
          const SizedBox(width: 12),
          Expanded(child: _buildPeriodButton('Monthly')),
        ],
      ),
    );
  }

  Widget _buildPeriodButton(String period) {
    final isSelected = _selectedPeriod == period;
    return GestureDetector(
      onTap: () => setState(() => _selectedPeriod = period),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(colors: [IbeereDesignTokens.primaryPurple, Color(0xFF7C3AED)])
              : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: isSelected ? IbeereDesignTokens.primaryPurple.withOpacity(0.3) : Colors.black.withOpacity(0.05), blurRadius: isSelected ? 12 : 6, offset: Offset(0, isSelected ? 4 : 2))],
        ),
        child: Text(
          period,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF5B6B8C),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTopThree() {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 20,
            child: _buildPodiumCard(_topPlayers[0], 120, false),
          ),
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: _buildPodiumCard(_topPlayers[1], 160, true),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: _buildPodiumCard(_topPlayers[2], 100, false),
          ),
        ],
      ),
    );
  }

  Widget _buildPodiumCard(Map<String, dynamic> player, double height, bool isWinner) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isWinner ? 88 : 72,
          height: isWinner ? 88 : 72,
          decoration: BoxDecoration(
            color: player['color'],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: isWinner ? 4 : 3),
            boxShadow: [BoxShadow(color: player['color'].withOpacity(0.4), blurRadius: 15, offset: Offset(0, 6))],
          ),
          child: Icon(player['avatar'], color: Colors.white, size: isWinner ? 44 : 36),
        ),
        if (isWinner)
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFFFD700),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.emoji_events, color: Colors.white, size: 16),
          ),
        const SizedBox(height: 8),
        Container(
          width: 100,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isWinner
                  ? [IbeereDesignTokens.accentYellow, Color(0xFFF59E0B)]
                  : [Color(0xFF8897AE), Color(0xFF5B6B8C)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 4))],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${player['rank']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                player['name'].toString().substring(0, player['name'].toString().length > 8 ? 8 : player['name'].toString().length),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${(player['points'] / 1000).toStringAsFixed(1)}k',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRankingsList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: ListView.separated(
        itemCount: _otherPlayers.length,
        separatorBuilder: (context, index) => Divider(height: 24, color: IbeereDesignTokens.backgroundLight),
        itemBuilder: (context, index) {
          final player = _otherPlayers[index];
          return Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: IbeereDesignTokens.backgroundLight,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${player['rank']}',
                    style: TextStyle(
                      color: Color(0xFF5B6B8C),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: player['color'],
                  shape: BoxShape.circle,
                ),
                child: Icon(player['avatar'], color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  player['name'],
                  style: TextStyle(
                    color: IbeereDesignTokens.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${(player['points'] / 1000).toStringAsFixed(1)}k',
                style: TextStyle(
                  color: IbeereDesignTokens.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  final Color color;
  final double size;
  const _DecorativeCircle({required this.color, required this.size});
  @override
  Widget build(BuildContext context) => Container(width: size, height: size, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
}

class _DecorativeSquare extends StatelessWidget {
  final Color color;
  final double size;
  const _DecorativeSquare({required this.color, required this.size});
  @override
  Widget build(BuildContext context) => Container(width: size, height: size, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)));
}

class _DecorativeTriangle extends StatelessWidget {
  final Color color;
  final double size;
  const _DecorativeTriangle({required this.color, required this.size});
  @override
  Widget build(BuildContext context) => CustomPaint(size: Size(size, size), painter: _TrianglePainter(color));
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..style = PaintingStyle.fill;
    final path = Path()..moveTo(size.width / 2, 0)..lineTo(size.width, size.height)..lineTo(0, size.height)..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
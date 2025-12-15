import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class BadgesCollectionScreen extends StatelessWidget {
  const BadgesCollectionScreen({super.key});

  static const String routeName = '/badges-collection';

  @override
  Widget build(BuildContext context) {
    final badges = [
      BadgeData('SUPER ELITE', Icons.emoji_events, IbeereDesignTokens.accentYellow, true),
      BadgeData('SUPER POWER', Icons.auto_awesome, IbeereDesignTokens.primaryPurple, true),
      BadgeData('MAGICIAN', Icons.ice_skating, IbeereDesignTokens.primaryPink, false),
      BadgeData('QUIZ WARRIOR', Icons.rocket_launch, IbeereDesignTokens.accentCyan, true),
      BadgeData('CHAMPION', Icons.military_tech, IbeereDesignTokens.accentGreen, false),
      BadgeData('GENIUS', Icons.school, Color(0xFFF59E0B), true),
      BadgeData('LEGEND', Icons.stars, Color(0xFF8B5CF6), false),
      BadgeData('MASTER', Icons.workspace_premium, Color(0xFFEF4444), true),
      BadgeData('PRO PLAYER', Icons.videogame_asset, IbeereDesignTokens.accentCyan, false),
      BadgeData('SPEED KING', Icons.flash_on, IbeereDesignTokens.accentYellow, false),
      BadgeData('BRAIN BOSS', Icons.psychology, IbeereDesignTokens.primaryPurple, true),
      BadgeData('ACE', Icons.star, IbeereDesignTokens.primaryPink, false),
      BadgeData('SCHOLAR', Icons.menu_book, IbeereDesignTokens.accentGreen, false),
      BadgeData('WINNER', Icons.emoji_events, IbeereDesignTokens.accentYellow, true),
      BadgeData('EXPERT', Icons.verified, IbeereDesignTokens.primaryPurple, false),
      BadgeData('ACHIEVER', Icons.flag, IbeereDesignTokens.primaryPink, false),
    ];

    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: IbeereDesignTokens.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Badges Room', style: TextStyle(color: IbeereDesignTokens.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [IbeereDesignTokens.primaryPurple, IbeereDesignTokens.primaryPink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: IbeereDesignTokens.primaryPurple.withOpacity(0.3), blurRadius: 15, offset: Offset(0, 8))],
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    _buildAvatar(0, IbeereDesignTokens.accentYellow, 0),
                    _buildAvatar(1, IbeereDesignTokens.primaryPink, 20),
                    _buildAvatar(2, IbeereDesignTokens.accentCyan, 40),
                    _buildAvatar(3, IbeereDesignTokens.accentGreen, 60),
                  ],
                ),
                const SizedBox(width: 90),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Top Collectors', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('+5K', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: badges.length,
              itemBuilder: (context, index) {
                final badge = badges[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: badge.earned ? [BoxShadow(color: badge.color.withOpacity(0.2), blurRadius: 8, offset: Offset(0, 4))] : [],
                  ),
                  child: Opacity(
                    opacity: badge.earned ? 1.0 : 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: badge.color.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(badge.icon, size: 28, color: badge.color),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            badge.name,
                            style: TextStyle(color: IbeereDesignTokens.textPrimary, fontSize: 10, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(int index, Color color, double left) {
    return Positioned(
      left: left,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4)],
        ),
        child: Icon(Icons.person, size: 20, color: Colors.white),
      ),
    );
  }
}

class BadgeData {
  final String name;
  final IconData icon;
  final Color color;
  final bool earned;

  BadgeData(this.name, this.icon, this.color, this.earned);
}

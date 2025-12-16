import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class ReferralRewardsScreen extends StatelessWidget {
  const ReferralRewardsScreen({super.key});

  static const String routeName = '/referral-rewards';

  @override
  Widget build(BuildContext context) {
    const referralCode = '12345678';

    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: IbeereDesignTokens.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Refer & Earn', style: TextStyle(color: IbeereDesignTokens.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [IbeereDesignTokens.primaryPurple, IbeereDesignTokens.primaryPink],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: IbeereDesignTokens.primaryPurple.withOpacity(0.3), blurRadius: 20, offset: Offset(0, 10))],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.campaign, color: Colors.white, size: 32),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Refer your friends &\nEarn Commissions',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(top: 10, right: 20, child: _DecorativeCircle(color: Colors.white.withOpacity(0.1), size: 60)),
                Positioned(bottom: 10, left: 30, child: _DecorativeSquare(color: Colors.white.withOpacity(0.1), size: 40)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(8, (index) => _buildAvatarCircle(index)),
                  ),
                  const SizedBox(height: 24),
                  Text('Your Referral Code', style: TextStyle(color: IbeereDesignTokens.textSecondary, fontSize: 14)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: referralCode.split('').map((digit) => Container(
                      width: 40,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: IbeereDesignTokens.primaryPurple, width: 2),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                      ),
                      child: Center(child: Text(digit, style: TextStyle(color: IbeereDesignTokens.primaryPurple, fontSize: 20, fontWeight: FontWeight.bold))),
                    )).toList(),
                  ),
                  const SizedBox(height: 16),
                  TextButton.icon(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: referralCode));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Code copied!')));
                    },
                    icon: Icon(Icons.copy, size: 16),
                    label: Text('Click to copy Code'),
                    style: TextButton.styleFrom(foregroundColor: IbeereDesignTokens.primaryPurple),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: IbeereDesignTokens.accentYellow.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.stars, size: 48, color: IbeereDesignTokens.accentYellow),
                        const SizedBox(height: 12),
                        Text('500 Kauris', style: TextStyle(color: IbeereDesignTokens.textPrimary, fontSize: 28, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('Reward for each referral', style: TextStyle(color: IbeereDesignTokens.textSecondary, fontSize: 14)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: _buildRewardCard('You will get', '500 Kauris', IbeereDesignTokens.primaryPurple)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildRewardCard('They will get', '500 Kauris', IbeereDesignTokens.primaryPink)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: IbeereDesignTokens.primaryPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.share, size: 20),
                        const SizedBox(width: 8),
                        Text('Share now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
                    child: Text('How it works? Steps', style: TextStyle(color: IbeereDesignTokens.primaryPurple, decoration: TextDecoration.underline)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarCircle(int index) {
    final colors = [IbeereDesignTokens.primaryPurple, IbeereDesignTokens.primaryPink, IbeereDesignTokens.accentGreen, IbeereDesignTokens.accentYellow];
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: colors[index % colors.length].withOpacity(0.2),
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
      ),
      child: Icon(Icons.person, size: 20, color: colors[index % colors.length]),
    );
  }

  Widget _buildRewardCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(color: IbeereDesignTokens.textSecondary, fontSize: 12)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
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
  Widget build(BuildContext context) => Container(width: size, height: size, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)));
}

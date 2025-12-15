import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/design_tokens.dart';
import 'package:flutterquiz/ui/widgets/ibeere_buttons.dart';

class ScratchRewardScreen extends StatefulWidget {
  const ScratchRewardScreen({super.key});

  @override
  State<ScratchRewardScreen> createState() => _ScratchRewardScreenState();
}

class _ScratchRewardScreenState extends State<ScratchRewardScreen> {
  bool _isScratched = false;
  final List<int> _rewards = [50, 100, 200, 150, 75, 250, 500, 300];
  late int _selectedReward;

  @override
  void initState() {
    super.initState();
    _selectedReward = _rewards[(DateTime.now().millisecond % _rewards.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.background,
      appBar: AppBar(
        backgroundColor: DesignTokens.background,
        elevation: 0,
        title: Text(
          'Scratch Card',
          style: TextStyle(
            color: DesignTokens.primary,
            fontWeight: DesignTokens.fontWeightBold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: DesignTokens.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: DesignTokens.spaceLg),
            Text(
              'You Won!',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: DesignTokens.primary,
                fontWeight: DesignTokens.fontWeightBold,
              ),
            ),
            const SizedBox(height: DesignTokens.spaceSm),
            Text(
              'Scratch the card below to reveal your reward',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: DesignTokens.spaceXxl),

            // Scratch Card
            Center(
              child: GestureDetector(
                onTap: _isScratched
                    ? null
                    : () => setState(() => _isScratched = true),
                child: Container(
                  width: 280,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _isScratched
                          ? [Colors.green[400]!, Colors.green[600]!]
                          : [Colors.orange, Colors.orange[700]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(DesignTokens.radiusMd),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Reward
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '🎁',
                            style: TextStyle(fontSize: 48),
                          ),
                          const SizedBox(height: DesignTokens.spaceMd),
                          const Text(
                            'You Won',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: DesignTokens.fontSizeBase,
                              fontWeight: DesignTokens.fontWeightMedium,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$_selectedReward coins',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: DesignTokens.fontSizeXxl,
                              fontWeight: DesignTokens.fontWeightBold,
                            ),
                          ),
                        ],
                      ),

                      // Scratch overlay
                      if (!_isScratched)
                        Container(
                          width: 280,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(DesignTokens.radiusMd),
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.touch_app_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(height: DesignTokens.spaceMd),
                                Text(
                                  'Tap to Scratch',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: DesignTokens.fontSizeBase,
                                    fontWeight: DesignTokens.fontWeightMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: DesignTokens.spaceXxl),

            if (_isScratched) ...[
              Container(
                padding: const EdgeInsets.all(DesignTokens.spaceMd),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMd),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 32),
                    const SizedBox(height: DesignTokens.spaceSm),
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: DesignTokens.fontSizeBase,
                        fontWeight: DesignTokens.fontWeightBold,
                        color: Colors.green[700],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$_selectedReward coins have been added to your wallet',
                      style: TextStyle(
                        fontSize: DesignTokens.fontSizeSm,
                        color: Colors.green[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: DesignTokens.spaceXxl),
              IbeerePrimaryButton(
                label: 'Claim Reward',
                isFullWidth: true,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$_selectedReward coins claimed!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}



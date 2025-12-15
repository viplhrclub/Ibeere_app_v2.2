import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_buttons.dart';

class LanguageThemeSelectionScreen extends StatefulWidget {
  const LanguageThemeSelectionScreen({super.key});

  static const String routeName = '/language-theme-selection';

  @override
  State<LanguageThemeSelectionScreen> createState() =>
      _LanguageThemeSelectionScreenState();
}

class _LanguageThemeSelectionScreenState
    extends State<LanguageThemeSelectionScreen> {
  ThemeMode _selectedTheme = ThemeMode.light;
  int _selectedColorIndex = 0;

  final List<Color> _primaryColors = [
    const Color(0xFF6B7280),
    const Color(0xFFEF4444),
    const Color(0xFF8B5CF6),
    const Color(0xFF92400E),
    const Color(0xFF1E3A8A),
    const Color(0xFF991B1B),
    const Color(0xFF6B21A8),
    const Color(0xFF155E75),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildThemeSection(),
                      const SizedBox(height: 48),
                      _buildColorSection(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              IbeereButton(
                text: 'Continue',
                onPressed: () {},
                variant: IbeereButtonVariant.primary,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your Theme',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: IbeereDesignTokens.textPrimary,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _buildThemeOption(
                'LIGHT',
                ThemeMode.light,
                _buildLightPhoneMockup(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildThemeOption(
                'DARK',
                ThemeMode.dark,
                _buildDarkPhoneMockup(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildThemeOption(
                'SYSTEM',
                ThemeMode.system,
                _buildSystemIcon(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThemeOption(String label, ThemeMode mode, Widget icon) {
    final isSelected = _selectedTheme == mode;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTheme = mode;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? IbeereDesignTokens.primaryPurple : const Color(0xFFE5E7EB),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: IbeereDesignTokens.primaryPurple.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Center(child: icon),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? IbeereDesignTokens.primaryPurple
                    : IbeereDesignTokens.textSecondary,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(height: 8),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: IbeereDesignTokens.primaryPurple,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLightPhoneMockup() {
    return Container(
      width: 60,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Container(
              height: 4,
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(4),
                      ),
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

  Widget _buildDarkPhoneMockup() {
    return Container(
      width: 60,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF374151), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Container(
              height: 4,
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xFF4B5563),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF374151),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF374151),
                        borderRadius: BorderRadius.circular(4),
                      ),
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

  Widget _buildSystemIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF1E3A8A),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF1E3A8A),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }

  Widget _buildColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your Primary Color',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: IbeereDesignTokens.textPrimary,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_primaryColors.length, (index) {
            return _buildColorOption(index);
          }),
        ),
      ],
    );
  }

  Widget _buildColorOption(int index) {
    final isSelected = _selectedColorIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColorIndex = index;
        });
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: _primaryColors[index],
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: _primaryColors[index].withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 24,
              )
            : null,
      ),
    );
  }
}

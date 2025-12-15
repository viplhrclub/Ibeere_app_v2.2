import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_buttons.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_inputs.dart';

class SignUpProfileScreen extends StatefulWidget {
  const SignUpProfileScreen({super.key});

  static const String routeName = '/sign-up-profile';

  @override
  State<SignUpProfileScreen> createState() => _SignUpProfileScreenState();
}

class _SignUpProfileScreenState extends State<SignUpProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  int _selectedAvatarIndex = -1;
  bool _hasInvitationCode = false;

  final List<Color> _avatarColors = [
    const Color(0xFF7DD3FC),
    const Color(0xFF1E293B),
    const Color(0xFFFFDDDD),
    const Color(0xFF86EFAC),
    const Color(0xFF4F46E5),
    const Color(0xFF6B7280),
    const Color(0xFFE0E7FF),
    const Color(0xFFFDE68A),
    const Color(0xFFFAE8FF),
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              _buildGalleryButton(),
              const SizedBox(height: 32),
              _buildAvatarSection(),
              const SizedBox(height: 40),
              _buildNameInput(),
              const SizedBox(height: 32),
              _buildInvitationCodeToggle(),
              if (_hasInvitationCode) ...[
                const SizedBox(height: 16),
                _buildReferralCodeInput(),
              ],
              const SizedBox(height: 48),
              _buildContinueButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            color: IbeereDesignTokens.textSecondary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            'Choose image from Gallery',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: IbeereDesignTokens.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Column(
      children: [
        Text(
          'Or Select Avatar',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: IbeereDesignTokens.textTertiary,
          ),
        ),
        const SizedBox(height: 24),
        Stack(
          children: [
            _buildAvatarGrid(),
            _buildDecorativeCircles(),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatarGrid() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: List.generate(8, (index) {
        return _buildAvatarOption(index);
      }),
    );
  }

  Widget _buildAvatarOption(int index) {
    final isSelected = _selectedAvatarIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAvatarIndex = index;
        });
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: _avatarColors[index],
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? IbeereDesignTokens.primaryPurple
                : Colors.transparent,
            width: 3,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: IbeereDesignTokens.primaryPurple.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.person,
            size: 48,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

  Widget _buildDecorativeCircles() {
    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 40,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.primaryPurple.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.primaryPurple.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNameInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: _nameController,
        style: TextStyle(
          fontSize: 16,
          color: IbeereDesignTokens.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: 'Enter your name',
          hintStyle: TextStyle(
            fontSize: 16,
            color: IbeereDesignTokens.textTertiary,
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.person_outline,
            color: IbeereDesignTokens.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildInvitationCodeToggle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.card_giftcard_outlined,
            color: IbeereDesignTokens.textSecondary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'I have an invitation Code',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: IbeereDesignTokens.textPrimary,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: _hasInvitationCode,
              onChanged: (value) {
                setState(() {
                  _hasInvitationCode = value;
                });
              },
              activeColor: IbeereDesignTokens.primaryPurple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferralCodeInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: _referralController,
        style: TextStyle(
          fontSize: 16,
          color: IbeereDesignTokens.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: 'Enter referral Code here',
          hintStyle: TextStyle(
            fontSize: 16,
            color: IbeereDesignTokens.textTertiary,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildButtonDecorativeShapes(),
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                IbeereDesignTokens.primaryRed,
                const Color(0xFFDC2626),
              ],
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: IbeereDesignTokens.primaryRed.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonDecorativeShapes() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: Stack(
        children: [
          Positioned(
            left: 30,
            top: 10,
            child: _buildMiniShape(12, Colors.white, ShapeType.diamond),
          ),
          Positioned(
            left: 50,
            top: 35,
            child: _buildMiniShape(8, Colors.white, ShapeType.circle),
          ),
          Positioned(
            right: 40,
            top: 8,
            child: _buildMiniShape(10, Colors.white, ShapeType.square),
          ),
          Positioned(
            right: 60,
            bottom: 12,
            child: _buildMiniShape(10, Colors.white, ShapeType.circle, outlined: true),
          ),
          Positioned(
            right: 100,
            top: 20,
            child: _buildMiniShape(8, Colors.white, ShapeType.triangle),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniShape(double size, Color color, ShapeType shape, {bool outlined = false}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : color.withOpacity(0.3),
        shape: shape == ShapeType.circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: shape == ShapeType.square ? BorderRadius.circular(2) : null,
        border: outlined ? Border.all(color: color.withOpacity(0.3), width: 1.5) : null,
      ),
    );
  }
}

enum ShapeType { circle, square, triangle, diamond }

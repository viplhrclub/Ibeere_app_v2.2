import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';
import 'package:flutterquiz/features/in_app_purchase/cubits/razorpay_payment_cubit.dart';
import 'package:flutterquiz/features/in_app_purchase/cubits/razorpay_payment_state.dart';
import 'package:flutterquiz/features/in_app_purchase/services/moneroo_payment_service.dart';
import 'package:flutterquiz/features/in_app_purchase/services/razorpay_payment_service.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_buttons.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_cards.dart';
import 'package:url_launcher/url_launcher.dart';

class MonerooPaymentIntegrationWidget extends StatefulWidget {
  const MonerooPaymentIntegrationWidget({super.key});

  @override
  State<MonerooPaymentIntegrationWidget> createState() =>
      _MonerooPaymentIntegrationWidgetState();
}

class _MonerooPaymentIntegrationWidgetState
    extends State<MonerooPaymentIntegrationWidget> {
  final monerooService = MonerooPaymentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      appBar: AppBar(
        title: const Text('Buy Kauris'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: IbeereDesignTokens.textPrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                'Select a Package',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: IbeereDesignTokens.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              ...GenericPaymentService.coinPackages.map((package) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildCoinPackageCard(package),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoinPackageCard(CoinPackage package) {
    final isBestValue = package == GenericPaymentService.getBestValuePackage();

    return GestureDetector(
      onTap: () => _handlePurchase(package),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isBestValue
                    ? [IbeereDesignTokens.primaryPurple, const Color(0xFF8B5CF6)]
                    : [Colors.white, Colors.white],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isBestValue ? Colors.transparent : const Color(0xFFE5E7EB),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: (isBestValue
                          ? IbeereDesignTokens.primaryPurple
                          : Colors.black)
                      .withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isBestValue
                        ? Colors.white.withOpacity(0.2)
                        : IbeereDesignTokens.accentYellow.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.stars_rounded,
                    size: 40,
                    color: isBestValue ? Colors.white : IbeereDesignTokens.accentYellow,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${package.coins} Kauris',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: isBestValue ? Colors.white : IbeereDesignTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (package.discountPercent > 0)
                        Text(
                          'Save ${package.discountPercent}%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isBestValue
                                ? Colors.white.withOpacity(0.9)
                                : IbeereDesignTokens.accentGreen,
                          ),
                        ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (package.discountPercent > 0)
                      Text(
                        package.priceString,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isBestValue
                              ? Colors.white.withOpacity(0.7)
                              : IbeereDesignTokens.textTertiary,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Text(
                      package.finalPriceString,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: isBestValue ? Colors.white : IbeereDesignTokens.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isBestValue)
            Positioned(
              top: -8,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      IbeereDesignTokens.primaryPink,
                      IbeereDesignTokens.primaryRed,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: IbeereDesignTokens.primaryPink.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'BEST VALUE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _handlePurchase(CoinPackage package) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );

      final paymentResponse = await monerooService.createPayment(
        amount: package.finalPrice.toString(),
        currency: package.currency,
        description: '${package.coins} Kauris Package',
        customerEmail: 'user@example.com',
        customerName: 'Ibeere User',
        customerPhone: '+1234567890',
        orderId: 'ORDER_${DateTime.now().millisecondsSinceEpoch}',
      );

      Navigator.pop(context);

      if (paymentResponse.success && paymentResponse.paymentUrl != null) {
        final uri = Uri.parse(paymentResponse.paymentUrl!);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          
          if (mounted) {
            _showPaymentPendingDialog(paymentResponse.transactionId!);
          }
        } else {
          if (mounted) {
            _showErrorDialog('Unable to open payment page');
          }
        }
      } else {
        if (mounted) {
          _showErrorDialog(paymentResponse.error ?? 'Payment creation failed');
        }
      }
    } catch (e) {
      Navigator.pop(context);
      if (mounted) {
        _showErrorDialog('Error: $e');
      }
    }
  }

  void _showPaymentPendingDialog(String transactionId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Payment Processing'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Complete the payment in your browser.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                await _verifyPayment(transactionId);
              },
              child: const Text('I\'ve Completed Payment'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _verifyPayment(String transactionId) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );

    final verification = await monerooService.verifyPayment(
      transactionId: transactionId,
    );

    Navigator.pop(context);

    if (verification.verified) {
      _showSuccessDialog();
    } else {
      _showErrorDialog(
        'Payment not yet confirmed. Status: ${verification.status}',
      );
    }
  }

  void _showSuccessDialog() {
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
                color: IbeereDesignTokens.accentGreen.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                color: IbeereDesignTokens.accentGreen,
                size: 60,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment Successful!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your Kauris have been added to your account.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            IbeereButton(
              text: 'Done',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              variant: IbeereButtonVariant.primary,
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Payment Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

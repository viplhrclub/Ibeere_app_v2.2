import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutterquiz/features/in_app_purchase/services/razorpay_payment_service.dart';

class MonerooPaymentService implements PaymentGatewayService {
  factory MonerooPaymentService() {
    return _instance;
  }

  MonerooPaymentService._internal();
  static final MonerooPaymentService _instance = MonerooPaymentService._internal();

  static const String _apiKey = 'pvk_q6c4gf|01K9SV9DQJFT2W4MXKZ78PF71V';
  static const String _webhookSecret = 'ih_01KCE1X626T22W0XFT708RG91G_gpxi1kawmqsw_W5LT1IlQkCVu';
  static const String _webhookUrl = 'https://hooks.moneroo.io/ho_ku4nlfuqoxa5';
  static const String _baseUrl = 'https://api.moneroo.io/v1';

  @override
  Future<PaymentResponse> createPayment({
    required String amount,
    required String currency,
    required String description,
    required String customerEmail,
    required String customerName,
    required String customerPhone,
    required String orderId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/payments'),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'amount': double.parse(amount).toInt(),
          'currency': currency.toUpperCase(),
          'description': description,
          'return_url': 'ibeere://payment/success',
          'cancel_url': 'ibeere://payment/cancel',
          'customer': {
            'email': customerEmail,
            'first_name': customerName.split(' ').first,
            'last_name': customerName.split(' ').length > 1 ? customerName.split(' ').last : '',
            'phone': customerPhone,
          },
          'metadata': {
            'order_id': orderId,
            'app': 'ibeere',
          },
        }),
      );

      log(name: 'Moneroo Payment', 'Response: ${response.statusCode}');
      log(name: 'Moneroo Payment', 'Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return PaymentResponse(
          success: true,
          transactionId: data['id']?.toString(),
          paymentUrl: data['checkout_url']?.toString(),
        );
      } else {
        final errorData = jsonDecode(response.body);
        return PaymentResponse(
          success: false,
          error: errorData['message'] ?? 'Payment creation failed',
        );
      }
    } catch (e) {
      log(name: 'Moneroo Payment Error', e.toString());
      return PaymentResponse(
        success: false,
        error: 'Payment creation failed: $e',
      );
    }
  }

  @override
  Future<PaymentVerificationResponse> verifyPayment({
    required String transactionId,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/payments/$transactionId'),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Accept': 'application/json',
        },
      );

      log(name: 'Moneroo Verify', 'Response: ${response.statusCode}');
      log(name: 'Moneroo Verify', 'Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final status = data['status']?.toString().toLowerCase() ?? 'unknown';
        
        return PaymentVerificationResponse(
          verified: status == 'paid' || status == 'succeeded',
          status: status,
        );
      } else {
        return PaymentVerificationResponse(
          verified: false,
          status: 'failed',
          error: 'Verification request failed',
        );
      }
    } catch (e) {
      log(name: 'Moneroo Verify Error', e.toString());
      return PaymentVerificationResponse(
        verified: false,
        status: 'error',
        error: 'Verification failed: $e',
      );
    }
  }

  Future<bool> refundPayment({
    required String transactionId,
    required String amount,
    String? reason,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/refunds'),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'payment_id': transactionId,
          'amount': double.parse(amount).toInt(),
          'reason': reason ?? 'Customer requested refund',
        }),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      log(name: 'Moneroo Refund Error', e.toString());
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getPaymentHistory({
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/payments?limit=$limit&offset=$offset'),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['data'] ?? []);
      }
      return [];
    } catch (e) {
      log(name: 'Moneroo History Error', e.toString());
      return [];
    }
  }

  @override
  void dispose() {
  }

  static String getWebhookUrl() => _webhookUrl;
  static String getWebhookSecret() => _webhookSecret;
}

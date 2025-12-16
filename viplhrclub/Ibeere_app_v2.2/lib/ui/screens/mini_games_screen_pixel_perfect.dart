import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MiniGamesScreen extends StatefulWidget {
  const MiniGamesScreen({super.key});

  @override
  State<MiniGamesScreen> createState() => _MiniGamesScreenState();
}

class _MiniGamesScreenState extends State<MiniGamesScreen> {
  List<Map<String, dynamic>> _games = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchGames();
  }

  Future<void> _fetchGames() async {
    try {
      final response = await http.post(
        Uri.parse('https://api.ibeere.fun/api/get_mini_games'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['error'] == false && data['data'] != null) {
          setState(() {
            _games = List<Map<String, dynamic>>.from(data['data']);
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to load games';
        _isLoading = false;
      });
    }
  }

  Color _getGradientColor(int index) {
    final gradients = [
      [const Color(0xFF6366F1), const Color(0xFFA855F7)],
      [const Color(0xFFEC4899), const Color(0xFFF472B6)],
      [const Color(0xFF8B5CF6), const Color(0xFFC084FC)],
      [const Color(0xFF14B8A6), const Color(0xFF06B6D4)],
      [const Color(0xFFF59E0B), const Color(0xFFFBBF24)],
      [const Color(0xFFEF4444), const Color(0xFFF87171)],
      [const Color(0xFF10B981), const Color(0xFF34D399)],
      [const Color(0xFF06B6D4), const Color(0xFF22D3EE)],
    ];
    return gradients[index % gradients.length][0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2937)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Mini Games',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : RefreshIndicator(
                  onRefresh: _fetchGames,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.95,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: _games.length,
                      itemBuilder: (context, index) {
                        final game = _games[index];
                        final gradient = _getGradientColor(index);
                        
                        return InkWell(
                          onTap: () {
                            // Launch game URL
                            if (game['url'] != null && game['url'].toString().isNotEmpty) {
                              // Use url_launcher package
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  gradient,
                                  gradient.withOpacity(0.7),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: gradient.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: -20,
                                  right: -20,
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 64,
                                        height: 64,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.25),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: game['image'] != null
                                              ? Image.network(
                                                  game['image'],
                                                  width: 40,
                                                  height: 40,
                                                  errorBuilder: (_, __, ___) => const Icon(
                                                    Icons.games_outlined,
                                                    color: Colors.white,
                                                    size: 32,
                                                  ),
                                                )
                                              : const Icon(
                                                  Icons.games_outlined,
                                                  color: Colors.white,
                                                  size: 32,
                                                ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        game['title'] ?? 'Game',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          height: 1.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
    );
  }
}

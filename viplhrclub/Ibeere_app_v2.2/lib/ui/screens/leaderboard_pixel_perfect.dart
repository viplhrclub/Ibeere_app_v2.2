import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> _dailyLeaderboard = [];
  List<Map<String, dynamic>> _weeklyLeaderboard = [];
  List<Map<String, dynamic>> _monthlyLeaderboard = [];
  bool _isLoading = true;
  String _selectedPeriod = 'Daily';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchLeaderboards();
  }

  Future<void> _fetchLeaderboards() async {
    try {
      final responses = await Future.wait([
        http.post(Uri.parse('https://api.ibeere.fun/api/get_daily_leaderboard')),
        http.post(Uri.parse('https://api.ibeere.fun/api/get_weekly_leaderboard')),
        http.post(Uri.parse('https://api.ibeere.fun/api/get_monthly_leaderboard')),
      ]);

      setState(() {
        if (responses[0].statusCode == 200) {
          final data = json.decode(responses[0].body);
          if (data['error'] == false) {
            _dailyLeaderboard = List<Map<String, dynamic>>.from(data['data'] ?? []);
          }
        }
        if (responses[1].statusCode == 200) {
          final data = json.decode(responses[1].body);
          if (data['error'] == false) {
            _weeklyLeaderboard = List<Map<String, dynamic>>.from(data['data'] ?? []);
          }
        }
        if (responses[2].statusCode == 200) {
          final data = json.decode(responses[2].body);
          if (data['error'] == false) {
            _monthlyLeaderboard = List<Map<String, dynamic>>.from(data['data'] ?? []);
          }
        }
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<Map<String, dynamic>> _getCurrentLeaderboard() {
    switch (_tabController.index) {
      case 0:
        return _dailyLeaderboard;
      case 1:
        return _weeklyLeaderboard;
      case 2:
        return _monthlyLeaderboard;
      default:
        return [];
    }
  }

  Widget _buildPodium(List<Map<String, dynamic>> topThree) {
    if (topThree.length < 3) return const SizedBox.shrink();

    return Container(
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildPodiumUser(topThree.length > 1 ? topThree[1] : null, 2, 120, const Color(0xFFC0C0C0)),
          const SizedBox(width: 16),
          _buildPodiumUser(topThree[0], 1, 160, const Color(0xFFFFD700)),
          const SizedBox(width: 16),
          _buildPodiumUser(topThree.length > 2 ? topThree[2] : null, 3, 100, const Color(0xFFCD7F32)),
        ],
      ),
    );
  }

  Widget _buildPodiumUser(Map<String, dynamic>? user, int rank, double height, Color medalColor) {
    if (user == null) return const SizedBox(width: 100);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: medalColor, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: medalColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: user['profile'] != null
                    ? Image.network(
                        user['profile'],
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: const Color(0xFF6366F1),
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                      )
                    : Container(
                        color: const Color(0xFF6366F1),
                        child: const Icon(Icons.person, color: Colors.white, size: 32),
                      ),
              ),
            ),
            Positioned(
              bottom: -5,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: medalColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    rank.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: 100,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                medalColor.withOpacity(0.8),
                medalColor.withOpacity(0.5),
              ],
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user['name'] ?? 'Player',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${user['score'] ?? 0}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'points',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2937)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Leaderboard',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) => setState(() {}),
          labelColor: const Color(0xFF6366F1),
          unselectedLabelColor: const Color(0xFF9CA3AF),
          indicatorColor: const Color(0xFF6366F1),
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Daily'),
            Tab(text: 'Weekly'),
            Tab(text: 'Monthly'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetchLeaderboards,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    _buildPodium(_getCurrentLeaderboard().take(3).toList()),
                    const SizedBox(height: 24),
                    Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        itemCount: _getCurrentLeaderboard().skip(3).length,
                        separatorBuilder: (_, __) => const Divider(height: 24),
                        itemBuilder: (context, index) {
                          final user = _getCurrentLeaderboard().skip(3).toList()[index];
                          final rank = index + 4;

                          return Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    rank.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF6B7280),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: const Color(0xFF6366F1),
                                child: user['profile'] != null
                                    ? ClipOval(
                                        child: Image.network(
                                          user['profile'],
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) => const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : const Icon(Icons.person, color: Colors.white),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  user['name'] ?? 'Player',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF1F2937),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                '${user['score'] ?? 0}',
                                style: const TextStyle(
                                  color: Color(0xFF6366F1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

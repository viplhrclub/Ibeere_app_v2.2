import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';
import 'package:flutterquiz/services/ibeere_api_service.dart';

class CategoriesApiScreen extends StatefulWidget {
  const CategoriesApiScreen({super.key});

  static const String routeName = '/categories-api';

  @override
  State<CategoriesApiScreen> createState() => _CategoriesApiScreenState();
}

class _CategoriesApiScreenState extends State<CategoriesApiScreen> {
  List<dynamic>? _categories;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final categories = await IbeereApiService.getCategories(languageId: '18');
      
      if (categories != null) {
        setState(() {
          _categories = categories;
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load categories';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: IbeereDesignTokens.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Categories (API)',
          style: TextStyle(
            color: IbeereDesignTokens.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: IbeereDesignTokens.primaryPurple),
            onPressed: _loadCategories,
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(IbeereDesignTokens.primaryPurple),
              ),
            )
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 64, color: IbeereDesignTokens.primaryRed),
                      const SizedBox(height: 16),
                      Text(
                        _error!,
                        style: TextStyle(color: IbeereDesignTokens.textSecondary),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _loadCategories,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: IbeereDesignTokens.primaryPurple,
                        ),
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _categories == null || _categories!.isEmpty
                  ? Center(
                      child: Text(
                        'No categories available',
                        style: TextStyle(color: IbeereDesignTokens.textSecondary),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: _categories!.length,
                      itemBuilder: (context, index) {
                        final category = _categories![index];
                        return _buildCategoryCard(category);
                      },
                    ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    final categoryName = category['category_name'] ?? 'Unknown';
    final maxLevel = category['maxlevel'] ?? '0';
    final noOf = category['no_of'] ?? '0';
    
    final colors = [
      IbeereDesignTokens.primaryPurple,
      IbeereDesignTokens.primaryPink,
      IbeereDesignTokens.accentGreen,
      IbeereDesignTokens.accentYellow,
      IbeereDesignTokens.accentCyan,
    ];
    final color = colors[int.parse(category['id'] ?? '0') % colors.length];

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected: $categoryName')),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.category, size: 36, color: color),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: IbeereDesignTokens.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.quiz, size: 14, color: IbeereDesignTokens.textSecondary),
                const SizedBox(width: 4),
                Text(
                  '$noOf questions',
                  style: TextStyle(
                    color: IbeereDesignTokens.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
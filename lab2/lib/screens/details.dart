import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../services/api.dart';
import '../widgets/meal_grid.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final Category category;

  late List<Meal> _meals;
  List<Meal> _filteredMeals = [];

  bool _isLoading = true;
  bool _isSearching = false;
  String _searchQuery = '';

  final Api _apiService = Api();
  final TextEditingController _searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = ModalRoute.of(context)!.settings.arguments as Category;
    _loadMealList();
  }

  void _loadMealList() async {
    final list = await _apiService.loadMealList(name: category.name);

    setState(() {
      _meals = list;
      _filteredMeals = list;
      _isLoading = false;
    });
  }

  void _filterMeals(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredMeals = _meals;
      } else {
        _filteredMeals = _meals
            .where((m) => m.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> _searchMealByName(String name) async {
    if (name.isEmpty) return;

    setState(() => _isSearching = true);

    final meal = await _apiService.searchMealByName(name);

    setState(() {
      _isSearching = false;
      if (meal != null) {
        _filteredMeals = [meal];
      } else {
        _filteredMeals = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Meals in category: ${category.name}"),
      ),

      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search meals by name...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value);
                _filterMeals(value);
              },
            ),
          ),

          Expanded(
            child: _filteredMeals.isEmpty && _searchQuery.isNotEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search_off,
                    size: 64,
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No meals found',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),

                  TextButton(
                    onPressed: _isSearching
                        ? null
                        : () async {
                      await _searchMealByName(_searchQuery);
                    },
                    child: _isSearching
                        ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                        : const Text('Search in API'),
                  ),
                ],
              ),
            )
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: MealGrid(meal: _filteredMeals),
            ),
          ),
        ],
      ),
    );
  }
}
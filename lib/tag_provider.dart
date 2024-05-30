import 'package:flutter/material.dart';
import 'tag_service.dart';

class TagProvider with ChangeNotifier {
  List<String> _tags = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<String> get tags => _tags;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final TagService _tagService = TagService();

  TagProvider() {
    fetchTags();
  }

  Future<void> fetchTags() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _tags = await _tagService.fetchTags();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

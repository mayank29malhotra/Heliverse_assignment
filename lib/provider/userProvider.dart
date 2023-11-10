import 'dart:convert';
import '../Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/UserModel.dart';
import '../widgets/alert_dialog.dart';
import '../screens/TeamScreen.dart';

class UserListProvider with ChangeNotifier {
  List<User> users = [];
  List<User> _filteredUsers = [];
  bool isLoading = true;
  bool availableFilter = false;
  String selectedGender = '';
  String selectedDomain = '';

  List<String> get genderList =>
      users.map((user) => user.gender).toSet().toList();

  List<String> get domainList =>
      users.map((user) => user.domain).toSet().toList();

  List<User> getFilteredUser() {
    return _filteredUsers;
  }

  void filterUsers(String query) {
    _filteredUsers = users
        .where((user) =>
    (user.firstName.toLowerCase().contains(query.toLowerCase()) ||
        user.lastName.toLowerCase().contains(query.toLowerCase())) &&
        (!availableFilter || user.available) &&
        (selectedGender.isEmpty || user.gender == selectedGender) &&
        (selectedDomain.isEmpty || user.domain == selectedDomain))
        .toList();
    notifyListeners();
  }

  void selectGender(String value) {
    selectedGender = value;
    filterUsers('');
  }

  void selectDomain(String value) {
    selectedDomain = value;
    filterUsers('');
  }

  void toggleAvailableFilter() {
    availableFilter = !availableFilter;
    filterUsers('');
  }

  Future<void> fetchUsers() async {
    print('fetching start');
    try {
      String jsonString =
      await rootBundle.loadString('assets/heliverse_mock_data.json');
      List<dynamic> data = json.decode(jsonString);
      users = data.map((user) => User.fromJson(user)).toList();
      _filteredUsers = List.from(users);
      print('fetching complete');
      isLoading = false; // Set loading flag to false after data is loaded
      notifyListeners();
    } catch (error) {
      print('Failed to load users: $error');
      // Handle the error as needed
    }
  }

  void addToTeam(User user, BuildContext context) {
    List<User> teamMembers = selectedUsers;
    // Check if users from all unique domains are added
    int totalUniqueDomains = users.map((user) => user.domain).toSet().length;
    Set<String> uniqueDomains = teamMembers.map((user) => user.domain).toSet();
    int remainingDomains = totalUniqueDomains - uniqueDomains.length;

    // If users from all unique domains are added, navigate to the team screen
    if (remainingDomains == 0) {
      Navigator.push(
        // Assuming selectedUsers is available in your code
        context,
        MaterialPageRoute(builder: (context) => TeamScreen(teamMembers)),
      );
    } else {
      // Show a dialog when users from all unique domains are not added
      showAddToTeamDialog(totalUniqueDomains, remainingDomains, context);
    }
    notifyListeners();
  }
}


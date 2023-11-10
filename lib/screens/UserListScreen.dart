import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/userProvider.dart';
import '../models/UserModel.dart';
import '../widgets/CustomDropDown.dart';
import '../widgets/usercard.dart';
import '../Constants/constants.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        var userListProvider = UserListProvider();
        userListProvider.fetchUsers(); // Move fetchUsers here
        return userListProvider;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Management App'),
        ),
        body: Consumer<UserListProvider>(
          builder: (context, userListProvider, _) {
            return userListProvider.isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (value) {
                      userListProvider.filterUsers(value);
                    },
                    decoration: InputDecoration(
                      labelText: searchByNameLabel,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDropdown(
                      value: userListProvider.selectedGender,
                      items: userListProvider.genderList,
                      onChanged: (value) {
                        userListProvider.selectGender(value);
                      },
                    ),
                    CustomDropdown(
                      value: userListProvider.selectedDomain,
                      items: userListProvider.domainList,
                      onChanged: (value) {
                        userListProvider.selectDomain(value);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(availableText),
                      Checkbox(
                        value: userListProvider.availableFilter,
                        onChanged: (value) {
                          userListProvider.toggleAvailableFilter();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: 50),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: userListProvider.getFilteredUser().length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.75,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        User singleUser =
                        userListProvider.getFilteredUser()[index];
                        return UserCard(
                          singleUser: singleUser,
                          onAddToTeam: (user) {
                            userListProvider.addToTeam(user, context);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


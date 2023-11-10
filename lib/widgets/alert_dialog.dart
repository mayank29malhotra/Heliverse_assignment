import 'package:flutter/material.dart';
import '../Constants/constants.dart';

void showAddToTeamDialog(int totalUniqueDomains, int remainingDomains, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(addedToTeamTitle),
        content: Text(
          'Please add users from all unique domains to the team. \nTeam members left: $remainingDomains',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
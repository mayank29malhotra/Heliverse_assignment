import 'package:flutter/material.dart';
import '../models/UserModel.dart';
import '../Constants/constants.dart';

class UserCard extends StatelessWidget {
  final User singleUser;
  final Function(User) onAddToTeam;

  UserCard({required this.singleUser, required this.onAddToTeam});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.97,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(singleUser.avatar),
                radius: 25,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                children: [
                  Text(
                    "${singleUser.firstName}",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${singleUser.lastName}",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          singleUser.available
              ? SizedBox(
                  height: 35,
                  width: 135,
                  child: OutlinedButton(
                    onPressed: () {
                      onAddToTeam(singleUser);
                    },
                    child: const Text("Add to Team"),
                  ),
                )
              : const SizedBox(
                  height: 35,
                  width: 135,
                  child: Text(
                    'Not Available',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
        ],
      ),
    );
  }
}

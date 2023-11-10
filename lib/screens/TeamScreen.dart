import 'package:flutter/material.dart';
import '../models/UserModel.dart';
import 'package:flutter/services.dart';

class TeamScreen extends StatelessWidget {
  final List<User> teamMembers;

  TeamScreen(this.teamMembers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Details'),
      ),
      body: ListView.builder(
        itemCount: teamMembers.length,
        itemBuilder: (context, index) {
          User teamMember = teamMembers[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(teamMember.avatar),
                  radius: 30,
                ),
                title: Text(
                  '${teamMember.firstName} ${teamMember.lastName}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${teamMember.id}'),
                    Text('Gender: ${teamMember.gender}'),
                    Text('Domain: ${teamMember.domain}'),
                    Text('Email: ${teamMember.email}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

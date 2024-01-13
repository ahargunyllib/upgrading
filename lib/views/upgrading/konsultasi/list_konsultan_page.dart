import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upgrading/widgets/konsultan_card.dart';

import '../../../models/mentor_model.dart';
import '../../../services/mentor_service.dart';

class ListKonsultanPage extends StatelessWidget {
  const ListKonsultanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Object?>>(
      future: MentorService().getMentors(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Mentor> mentors = [];
          snapshot.data!.docs.forEach((element) {
            Mentor mentor = Mentor.fromMap(element.data() as Map<String, dynamic>, element.id);
            mentors.add(mentor);
          });
          return _buildListKonsultan(mentors);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      });
  }   
  
  Widget _buildListKonsultan(List<Mentor> mentors) {
    return ListView.builder(
      itemCount: mentors.length,
      padding: const EdgeInsets.symmetric(vertical: 4),
      itemBuilder: (context, index) {
        return KonsultanCard(mentor: mentors[index]);
      },
    );
  }
}

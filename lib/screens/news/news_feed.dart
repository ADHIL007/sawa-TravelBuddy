import 'package:flutter/material.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: const Center(
        child: Text('News Feed Screen'),
      ),
    );
  }
}
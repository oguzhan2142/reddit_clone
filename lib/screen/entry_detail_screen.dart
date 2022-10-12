import 'package:flutter/material.dart';
import 'package:reddit_clone/model/entry.dart';

class EntryDetailScreen extends StatelessWidget {
  final Entry entry;

  const EntryDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                entry.data?.thumbnail ?? '',
                width: double.infinity,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      entry.data?.title ?? '',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      entry.data?.selfText ?? '',
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

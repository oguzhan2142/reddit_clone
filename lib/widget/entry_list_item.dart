import 'package:flutter/material.dart';
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/model/entry.dart';

import '../screen/entry_detail_screen.dart';

class EntryListItem extends StatelessWidget {
  final Entry entry;
  const EntryListItem({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EntryDetailScreen(entry: entry),
          )),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                entry.data?.thumbnail ?? '',
                width: double.infinity,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  entry.data?.title ?? '',
                ),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.data?.selfText ?? '',
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: bourbon,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        entry.data?.ups?.toString() ?? '',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Text(
                    entry.data?.createdUtc.toString() ?? '',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

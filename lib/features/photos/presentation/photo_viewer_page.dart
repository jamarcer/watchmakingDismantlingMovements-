import 'dart:io';

import 'package:flutter/material.dart';

import '../domain/photo_asset.dart';

class PhotoViewerPage extends StatelessWidget {
  const PhotoViewerPage({
    super.key,
    required this.photo,
    required this.title,
    required this.isAnnotated,
  });

  final PhotoAsset photo;
  final String title;
  final bool isAnnotated;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Chip(
            avatar: Icon(
              isAnnotated ? Icons.draw_outlined : Icons.photo_outlined,
            ),
            label: Text(isAnnotated ? 'Anotada' : 'Original'),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.black,
    body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 5,
                child: Image.file(
                  File(photo.thumbnailPath),
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => const Icon(
                    Icons.broken_image_outlined,
                    color: Colors.white,
                    size: 72,
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  photo.relativePath,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

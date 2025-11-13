import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    // List of placeholder image URLs
    final List<String> imageUrls = [
      'https://via.placeholder.com/150/0000FF/808080?text=Image+1',
      'https://via.placeholder.com/150/FF0000/FFFFFF?text=Image+2',
      'https://via.placeholder.com/150/00FF00/000000?text=Image+3',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Image Gallery")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // 1. Use GridView to display images
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(imageUrls.length, (index) {
            return GestureDetector(
              // 2. Wrap each Image in a GestureDetector
              onTap: () {
                // 3. Show SnackBar on tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Image ${index + 1} tapped'),
                    duration: const Duration(seconds: 1),
                  ),
                );

                // Or simply print (for debugging)
                print('Image ${index + 1} tapped');
              },
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            );
          }),
        ),
      ),
    );
  }
}

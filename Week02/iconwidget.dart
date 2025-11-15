class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});
  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  // 1.2: State variable to track the current rating.
  int _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Rate this App", style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < _rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ),
              onPressed: () {
                setState(() {
                  _rating = index + 1;
                });
              },
            );
          }),
        ),
        Text("Your Rating: $_rating", style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

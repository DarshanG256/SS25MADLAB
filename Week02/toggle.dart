class ContentToggle extends StatefulWidget {
  const ContentToggle({super.key});
  @override
  State<ContentToggle> createState() => _ContentToggleState();
}
class _ContentToggleState extends State<ContentToggle> {
  // 1.3: State variable to toggle between short and full text.
  bool _showFullText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
            children: [
              const TextSpan(text: "Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications"),
              if (_showFullText)
                const TextSpan(
                  text: " from a single codebase for any web browser, Fuchsia, Android, iOS, Linux, macOS, and Windows. This allows developers to write the code once and deploy it on multiple platforms, saving significant time and resources.",
                  style: TextStyle(color: Colors.black54),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          child: Text(_showFullText ? "Read Less" : "Read More"),
          onPressed: () {
            setState(() {
              _showFullText = !_showFullText;
            });
          },
        ),
      ],
    );
  }
} 


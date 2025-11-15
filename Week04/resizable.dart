class DraggableNotesScreen extends StatefulWidget {
  const DraggableNotesScreen({super.key});

  @override
  State<DraggableNotesScreen> createState() => _DraggableNotesScreenState();
}

class _DraggableNotesScreenState extends State<DraggableNotesScreen> {
  final List<Widget> _notes = [];

  // Function to add a new note at a slightly random position.
  void _addNote() {
    setState(() {
      final random = Random();
      final initialOffset = Offset(
        50.0 + random.nextDouble() * 150,
        50.0 + random.nextDouble() * 200,
      );
      _notes.add(DraggableNote(key: UniqueKey(), initialOffset: initialOffset));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Notes')),
      body: Stack(children: _notes),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DraggableNote extends StatefulWidget {
  final Offset initialOffset;
  const DraggableNote({super.key, this.initialOffset = Offset.zero});

  @override
  State<DraggableNote> createState() => _DraggableNoteState();
}

class _DraggableNoteState extends State<DraggableNote> {
  // Controller to manage the text inside the note.
  final TextEditingController _textController = TextEditingController();

  late Offset _offset;
  double _scale = 1.0;
  late Offset _startDragOffset;
  late double _startScale;

  @override
  void initState() {
    super.initState();
    _offset = widget.initialOffset;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed.
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: GestureDetector(
        onScaleStart: (details) {
          _startDragOffset = details.focalPoint;
          _startScale = _scale;
        },
        onScaleUpdate: (details) {
          setState(() {
            final dragDelta = details.focalPoint - _startDragOffset;
            _offset += dragDelta;
            _startDragOffset = details.focalPoint;
            _scale = (_startScale * details.scale).clamp(0.5, 3.0);
          });
        },
        child: Transform.scale(
          scale: _scale,
          child: Container(
            width: 150,
            height: 150,
            padding: const EdgeInsets.all(8.0), // Padding for the text field
            decoration: BoxDecoration(
              color: Colors.yellow.shade200,
              boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black26)],
            ),
            // Replace the static Text widget with an editable TextField.
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Your note...',
                border: InputBorder.none, // Removes the underline
              ),
              maxLines: null, // Allows for multiple lines of text
              expands: true, // Makes the TextField fill the container
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
 


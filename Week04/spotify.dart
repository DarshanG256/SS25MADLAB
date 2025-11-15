: Spotify Album Page UI ---
class SpotifyScreen extends StatelessWidget {
  const SpotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Now Playing'),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://picsum.photos/id/1018/800',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: kToolbarHeight + 40),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black26,
                  child: Image.network('https://picsum.photos/id/1018/400', height: 250),
                ),
                const SizedBox(height: 20),
                const Text('Mountain Sunrise', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const Text('By Nature Sounds', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 20),
               
                // ================== FIX IS HERE ==================
                // Removed the 'const' keyword from this Row.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    IconButton(icon: Icon(Icons.shuffle), onPressed: null),
                    IconButton(icon: Icon(Icons.skip_previous), onPressed: null),
                    IconButton(icon: Icon(Icons.play_circle_fill, size: 60), onPressed: null),
                    IconButton(icon: Icon(Icons.skip_next), onPressed: null),
                    IconButton(icon: Icon(Icons.repeat), onPressed: null),
                  ],
                ),
                // ================ END OF FIX ================

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  separatorBuilder: (context, index) => const Divider(color: Colors.white24),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text('${index + 1}'),
                      title: Text('Track ${index + 1}'),
                      trailing: const Icon(Icons.more_vert),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

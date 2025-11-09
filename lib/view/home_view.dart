import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practice4/view/title_listview.dart';
import 'package:practice4/widget/card_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const _carouselSlides = [1, 2, 3, 4, 5];
  static const _sectionConfigs = [
    _HomeSectionConfig(title: 'categories', cardCount: 7),
    _HomeSectionConfig(title: 'categories', cardCount: 7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 16),
              const _SearchField(),
              const SizedBox(height: 16),
              _PromoCarousel(items: _carouselSlides),
              const SizedBox(height: 16),
              for (final section in _sectionConfigs) ...[
                TitleListView(
                  title: section.title,
                  cards: List.generate(
                    section.cardCount,
                    (_) => const CardWidget(),
                  ),
                  onSeeAll: () {},
                ),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _HomeBottomNavigationBar(),
    );
  }
}

class _HomeSectionConfig {
  const _HomeSectionConfig({
    required this.title,
    required this.cardCount,
  });

  final String title;
  final int cardCount;
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const _AppBarContent(),
    );
  }
}

class _AppBarContent extends StatelessWidget {
  const _AppBarContent();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://example.com/path/to/your/image.jpg',
        ),
      ),
      title: const Text(
        'Hello',
        style: TextStyle(
          fontSize: 13,
          color: Colors.black54,
        ),
      ),
      subtitle: const Text(
        'minato',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        hintText: 'Search here',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _PromoCarousel extends StatelessWidget {
  const _PromoCarousel({
    required this.items,
  });

  final List<int> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: items.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: Center(
                child: Text(
                  'slide $i',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class _HomeBottomNavigationBar extends StatelessWidget {
  const _HomeBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }
}

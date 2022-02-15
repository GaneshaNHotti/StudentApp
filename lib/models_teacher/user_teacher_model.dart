class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final User user1 = User(
  id: 0,
  name: '1MS19CS112',
  imageUrl: 'lib/assets/college.png',
  isOnline: true,
);

// USERS
final User user2 = User(
  id: 1,
  name: '1MS15IS667',
  imageUrl: 'lib/assets/college.png',
  isOnline: true,
);


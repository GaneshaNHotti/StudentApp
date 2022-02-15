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
final User DEPCSE = User(
  id: 0,
  name: 'DEPCSE',
  imageUrl: 'lib/assets/college.png',
  isOnline: true,
);

// USERS
final User Proctor = User(
  id: 1,
  name: 'Proctor',
  imageUrl: 'lib/assets/college.png',
  isOnline: true,
);


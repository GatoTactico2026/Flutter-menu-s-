import 'package:flutter/material.dart';

void main() {
  runApp(const ConnectApp());
}

class ConnectApp extends StatelessWidget {
  const ConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    const accentGreen = Color(0xFF00A884);

    return MaterialApp(
      title: 'Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: accentGreen,
              brightness: Brightness.dark,
            ).copyWith(
              primary: accentGreen,
              onPrimary: const Color(0xFF001F18),
              surface: const Color(0xFF202C33),
              onSurface: const Color(0xFFE9EDEF),
              onSurfaceVariant: const Color(0xFF8696A0),
              error: const Color(0xFFFF6B6B),
            ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0B141A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF202C33),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const ConnectHomePage(),
    );
  }
}

class ConnectHomePage extends StatefulWidget {
  const ConnectHomePage({super.key});

  @override
  State<ConnectHomePage> createState() => _ConnectHomePageState();
}

class _ConnectHomePageState extends State<ConnectHomePage> {
  int _selectedIndex = 0;

  static const _pages = [_PeoplePage(), _ChatsPage(), _CallsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.forum_rounded,
                size: 19,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Connect',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF2A3942),
              foregroundColor: const Color(0xFFE9EDEF),
            ),
            icon: const Icon(Icons.notifications_none_rounded, size: 21),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary
                      .withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFF2A3942),
                child: Text(
                  'AM',
                  style: TextStyle(
                    color: Color(0xFFB7E4D9),
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(index: _selectedIndex, children: _pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: const Color(0xFF202C33),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        indicatorColor: const Color(0xFF2A3942),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.people_outline_rounded),
            selectedIcon: Icon(Icons.people_rounded),
            label: 'Peoples',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            selectedIcon: Icon(Icons.chat_bubble_rounded),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.call_outlined),
            selectedIcon: Icon(Icons.call_rounded),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}

class _PeoplePage extends StatelessWidget {
  const _PeoplePage();

  static const _people = [
    _Person('Sofia Martinez', 'Design team', 'SM', Color(0xFFE9D7F5), true),
    _Person('Daniel Rivera', 'Product manager', 'DR', Color(0xFFD8E8F7), true),
    _Person('Valentina Cruz', 'Marketing', 'VC', Color(0xFFF8DFD7), false),
    _Person('Mateo Gonzalez', 'Engineering', 'MG', Color(0xFFDCEBDD), true),
    _Person('Camila Torres', 'Design team', 'CT', Color(0xFFF6E8C9), false),
    _Person('Diego Flores', 'Engineering', 'DF', Color(0xFFD9DDF7), false),
    _Person('Lucia Herrera', 'Product team', 'LH', Color(0xFFF1D9E5), true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      children: [
        const _PageHeading(
          title: 'People',
          subtitle: 'Find and connect with your team',
        ),
        const SizedBox(height: 20),
        const _SearchField(hintText: 'Search people'),
        const SizedBox(height: 24),
        const _SectionHeading(title: 'Your contacts', trailing: '12 people'),
        const SizedBox(height: 8),
        for (final person in _people) _PersonTile(person: person),
      ],
    );
  }
}

class _ChatsPage extends StatelessWidget {
  const _ChatsPage();

  static const _chats = [
    _Chat(
      'Sofia Martinez',
      'Are we still meeting at 3?',
      '10:42 AM',
      'SM',
      Color(0xFFE9D7F5),
      2,
    ),
    _Chat(
      'Design team',
      'Camila: I shared the new mockups',
      '9:18 AM',
      'DT',
      Color(0xFFD8E8F7),
      3,
    ),
    _Chat(
      'Daniel Rivera',
      'Thanks, that looks great!',
      'Yesterday',
      'DR',
      Color(0xFFDCEBDD),
      0,
    ),
    _Chat(
      'Valentina Cruz',
      'Voice message',
      'Yesterday',
      'VC',
      Color(0xFFF8DFD7),
      0,
    ),
    _Chat(
      'Product team',
      'You: See you tomorrow',
      'Monday',
      'PT',
      Color(0xFFF6E8C9),
      0,
    ),
    _Chat('Mateo Gonzalez', 'Photo', 'Sunday', 'MG', Color(0xFFD9DDF7), 0),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      children: [
        const _PageHeading(
          title: 'Chats',
          subtitle: 'Your recent conversations',
        ),
        const SizedBox(height: 20),
        const _SearchField(hintText: 'Search conversations'),
        const SizedBox(height: 24),
        const _SectionHeading(title: 'Recent', trailing: '6 conversations'),
        const SizedBox(height: 8),
        for (final chat in _chats) _ChatTile(chat: chat),
      ],
    );
  }
}

class _CallsPage extends StatelessWidget {
  const _CallsPage();

  static const _calls = [
    _Call(
      'Sofia Martinez',
      'Today, 10:15 AM',
      'SM',
      Color(0xFFE9D7F5),
      Icons.call_received_rounded,
      true,
    ),
    _Call(
      'Daniel Rivera',
      'Today, 9:40 AM',
      'DR',
      Color(0xFFD8E8F7),
      Icons.call_made_rounded,
      true,
    ),
    _Call(
      'Valentina Cruz',
      'Yesterday, 4:32 PM',
      'VC',
      Color(0xFFF8DFD7),
      Icons.call_missed_rounded,
      false,
    ),
    _Call(
      'Mateo Gonzalez',
      'Yesterday, 11:08 AM',
      'MG',
      Color(0xFFDCEBDD),
      Icons.call_received_rounded,
      true,
    ),
    _Call(
      'Camila Torres',
      'Monday, 2:20 PM',
      'CT',
      Color(0xFFF6E8C9),
      Icons.call_made_rounded,
      true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      children: [
        const _PageHeading(
          title: 'Calls',
          subtitle: 'Stay in touch, wherever you are',
        ),
        const SizedBox(height: 24),
        const _SectionHeading(title: 'Recent calls', trailing: '5 calls'),
        const SizedBox(height: 8),
        for (final call in _calls) _CallTile(call: call),
      ],
    );
  }
}

class _PageHeading extends StatelessWidget {
  const _PageHeading({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final icon = switch (title) {
      'People' => Icons.people_alt_rounded,
      'Chats' => Icons.chat_rounded,
      _ => Icons.call_rounded,
    };

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF075E54), Color(0xFF103D39)],
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00A884).withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -24,
            top: -38,
            child: Container(
              width: 145,
              height: 145,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.07),
              ),
            ),
          ),
          Positioned(
            right: 23,
            bottom: -47,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 21, 22, 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 15,
                      color: Colors.white.withValues(alpha: 0.82),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      'YOUR CONNECTED SPACE',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.82),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: Colors.white.withValues(alpha: 0.84)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title, required this.trailing});

  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          trailing,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        filled: true,
        fillColor: const Color(0xFF202C33),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: const BorderSide(color: Color(0xFF2A3942)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class _Person {
  const _Person(
    this.name,
    this.description,
    this.initials,
    this.color,
    this.isOnline,
  );

  final String name;
  final String description;
  final String initials;
  final Color color;
  final bool isOnline;
}

class _PersonTile extends StatelessWidget {
  const _PersonTile({required this.person});

  final _Person person;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 0,
      color: const Color(0xFF111B21),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
        side: const BorderSide(color: Color(0xFF202C33)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        leading: _Avatar(
          initials: person.initials,
          color: person.color,
          online: person.isOnline,
        ),
        title: Text(
          person.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(person.description),
        trailing: IconButton(
          tooltip: 'Start a chat with ${person.name}',
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF202C33),
            foregroundColor: Theme.of(context).colorScheme.primary,
          ),
          icon: const Icon(Icons.chat_bubble_outline_rounded, size: 19),
        ),
      ),
    );
  }
}

class _Chat {
  const _Chat(
    this.name,
    this.message,
    this.time,
    this.initials,
    this.color,
    this.unreadCount,
  );

  final String name;
  final String message;
  final String time;
  final String initials;
  final Color color;
  final int unreadCount;
}

class _ChatTile extends StatelessWidget {
  const _ChatTile({required this.chat});

  final _Chat chat;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 0,
      color: const Color(0xFF111B21),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
        side: const BorderSide(color: Color(0xFF202C33)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        leading: _Avatar(initials: chat.initials, color: chat.color),
        title: Text(
          chat.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          chat.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              chat.time,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            if (chat.unreadCount > 0) ...[
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${chat.unreadCount}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Call {
  const _Call(
    this.name,
    this.date,
    this.initials,
    this.color,
    this.directionIcon,
    this.wasAnswered,
  );

  final String name;
  final String date;
  final String initials;
  final Color color;
  final IconData directionIcon;
  final bool wasAnswered;
}

class _CallTile extends StatelessWidget {
  const _CallTile({required this.call});

  final _Call call;

  @override
  Widget build(BuildContext context) {
    final callColor = call.wasAnswered
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.error;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 0,
      color: const Color(0xFF111B21),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
        side: const BorderSide(color: Color(0xFF202C33)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        leading: _Avatar(initials: call.initials, color: call.color),
        title: Text(
          call.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          children: [
            Icon(call.directionIcon, size: 16, color: callColor),
            const SizedBox(width: 5),
            Text(call.date),
          ],
        ),
        trailing: IconButton(
          tooltip: 'Call ${call.name}',
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF202C33),
            foregroundColor: Theme.of(context).colorScheme.primary,
          ),
          icon: const Icon(Icons.call_rounded, size: 19),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.initials,
    required this.color,
    this.online = false,
  });

  final String initials;
  final Color color;
  final bool online;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: Text(
            initials,
            style: const TextStyle(
              color: Color(0xFF263238),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (online)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

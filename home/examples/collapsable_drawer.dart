import 'package:flutils/core/utils/app_const.dart';
import 'package:flutter/material.dart';

// you can customize this widget as you want
// this is just a simple example
class CollapsableDrawer extends StatelessWidget {
  const CollapsableDrawer({super.key});

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.reorder_outlined),
        ),
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text(
          'Collapsable Drawer',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 500),
      width: _isCollapsed ? 300 : 74,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Color(0xFF141414),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            CustomDrawerHeader(isCollapsable: _isCollapsed),
            const Divider(color: Colors.grey),
            // home
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.house_outlined,
              title: 'Home',
              infoCount: 0,
            ),

            // calender
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.calendar_month_outlined,
              title: 'Calender',
              infoCount: 0,
            ),

            // notes
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.note_add_outlined,
              title: 'Notes',
              infoCount: 0,
            ),

            // notifications
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.notifications_none_outlined,
              title: 'Notifications',
              infoCount: 22,
            ),

            // settings
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.settings_outlined,
              title: 'Settings',
              infoCount: 0,
            ),

            // delete account
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.delete_outline,
              title: 'Delete Account',
              infoCount: 0,
            ),

            const Divider(color: Colors.grey),

            // about us
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.info_outline,
              title: 'About Us',
              infoCount: 0,
            ),

            // contact us
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.contact_support_outlined,
              title: 'Contact Us',
              infoCount: 0,
            ),

            // privacy policy
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              infoCount: 0,
            ),
            OwnerInfo(isCollapsed: _isCollapsed),
            Align(
              alignment:
                  _isCollapsed ? Alignment.bottomRight : Alignment.bottomCenter,
              child: IconButton(
                splashColor: Colors.transparent,
                icon: Icon(
                  _isCollapsed ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
                onPressed: () {
                  setState(() {
                    _isCollapsed = !_isCollapsed;
                  });
                },
              ),
            ),
          ]
              .map(
                (e) => Padding(
                  padding: e is Drawer
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(top: 10),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// owner header
class CustomDrawerHeader extends StatelessWidget {
  final bool isCollapsable;

  const CustomDrawerHeader({
    super.key,
    required this.isCollapsable,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          const FlutterLogo(size: 30),
          if (isCollapsable) ...[
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// drawer list tile
class CustomListTile extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String title;
  final bool forwardIos;
  final int infoCount;

  const CustomListTile({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.title,
    this.forwardIos = false,
    required this.infoCount,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.all(10),
          width: isCollapsed ? 300 : 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Badge.count(
                count: infoCount,
                isLabelVisible: infoCount > 0,
                textStyle: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
                child: Icon(icon, color: Colors.white),
              ),
              if (isCollapsed) ...[
                const Expanded(
                  flex: 0,
                  child: SizedBox(width: 10),
                ),
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                ),
                if (forwardIos)
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// owner info
class OwnerInfo extends StatelessWidget {
  final bool isCollapsed;

  const OwnerInfo({
    super.key,
    required this.isCollapsed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isCollapsed ? 74 : 100,
      width: double.infinity,
      padding: isCollapsed
          ? const EdgeInsets.symmetric(horizontal: 10)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isCollapsed
          ? IntrinsicHeight(
              child: Row(
                children: [
                  const Expanded(
                    child: OwnerAvatar(),
                  ),
                  // name and username
                  const SizedBox(width: 10),
                  const Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // name
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            AppConst.appName,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        // username
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '@ao307',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const Expanded(
                  child: OwnerAvatar(),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

// owner image
class OwnerAvatar extends StatelessWidget {
  const OwnerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 22,
      backgroundImage: NetworkImage('https://imgur.com/ivPXgoz.png'),
    );
  }
}

import 'package:fitness_dashboard_ui/const/constant.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool _showMobileSearch = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          //NON DESKTOP SIDE MENU
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              //makes clickable
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Padding(padding: const EdgeInsets.all(4.0), child: Icon(Icons.menu, color: Colors.grey, size: 25)),
            ),
          ),
        if (!Responsive.isMobile(context))
          //NON MOBILE SEARCH
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: cardBackgroundColor,
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 21),
              ),
            ),
          ),
        if (Responsive.isMobile(context))
          Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                child:
                    _showMobileSearch
                        ? SizedBox(
                          key: const ValueKey(true),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextField(
                            controller: _searchController,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              filled: true,
                              fillColor: cardBackgroundColor,
                              prefixIcon: const Icon(Icons.search, size: 20),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showMobileSearch = false;
                                    _searchController.clear();
                                  });
                                },
                                icon: const Icon(Icons.close),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        )
                        : IconButton(
                          onPressed: () {
                            setState(() {
                              _showMobileSearch = true;
                            });
                          },
                          icon: const Icon(Icons.search, color: Colors.grey, size: 25),
                        ),
              ),
              InkWell(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset("assets/images/luigi_avatar.png", width: 32),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

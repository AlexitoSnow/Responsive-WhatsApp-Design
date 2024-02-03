import 'package:flutter/material.dart';

class ResponsiveScaffold extends StatefulWidget {
  final Map<String, IconData> items;
  final List<Widget>? pages;
  final Widget? floatingActionButton;

  const ResponsiveScaffold({
    super.key,
    required this.items,
    this.pages,
    this.floatingActionButton,
  });

  @override
  State<ResponsiveScaffold> createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends State<ResponsiveScaffold>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.items.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: isMobile ? _topNavBar() : null,
      body: Row(
        children: [
          if (!isMobile) _sideNavBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                widget.items.keys.length,
                (index) {
                  if (isMobile) {
                    return widget.pages![index];
                  }
                  var titulo = widget.items.keys.elementAt(index);
                  return Row(
                    children: [
                      const VerticalDivider(
                        width: 1,
                        thickness: 1,
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    titulo,
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit_square),
                                  ),
                                ],
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Buscar en ${titulo.toLowerCase()}',
                                  prefixIcon: const Icon(Icons.search),
                                ),
                              ),
                              Expanded(child: widget.pages![index]),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        width: 1,
                        thickness: 1,
                      ),
                      const Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WhatsApp para Windows'),
                              Text(
                                  'Envía y recibe mensajes sin mantener tu teléfono conectado.\nUsa WhatsApp en hasta 4 dispositivos vinculados y 1 teléfono a la vez.'),
                            ],
                          )),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: isMobile ? widget.floatingActionButton : null,
    );
  }

  Widget _sideNavBar() {
    return NavigationRail(
      labelType: NavigationRailLabelType.none,
      destinations: List.generate(
        widget.items.length,
        (index) {
          final title = widget.items.keys.elementAt(index);
          final icon = widget.items.values.elementAt(index);
          return NavigationRailDestination(
            icon: Icon(icon),
            label: Text(title),
          );
        },
      ),
      trailing: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_border),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.archive_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      selectedIndex: _tabController.index,
      onDestinationSelected: (int index) {
        _tabController.animateTo(index);
        setState(() {
          _tabController.index = index;
        });
      },
    );
  }

  PreferredSizeWidget _topNavBar() {
    return AppBar(
      title: const Text('WhatsApp'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        tabs: List.generate(
          widget.items.keys.length,
          (index) => Tab(
            text: widget.items.keys.elementAt(index),
          ),
        ),
      ),
    );
  }
}

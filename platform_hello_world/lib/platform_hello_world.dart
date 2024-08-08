library;

export 'src/hello_world/hello_world.dart'
    if (dart.library.io) 'src/hello_world/hello_world_default.dart'
    if (dart.library.js_interop) 'src/hello_world/hello_world_web.dart';

export 'src/rename_browser_tab/rename_broser_tab.dart'
    if (dart.library.js_interop) 'src/rename_browser_tab/rename_broser_tab_web.dart';

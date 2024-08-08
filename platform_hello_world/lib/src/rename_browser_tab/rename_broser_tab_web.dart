import 'dart:html' as html;

Future<void> renameBrowserTab(final String name) async {
  html.document.title = name;
}

// Helper widget, to dispatch Notifications when a right-click is detected on some child
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:universal_html/html.dart' as html;
import '../context_menus.dart';

/// Wraps any widget in a GestureDetector and calls [ContextMenuOverlay].show
class ContextMenuRegion extends StatelessWidget {
  const ContextMenuRegion(
      {Key? key, required this.child, required this.contextMenu, this.isEnabled = true, this.enableLongPress = true})
      : super(key: key);
  final Widget child;
  final Widget contextMenu;
  final bool isEnabled;
  final bool enableLongPress;
  @override
  Widget build(BuildContext context) {
    void showMenu() {
      // calculate widget position on screen
      context.contextMenuOverlay.show(contextMenu);
    }

    if (isEnabled == false) return child;
    return Listener(
      onPointerDown:(event){
    if (event.kind == PointerDeviceKind.mouse &&
    event.buttons == kSecondaryMouseButton) {
      showMenu();
    }

    },
      child: child,
    );
  }
}

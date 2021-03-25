/**
 * Mouse Functions
 */

function save_mouse_position_for_window(window) {
  if (!window) return;
  heartbeat_window(window);
  var pos = Mouse.location()
  //pos.y = 800 - pos.y;  // fix phoenix 2.x bug
  mousePositions[window.hash()] = pos;
}

function set_mouse_position_for_window_center(window) {
  Mouse.moveTo({
    x: window.topLeft().x + window.frame().width / 2,
    y: window.topLeft().y + window.frame().height / 2
  });
  heartbeat_window(window);
}

function restore_mouse_position_for_window(window) {
  if (!mousePositions[window.hash()]) {
    set_mouse_position_for_window_center(window);
    return;
  }
  var pos = mousePositions[window.hash()];
  var rect = window.frame();
  if (pos.x < rect.x || pos.x > (rect.x + rect.width) || pos.y < rect.y || pos. y > (rect.y + rect.height)) {
    set_mouse_position_for_window_center(window);
    return;
  }
  //Phoenix.log(String.format('x: {0}, y: {1}', pos.x, pos.y));
  Mouse.moveTo(pos);
  heartbeat_window(window);
}

function restore_mouse_position_for_now() {
  if (Window.focusedWindow() === undefined) {
    return;
  }
  restore_mouse_position_for_window(Window.focusedWindow());
}

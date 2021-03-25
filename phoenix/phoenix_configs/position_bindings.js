/* Position Bindings */

Key.on('q', controlShift, function () {
  Window.focused() && Window.focused().to(Position.left);
});

Key.on('w', controlShift, function () {
  Window.focused() && Window.focused().to(Position.right);
});

Key.on('a', controlShift, function () {
  Window.focused() && Window.focused().to(Position.bottomLeft);
});

Key.on('s', controlShift, function () {
  Window.focused() && Window.focused().to(Position.bottomRight);
});

Key.on('z', controlShift, function () {
  Window.focused() && Window.focused().to(Position.central);
});

/* Grid Bindings */

Key.on('p', controlShift, function () {
  Window.focused() && Window.focused().grid(Frame.half.width, Frame.half.height);
});

Key.on('å', controlShift, function () {
  Window.focused() && Window.focused().grid(Frame.width, Frame.half.height);
});

Key.on('ö', controlShift, function () {
  Window.focused() && Window.focused().grid(Frame.half.width, Frame.height);
});

Key.on('ä', controlShift, function () {
  Window.focused() && Window.focused().grid(Frame.width, Frame.height);
});

/* Reverse Grid Bindings */

Key.on('å', controlAltShift, function () {
  Window.focused() && Window.focused().reverseGrid(Frame.half.width, Frame.half.height);
});

Key.on('p', controlAltShift, function () {
  Window.focused() && Window.focused().reverseGrid(Frame.width, Frame.half.height);
});

Key.on('ä', controlAltShift, function () {
  Window.focused() && Window.focused().reverseGrid(Frame.half.width, Frame.height);
});

Key.on('ö', controlAltShift, function () {
  Window.focused() && Window.focused().reverseGrid(Frame.width, Frame.height);
});

/* Resize Bindings */

Key.on(',', controlShift, function () {
  Window.focused() && Window.focused().increaseWidth();
});

Key.on('.', controlShift, function () {
  Window.focused() && Window.focused().increaseHeight();
});

Key.on(',', controlAltShift, function () {
  Window.focused() && Window.focused().decreaseWidth();
});

Key.on('.', controlAltShift, function () {
  Window.focused() && Window.focused().decreaseHeight();
});

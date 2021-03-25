/* Position */
var Position = {

  central: function (frame, window) {
    return {
      x: frame.x + ((frame.width - window.width) / 2),
      y: frame.y + ((frame.height - window.height) / 2)
    };
  },

  top: function (frame, window) {
    return {
      x: window.x,
      y: frame.y
    };
  },

  bottom: function (frame, window) {
    return {
      x: window.x,
      y: (frame.y + frame.height) - window.height
    };
  },

  left: function (frame, window) {
    return {
      x: frame.x,
      y: window.y
    };
  },

  right: function (frame, window) {
    return {
      x: (frame.x + frame.width) - window.width,
      y: window.y
    };
  },

  topLeft: function (frame, window, margin) {
    return {
      x: Position.left(frame, window).x + margin,
      y: Position.top(frame, window).y + margin
    };
  },

  topRight: function (frame, window, margin) {
    return {
      x: Position.right(frame, window).x - margin,
      y: Position.top(frame, window).y + margin
    };
  },

  bottomLeft: function (frame, window, margin) {
    return {
      x: Position.left(frame, window).x + margin,
      y: Position.bottom(frame, window).y - margin
    };
  },

  bottomRight: function (frame, window, margin) {
    return {
      x: Position.right(frame, window).x - margin,
      y: Position.bottom(frame, window).y - margin
    };
  }
};

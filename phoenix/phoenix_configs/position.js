/* Position */
var Position = {

  central: function (frame, window) {
    return {
      x: frame.x + ((frame.width - window.width) / 2),
      y: frame.y + ((frame.height - window.height) / 2)
    };
  },

  topCenter: function (frame, window) {
    return {
      x: frame.x + ((frame.width - window.width) / 2),
      y: frame.y
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

  left: function (frame, window, margin) {
    return {
      x: frame.x + margin,
      y: frame.y + ((frame.height - window.height) / 2)
    };
  },

  right: function (frame, window, margin) {
    return {
      x: (frame.x + frame.width) - window.width,
      y: window.y + margin
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

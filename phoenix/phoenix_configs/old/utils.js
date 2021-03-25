/**
 * Utils Functions
 */

function alert(message) {
  var modal = new Modal();
  modal.message = message;
  modal.duration = 2;
  modal.show();
}

function assert(condition, message) {
  if (!condition) {
    throw message || "Assertion failed";
  }
}

if (!String.format) {
  String.format = function(format) {
    var args = Array.prototype.slice.call(arguments, 1);
    return format.replace(/{(\d+)}/g, function(match, number) {
      return typeof args[number] != 'undefined'
      ? args[number]
      : match
      ;
    });
  };
}

var alert_title = function(window) { Modal.show(window.title()); };

function sortByMostRecent(windows) {
  var visibleAppMostRecentFirst = _.map(Window.visibleWindowsInOrder(),
                                        function(w) { return w.hash(); });
  var visibleAppMostRecentFirstWithWeight = _.object(visibleAppMostRecentFirst,
                                                     _.range(visibleAppMostRecentFirst.length));
  return _.sortBy(windows, function(window) { return visibleAppMostRecentFirstWithWeight[window.hash()]; });
};

function getNewFrame(frame, oldScreenRect, newScreenRect) {
}

function getResizeFrame(frame, ratio) {
  var mid_pos_x = frame.x + 0.5 * frame.width;
  var mid_pos_y = frame.y + 0.5 * frame.height;
  return {
    x: Math.round(frame.x + frame.width / 2 * (1 - ratio)),
    y: Math.round(frame.y + frame.height / 2 * (1 - ratio)),
    width: Math.round(frame.width * ratio),
    height: Math.round(frame.height * ratio)
  }
}

function getSmallerFrame(frame) {
  return getResizeFrame(frame, 0.9);
}

function getLargerFrame(frame) {
  return getResizeFrame(frame, 1.1);
}

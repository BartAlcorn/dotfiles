/**
 * Window Functions
 */

function hide_inactiveWindow(windows) {
  var now = new Date().getTime() / 1000;
  _.chain(windows).filter(function(window) {
    if (!ACTIVE_WINDOWS_TIMES[window.app().pid]) {
      ACTIVE_WINDOWS_TIMES[window.app().pid] = now;
      return false;
    } return true;
  }).filter(function(window) {
    return now - ACTIVE_WINDOWS_TIMES[window.app().pid]> HIDE_INACTIVE_WINDOW_TIME * 60;
    //return now - ACTIVE_WINDOWS_TIMES[window.app().pid]> 5;
  }).map(function(window) {window.app().hide()});
}

function heartbeat_window(window) {
  ACTIVE_WINDOWS_TIMES[window.app().pid] = new Date().getTime() / 1000;
  //hide_inactiveWindow(window.otherWindowsOnSameScreen());
}

function getAnotherWindowsOnSameScreen(window, offset) {
  var windows = window.otherWindowsOnSameScreen(); // slow, makes `Saved spin report for Phoenix version 1.2 (1.2) to /Library/Logs/DiagnosticReports/Phoenix_2015-05-30-170354_majin.spin`
  windows.push(window);
  windows = _.chain(windows).sortBy(function(window) {
    return [window.frame().x, window.frame().y, window.app().pid, window.title()].join('_');
  }).value().reverse();
  return windows[(_.indexOf(windows, window) + offset + windows.length) % windows.length];
}

function getPreviousWindowsOnSameScreen(window) {
  return getAnotherWindowsOnSameScreen(window, -1)
};

function getNextWindowsOnSameScreen(window) {
  return getAnotherWindowsOnSameScreen(window, 1)
};

function setWindowCentral(window) {
  window.setTopLeft({
    x: (window.screen().frameInRectangle().width - window.size().width) / 2 + window.screen().frameInRectangle().x,
    y: (window.screen().frameInRectangle().height - window.size().height) / 2 + window.screen().frameInRectangle().y
  });
  heartbeat_window(window);
};

'use strict';

var alt = [ 'alt' ];
var altShift = [ 'alt', 'shift' ];
var control = [ 'ctrl' ];
var controlAlt = [ 'ctrl', 'alt' ];
var controlAltShift = [ 'ctrl', 'alt', 'shift' ];
var controlShift = [ 'ctrl', 'shift' ];
var margin = 4;
var increment = 0.1;
var mousePositions = {};

/* Preferences */
Phoenix.set({
  daemon: false,
  openAtLogin: true
});

/* Includes */
require('~/DotFiles/phoenix_configs/position.js');
require('~/DotFiles/phoenix_configs/grid.js');
require('~/DotFiles/phoenix_configs/position_bindings.js');

require('~/DotFiles/phoenix_configs/helpers/utils.js');
require('~/DotFiles/phoenix_configs/helpers/screens.js');
require('~/DotFiles/phoenix_configs/helpers/windows.js');
require('~/DotFiles/phoenix_configs/helpers/mouse.js');
require('~/DotFiles/phoenix_configs/helpers/app.js');

/* Key Bindings and App Management */
Key.on('1', controlAlt, function(){ launchOrFocus('Safari'); });
Key.on('2', controlAlt, function(){ launchOrFocus('iTerm'); });
Key.on('3', controlAlt, function(){ launchOrFocus('Sublime Text 3'); });
Key.on('m', controlAlt, function(){ launchOrFocus('Mail'); });

/* Simple alert that is useful when testing to know the config has reloaded! */
alert('Phoenix is ready!');

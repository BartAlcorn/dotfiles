/* Grid */

var Frame = {
  width: 1,
  height: 1,
  half: {
    width: 0.5,
    height: 0.5
  }
};

/* Window Functions */

Window.prototype.to = function (position) {
  this.setTopLeft(position(this.screen().visibleFrameInRectangle(), this.frame(), margin));
}

Window.prototype.grid = function (x, y, reverse) {

  var frame = this.screen().visibleFrameInRectangle();

  var newWindowFrame = _(this.frame()).extend({
    width: (frame.width * x) - (2 * margin),
    height: (frame.height * y) - (2 * margin)
  });

  var position = reverse ? Position.topRight(frame, newWindowFrame, margin) :
                           Position.topLeft(frame, newWindowFrame, margin);

  this.setFrame(_(newWindowFrame).extend(position));
}

Window.prototype.reverseGrid = function (x, y) {
  this.grid(x, y, true);
}

Window.prototype.resize = function (multiplier) {

  var frame = this.screen().visibleFrameInRectangle();
  var newSize = this.size();

  if (multiplier.x) {
    newSize.width += frame.width * multiplier.x;
  }

  if (multiplier.y) {
    newSize.height += frame.height * multiplier.y;
  }

  this.setSize(newSize);
}

Window.prototype.increaseWidth = function () {
  this.resize({ x: increment });
}

Window.prototype.decreaseWidth = function () {
  this.resize({ x: -increment });
}

Window.prototype.increaseHeight = function () {
  this.resize({ y: increment });
}

Window.prototype.decreaseHeight = function () {
  this.resize({ y: -increment });
}

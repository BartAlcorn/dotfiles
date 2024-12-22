# speed up Dock animation
alisas dockfast='defaults write com.apple.dock autohide-time-modifier -float 0.15;killall Dock'
# restore Dock animation time
alisas dockreset='defaults delete com.apple.dock autohide-time-modifier;killall Dock'

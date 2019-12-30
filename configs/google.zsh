#
# Google CLI aliases
# Bart Alcorn
#

# Perform a Google search for query
function google() {
  open "http://www.google.com/search?q=${(j: :)@}"
}

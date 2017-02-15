# BATS test file to run after executing 'examples/init.pp' with puppet.
#
# For more info on BATS see https://github.com/sstephenson/bats

# Tests are really easy! just the exit status of running a command...
@test "bar left alone" {
  grep '^I went to the bar' /foo/bar
}

@test "bas left alone" {
  grep '^I programmed in basic' /foo/bar
}

@test "drink left alone" {
  grep '^I had a drink' /foo/bar
}

@test "line uncommented" {
  grep '^I went home' /foo/bar
}

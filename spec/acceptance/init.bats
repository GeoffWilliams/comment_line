# BATS test file to run after executing 'examples/init.pp' with puppet.
#
# For more info on BATS see https://github.com/sstephenson/bats

# Tests are really easy! just the exit status of running a command...
@test "bar commented" {
  grep '#I went to the bar' /foo/bar
}

@test "bas commented" {
  grep '#I programmed in basic' /foo/bar
}

@test "line left alone 1" {
  grep 'I had a drink' /foo/bar
}

@test "line left alone 1" {
  grep 'I went home' /foo/bar
}

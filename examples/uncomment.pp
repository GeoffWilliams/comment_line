# @PDQTest

# needs uncommenting
comment_line { "/foo/bar I went home":
  ensure => uncommented,
  path   => "/foo/bar",
  match  => "I went home",
}

# already uncommmented
comment_line { "/foo/bar I had a drink":
  ensure => uncommented,
  path   => "/foo/bar",
  match  => "I had a drink",
}

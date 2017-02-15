# @PDQTest
comment_line { "/foo/bar baz":
  ensure => commented,
  path   => "/foo/bar",
  match  => "bar",
}

comment_line { "/foo/bar bas":
  ensure => commented,
  path  => "/foo/bar",
  match => "bas",
}

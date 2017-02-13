# @PDQTest
comment_line { "/foo/bar baz":
  path  => "/foo/bar",
  match => "bar",
}

comment_line { "/foo/bar bas":
  path  => "/foo/bar",
  match => "bas",
}

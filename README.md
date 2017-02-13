[![Build Status](https://travis-ci.org/GeoffWilliams/comment_line.svg?branch=master)](https://travis-ci.org/GeoffWilliams/comment_line)
# comment_line

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Comment out a line a file using Puppet (via `awk`).

## Usage

```puppet
comment_line { "/foo/bar baz":
  path  => "/foo/bar",
  match => "bar",
}
```
Comment out all lines matching `/bar/` in the file `/foo/bar`

## Reference

### Defined types
* comment_line - Comment out a line matching regexp

## Limitations

* Requires `awk`
* Not supported by Puppet, Inc.

## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/GeoffWilliams/pdqtest).


Test can be executed with:

```
bundle install
bundle exec pdqtest all
```


See `.travis.yml` for a working CI example

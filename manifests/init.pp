# Comment_line
#
# Comment out lines in a file by regexp
#
# @param title For reference only
# @param match Comment out lines that match this regular expression
# @param path File to work on
# @param ensure Not used
# @param comment_char Character to use for commenting out lines
define comment_line(
    $match,
    $path,
    $ensure       = "present",
    $comment_char = "#",
) {

  $temp_file    = "${path}.tmp"
  $replace_file = "> ${temp_file} && mv ${temp_file} ${path}"

  $test_file    = "bash -c \"[[ $(awk '/^[^#]+${match}/ {print}' ${path} | wc -l) -gt 0 ]]\""

  $change_file  =
  "awk '{
    if (match(\$0, /^[^${comment_char}].*${match}/)) {
      print \"${comment_char}\" \$0
    } else {
      print \$0
    }
  }' ${path} ${replace_file}"

  exec { "comment_line ${path} ${match}":
    command => $change_file,
    onlyif  => $test_file,
    path    => ['/usr/bin', '/bin'],
  }
}

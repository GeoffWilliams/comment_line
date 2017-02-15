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
    String                            $match,
    String                            $path,
    Enum["commented", "uncommented"]  $ensure       = "commented",
    String                            $comment_char = "#",
) {

  $temp_file    = "${path}.tmp"
  $replace_file = "> ${temp_file} && mv ${temp_file} ${path}"

  if $ensure == "commented" {
    $test_file    = "bash -c \"[[ $(awk '/^[^#]+${match}/ {print}' ${path} | wc -l) -gt 0 ]]\""

    $change_file  =
    "awk '{
      if (match(\$0, /^[^${comment_char}].*${match}/)) {
        print \"${comment_char}\" \$0
      } else {
        print \$0
      }
    }' ${path} ${replace_file}"
  } else {
    $test_file    = "bash -c \"[[ $(awk '/^\\s*#.*${match}/ {print}' ${path} | wc -l) -gt 0 ]]\""

    $change_file  =
    "awk '{
      if (match(\$0, /^\s*#.*${match}/)) {
        gsub(/^\s*#\s*/,\"\", \$0)
        print \$0
      } else {
        print \$0
      }
    }' ${path} ${replace_file}"

  }


  exec { "comment_line ${path} ${match}":
    command => $change_file,
    onlyif  => $test_file,
    path    => ['/usr/bin', '/bin'],
  }
}

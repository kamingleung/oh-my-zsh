function zsh_man() {
  print "loop example"
  print "     for foo in a b; { echo foo is $a; bar=$foo; }"
  print ""
  print "working with files in directory"
  print "for file in **/*; do print $file ;done"
}

function find_any() {
  print "recursively find file with a pattern"
  print "     find . -type | grep pattern"
  print ""
  print "recursively find in files"
  print "     grep -rn file *"
}

function unzip_any() {
  print "bz2      : bunzip2 filename.bz2"
  print "tar.bz2  : tar -xvjpf filename.tar.bz2"
  print "tar.gz   : tar xvzf file-1.0.tar.gz"
  print "tar      : tar xvf file-1.0.tar"
}


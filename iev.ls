# Calculating Expected Offspring
#
# Problem: http://rosalind.info/problems/iev/
#
# Usage: lsc iev.ls --file yourfile
require! {
  fs
  optimist.argv
}
{sum, zip-with} = require 'prelude-ls'
file = argv.file or throw 'input file is required'

ev = [2 2 2 1.5 1 0]
err, data <- fs.read-file file, \utf-8
console.log sum zip-with (-> &0 * &1), ev, data / ' '

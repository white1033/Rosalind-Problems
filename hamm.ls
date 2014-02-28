# Counting Point Mutations
#
# Problem: http://rosalind.info/problems/hamm/
#
# Usage: lsc hamm.ls --file yourfile
require! {
  fs
  optimist.argv
}
{apply, chars, zip-with, sum, lines} = require \prelude-ls
file = argv.file or throw 'input file required'

hamming-distance = (s, t) ->
  chars s |> zip-with (!==), _, chars t |> sum

err, data <- fs.read-file file, \utf-8
console.log apply hamming-distance, lines data

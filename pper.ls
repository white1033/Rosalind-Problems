# Partial Permutations
#
# Problem: http://rosalind.info/problems/pper/
#
# Usage: lsc pper.ls --file yourfile
require! {
  fs
  optimist.argv
}
{apply, product} = require 'prelude-ls'

partial-perm = (+n, +k) ->
  product [n - k + 1 to n]

file = argv.file or throw 'input file required'
err, data <- fs.read-file file, \utf-8
console.log apply(partial-perm, data / ' ')  % 1_000_000

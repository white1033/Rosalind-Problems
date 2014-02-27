# Finding a Motif in DNA
#
# Problem http://rosalind.info/problems/subs/
#
# Usage: lsc subs.ls --file yourfile

require! {
  fs
  optimist.argv
}
{lines, apply, join, map} = require \prelude-ls
file = argv.file or throw 'input file required'

locations = (s, t) ->
  result = []
  start = 0
  while s.index-of(t, start) != -1
    start = s.index-of(t, start) + 1
    result.push start
  result * ' '

err, data <-! fs.read-file file, \utf-8
console.log apply locations, lines data

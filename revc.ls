# Problem
#
# In DNA strings, symbols A and T are complements of each other, as are C and G.
#
#   The reverse complement of a DNA string s is the string sc formed by reversing the symbols of s, then taking the complement of each symbol (e.g., the reverse complement of GTCA is TGAC).
#
#   Given: A DNA string s of length at most 1000 bp.
#
#   Return: The reverse complement sc of s.
#
#   Usage lsc revc.ls --file yourfile

argv = require \optimist .argv
fs = require \fs
{chars, join} = require \prelude-ls .Str
{map, reverse} = require \prelude-ls
file = argv.file or throw 'input file required'

reverse-complement = (dna) ->
  complements =
    A: 'T'
    T: 'A'
    C: 'G'
    G: 'C'

  dna
  |> chars
  |> reverse
  |> map (complements.)
  |> join ''

fs.read-file file, \utf-8, (err, data) !->
  if err
    throw err
  console.log reverse-complement data

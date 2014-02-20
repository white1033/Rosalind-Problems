# Rabbits and Recurrence Relations
#
# Problem http://rosalind.info/problems/fib/
#
# Usage: lsc fib.ls --file yourfile

argv = require \optimist .argv
fs = require \fs
{apply} = require \prelude-ls
file = argv.file or throw 'input file required'

fib = (n, k) ->
  [a, b] = [1, 1]
  for i in [2 til n]
    [a, b] = [b, k*a + b]
  b

(err, data) <-! fs.read-file file, \utf-8
if err then throw err
console.log apply fib, data / ' '

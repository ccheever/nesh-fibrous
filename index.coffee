fibrous = require 'use-global-fibrous'

exports.setup = (context) ->
  process.versions.fibrous = fibrous.version

exports.postStart = (context) ->
  repl = context.repl

  rawEval = repl.eval
  repl.eval = fibrous (input, context, filename) ->
    rawEval.sync input, context, filename

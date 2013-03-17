{spawn} = require 'child_process'
puts = console.log

system = (name, args) ->
    print = (buffer) -> process.stdout.write buffer.toString()
    proc = spawn name, args
    proc.stdout.on 'data', print
    proc.stderr.on 'data', print
    proc.on        'exit', (status) ->
        process.exit(1) if status != 0

task 'spec', "runs unit tests", ->
    imports = ['spec/jasmine-node/lib', 'spec/javascripts', 'public/bundle.js']
    process.env["NODE_PATH"] += ":" + imports.join ":"
    system "node", ["spec/jasmine-node/specs.js"]

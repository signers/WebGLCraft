mold       =  require 'mold-source-map'
fs         =  require 'fs'
path       =  require 'path'
bundlePath =  path.join __dirname, 'public', 'bundle.js'

module.exports = (sourcemap, cb) ->
  mapFilePath = bundlePath + '.map'

  sourcemap.sourceRoot 'file://'
  sourcemap.mapSources mold.mapPathRelativeTo(__dirname)

  # write map file and return a sourceMappingUrl that points to it
  fs.writeFile mapFilePath, sourcemap.toJSON(2), "utf-8", (err) ->
    return console.error(err)  if err
    cb '//@ sourceMappingURL=bundle.js.map'


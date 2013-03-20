coffeeify  =  require 'caching-coffeeify'
mold       =  require 'mold-source-map'
browserify =  require 'browserify'
shim       =  require 'browserify-shim'
fs         =  require 'fs'
path       =  require 'path'
bundlePath =  path.join __dirname, 'public', 'bundle.js'

build = module.exports = (report = false) ->
  bundle = shim(browserify(), {
      jquery              :  path :  './public/jquery/jquery-1.7.1.js',   exports :  '$'
      'jquery-hotkeys'    :  path :  './public/lib/jquery.hotkeys.js',    exports :  null, depends   :  { jquery :  '$' }
      'jquery-mousewheel' :  path :  './public/lib/jquery.mousewheel.js', exports :  null, depends   :  { jquery :  '$' }
      detector            :  path :  './public/lib/Detector.js',          exports :  'Detector'
      'improved-noise'    :  path :  './public/lib/ImprovedNoise.js',     exports :  'ImprovedNoise'
      three               :  path :  './public/lib/Three.js',             exports :  'THREE'
    })
    .transform(coffeeify)
    .require(require.resolve('./public/main'), entry: true)
    .bundle({ debug: true })


    #(if report then bundle.pipe((require 'show-stream-progress')) else bundle)
  bundle.pipe(mold.transformSourcesRelativeTo(path.dirname(bundlePath)))

return if module.parent

build(true).pipe(fs.createWriteStream  bundlePath)

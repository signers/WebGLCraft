http     =  require('http')
ecstatic =  require('ecstatic')
build    =  require('./build')

staticServer = ecstatic(root: __dirname + "/public", autoIndex: true )

http.createServer(
  (req, res) ->
    console.log('%s  %s', req.method, req.url)
    if req.url is '/bundle.js' then serveBundle(req, res) else staticServer(req, res)
).listen 8000

console.log "Listening on http://localhost:8000"

serveBundle = (req, res) ->
  console.log('piping bundle')
  res.setHeader('Content-Type', 'application/javascript')
  build().pipe(res)

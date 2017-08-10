gulp        = require 'gulp'
gutil       = require 'gulp-util'
del         = require 'del'
streamee    = require 'streamee'
es          = require 'event-stream'
coffee      = require 'gulp-coffee'
less        = require 'gulp-less'
cheerio     = require 'gulp-cheerio'
highlight   = require 'gulp-highlight'
gulpif      = require 'gulp-if'
concat      = require 'gulp-concat'
uglify      = require 'gulp-uglify'
jshint      = require 'gulp-jshint'
jscs        = require 'gulp-jscs'
batch       = require 'gulp-batch'
rename      = require 'gulp-rename'
watch       = require 'gulp-watch'
lazypipe    = require 'lazypipe'
fs          = require 'fs'
path        = require 'path'
File        = require 'vinyl'
through     = require 'through'
gulpSlides  = require 'gulp-slides'
#process    = require 'process'
#Combine    = require 'stream-combiner'

# ------------ Directories ------------

dir =
  css:  'css/'  # Css and Less
  htm:  'htm/'  # App Html and reveal.js slides
  htn:  'htn/'  # Gulp processed html
  img:  'img/'  # Images
  lib:  'lib/'  # Symlinks to external libraries - bower and node
  src:  'src/'  # Js

lib =
  bower:       dir.lib+'bower_components/'  # Managed by Bower
  nodeGlobal:  dir.lib+'node_modules/'
  nodeLocal:   'node_modules/'

compile =
  js:       dir.lib+'dist/compile/js/'
  css:      dir.lib+'dist/compile/css/'
  htn:      dir.htn
  all: './'+dir.lib+'dist/compile/all/'

# ------------ Sources ------------

src =
  coffee: dir.src + '**/*.coffee'
  less:   dir.css + '**/*.less'
  js:     dir.src + '**/*.js'
  css:    dir.css + '**/*.css'
  html:   dir.htm + '**/*.html'
  slide:  dir.htm + 'spark/spark.html'

src.watch = [src.coffee,src.less]

# -------- Images --------------

img = 
  jpg:     dir.img + '**/*.jpg'
  png:     dir.img + '**/*.png'
  svg:     dir.img + '**/*.svg'

img.all = [img.jpg,img.png,img.svg]

dist =
  js:  compile.js  + '**/*.js'
  css: compile.css + '**/*.css'
  all: compile.all + '**/*.*'

# Html transformations with Cheerio
h2Cap = ( $, file ) ->
  $('h2').each( () ->
    $h2 = $(this)
    $h2.text( $h2.text().toUpperCase() ) )

isId = ( id ) ->
  id? and typeof(id) is 'string' and id isnt ''

strObj = ( obj ) ->
  str = ''
  for own key, val of obj
    str += key + ":"   + val.toString() + ", "
  str

mkdirSync = (dir) ->
  try
    fs.mkdirSync( dir, 0o0777 )
  catch e
    # if ( e.code != 'EEXIST' ) throw e

# Html transformations with Cheerio
slideThru = ( $, talk ) ->
  console.log( 'Talk:' + talk.base )
  files  = []
  onFile = (file) ->
    files.push(file)
  onEnd = () ->
    console.log( 'onEndCalled' )
    thisOnEnd = this
    $('section').each( ( i, elem ) ->
      id = $(elem).attr('id')
      if isId(id)
        name = talk.path.replace(/htm\//,'htn/')
        name = name.substring( 0, name.lastIndexOf('/') ) + id + '.htm'
        html = $.html(elem)
        file = new File( { cwd:talk.cwd, base:talk.base, path:name, contents:new Buffer(html) } )
        console.log('  Slide Created ' + name )
        thisOnEnd.emit( 'data', file ) )
    thisOnEnd.emit('end')
  through( onFile, onEnd )

# Html transformations with Cheerio
slides = ( $, talk ) ->
  dir = talk.path.replace(/htm\//,'htn/')
  dir = dir.substring( 0, dir.lastIndexOf('/') )
  mkdirSync( dir, 0o777 )
  console.log( 'Talk:' + talk.path, dir )
  $('section').each( ( i, elem ) ->
    id = $(elem).attr('id')
    if isId(id)
      name = dir + '/' + id + '.htm'
      html = $.html(elem)
      fs.writeFile( name, html, () ->
        console.log('  Slide Created ' + name ) ) )



# ------------ Compilers / Build ------------

gulp.task 'coffee',    [], () ->  gulp.src( src.coffee ).pipe( coffee()       .on('error',gutil.log) ).pipe( gulp.dest( compile.js  ) )
gulp.task 'less',      [], () ->  gulp.src( src.less   ).pipe( less()         .on('error',gutil.log) ).pipe( gulp.dest( compile.css ) )
gulp.task 'highlight', [], () ->  gulp.src( src.html   ).pipe( highlight()    .on('error',gutil.log) ).pipe( gulp.dest( compile.htn ) )
gulp.task 'compile', ['coffee','less'], () -> console.log( 'compile')

gulp.task 'h2Cap',        [], () ->  gulp.src( src.html   )                    .pipe( cheerio(h2Cap)    .on('error',gutil.log) ).pipe( gulp.dest( compile.htn ) )
gulp.task 'slides',       [], () ->  gulp.src( src.html   ).pipe( highlight() ).pipe( cheerio(slides)   .on('error',gutil.log) )
gulp.task 'slideThrough', [], () ->  gulp.src( src.slide  ).pipe( highlight() ).pipe( cheerio(slideThru).on('error',gutil.log) ).pipe( gulp.dest( compile.htn ) )
gulp.task 'slidesPlug',   [], () ->  gulp.src( src.html   ).pipe( highlight() ).pipe( gulpSlides()      .on('error',gutil.log) ).pipe( gulp.dest( compile.htn ) )

gulp.task 'watchc', [], () ->
  gulp.watch src.watch, ['compile']
  .on('change') (event) ->
    console.log('File '+event.path+' was '+event.type+', running tasks...')

# -------------- Distribution ------------------

gulp.task 'distjs',  ['coffee'], () -> gulp.src( dist.js  ).pipe( concat( 'all.js'  ) ).pipe( uglify() ).pipe( gulp.dest( compile.all ) )
gulp.task 'distcss', ['less'],   () -> gulp.src( dist.css ).pipe( concat( 'all.css' ) )                 .pipe( gulp.dest( compile.all ) )
gulp.task 'dist',    ['distjs','distcss'], () -> console.log( 'dist')
gulp.task 'clean',   [], () -> del( [compile.js+'*',compile.css+'*',compile.htn+'*',dist.all], (err,paths) -> console.log('Deleted ', paths.join('\n') ) )

# --- All ------

gulp.task 'all', ['dist'], () -> console.log( 'all' )


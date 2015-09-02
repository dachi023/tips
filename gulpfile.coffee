gulp        = require 'gulp'
browserSync = require('browser-sync').create()
browserify  = require 'browserify'
notify      = require 'gulp-notify'
plumber     = require 'gulp-plumber'
sass        = require 'gulp-sass'
uglify      = require 'gulp-uglify'
source      = require 'vinyl-source-stream'
buffer      = require 'vinyl-buffer'
watchify    = require 'watchify'

gulp.task 'default', [
  'assets'
  'browserSync'
  'watch'
]

gulp.task 'build', [
  'assets'
  'browserify'
  'sass'
]

gulp.task 'assets', [
  'bootstrap'
  'font-awesome'
]

errorHandler = ->
  notify
    .onError
      title: 'Compile error'
      message: '<%= error %>'
    .apply @, Array.prototype.slice.call(arguments)
  @.emit 'end'

compile = (watch) ->
  b = browserify './app/app.coffee',
    debug: true
    extensions: ['.coffee', '.js']
    transform: ['coffeeify']
  if watch
    b = watchify b,  {debug: true}
  bundle = ->
    b.bundle()
    .on 'error', errorHandler
    .pipe source 'bundle.js'
    .pipe buffer()
    .pipe uglify()
    .pipe gulp.dest './public/scripts'
    .pipe browserSync.reload {stream: true}
  b.on 'update', bundle
  bundle()

gulp.task 'browserSync', ->
  browserSync.init
    server:
      baseDir: './public'
    notify: false

gulp.task 'browserify', ->
  compile false

gulp.task 'watchify', ->
  compile true

gulp.task 'bootstrap', ->
  gulp.src ['./node_modules/bootstrap-sass/assets/fonts/bootstrap/*']
  .pipe gulp.dest './public/fonts/bootstrap'

gulp.task 'font-awesome', ->
  gulp.src ['./node_modules/font-awesome/fonts/*']
  .pipe gulp.dest './public/fonts/font-awesome/'

gulp.task 'sass', ->
  gulp.src './scss/application.scss'
  .pipe plumber
    errorHandler: notify.onError
      title: 'Compile error'
      message: '<%= error.message %>'
  .pipe sass
    outputStyle: 'compressed'
    includePaths: [
      './app/scss'
      './node_modules/bootstrap-sass/assets/stylesheets'
      './node_modules/font-awesome/scss'
    ]
  .pipe gulp.dest './public/styles'

gulp.task 'html', ->
  browserSync.reload()

gulp.task 'css', ['sass'], ->
  browserSync.reload()

gulp.task 'watch', ['watchify', 'sass'], ->
  gulp.watch './public/*.html', ['html']
  gulp.watch './scss/**/*.scss', ['css']

gulp       = require "gulp"
coffeelint = require "gulp-coffeelint"
mocha      = require "gulp-mocha"
jade       = require "gulp-jade"
webserver  = require "gulp-webserver"
browserify = require "browserify"
source     = require "vinyl-source-stream"

gulp.task "default", ["watch", "webserver"]

gulp.task "watch", "", ->
  gulp.watch "**/*.coffee", [
    "lint"
    "test"
    "browserify"
  ]
  gulp.watch "jade/*.jade", ["template"]



gulp.task "lint", ->
  gulp
    .src [
      "*.coffee"
      "src/*.coffee"
      "test/*.coffee"
    ]
    .pipe coffeelint ".coffeelint"
    .pipe coffeelint.reporter()

gulp.task "coffee-lint"

gulp.task "test", ->
  gulp
    .src(
      [
        "test/*.coffee"
      ]
      read: false
    )
    .pipe mocha
      reporter: "spec"

gulp.task "template", ->
  gulp
    .src(["jade/*.jade"])
    .pipe jade(
      pretty:true
    )
  .pipe gulp.dest "./dist"

gulp.task "webserver", ->
  gulp.src "dist"
    .pipe webserver(
      livereload:true
      # fallback: "./index.html"
    )
gulp.task "browserify", ->
  browserify(
    entries: ["./src/app.coffee"]
    extentions: [".coffee"]
  )
  .bundle()
  .pipe source "build.js"
  .pipe gulp.dest "./dist/js/"


gulp       = require "gulp"
coffeelint = require "gulp-coffeelint"
mocha      = require "gulp-mocha"

gulp.task "lint", ->
  gulp
    .src [
      "*.coffee"
      "src/*.coffee"
      "test/*.coffee"
    ]
    .pipe coffeelint(".coffeelint")
    .pipe coffeelint.reporter()

gulp.task "coffee-lint"

gulp.task "watch", "", ->
  gulp.watch "**/*.coffee", [
    "lint"
    "test"
  ]

gulp.task "default", ["watch"]

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

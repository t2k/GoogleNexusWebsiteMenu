gulp          = require 'gulp'
del           = require 'del'
coffee        = require 'gulp-coffee'
umd           = require 'gulp-umd'


src       = './src/coffee'
dist      = './dist'


# CLEAN TASK
# delete build folders for client and server projects
gulp.task 'clean',->
  del ["#{dist}/**/*"]

# COPY TASKS
gulp.task 'cpy-misc-js', ['clean'], ->
  task = gulp.src ['./src/js/modernizr.custom.js']
    .pipe gulp.dest dist
  task.on 'error', (err)->
    console.warn "cpy-misc-js:", err.message


gulp.task 'compile-coffee-classie', ['clean'],  ->
  # bare false for AMD client modules wraps modules
  task = gulp.src "#{src}/classie.coffee"
    .pipe coffee bare: true  # wrap js modules
    .pipe umd
      exports: ->
        return 'classie'
    .pipe gulp.dest dist
  task.on 'error', (err)->
    console.warn "compile-coffee:", err.message


gulp.task 'compile-coffee-gnmenu', ['clean'],  ->
  # bare false for AMD client modules wraps modules
  task = gulp.src "#{src}/gnmenu.coffee"
    .pipe coffee bare: true  # wrap js modules
    .pipe umd
      dependencies:->
        return [
          name: "classie"
          amd: "classie"
          cjs: "classie"
          global: "classie"
          param: "classie"
        ]
      exports: ->
        return 'gnMenu'

    .pipe gulp.dest dist
  task.on 'error', (err)->
    console.warn "compile-coffee:", err.message


gulp.task 'build', ['cpy-misc-js','compile-coffee-classie','compile-coffee-gnmenu']


# Define the default task as a sequence of the above tasks
gulp.task 'default', ['build']




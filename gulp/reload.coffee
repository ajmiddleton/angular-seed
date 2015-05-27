reload = require('browser-sync').reload
runSequence = require('run-sequence')

module.exports = (gulp)->
  gulp.task 'reload-coffee', 'Used by serve task to reload the webpage on change', (cb)->
    runSequence 'compile-coffee-dev', 'build-index', 'reload', cb
  gulp.task 'reload-jade', 'Used by serve task to reload the webpage on change', (cb)->
    runSequence 'compile-jade', 'build-index', 'reload', cb
  gulp.task 'reload-less', 'Used by serve task to reload the webpage on change', (cb)->
    runSequence 'compile-less', 'build-index', 'reload', cb
  gulp.task 'reload', ->
    reload()

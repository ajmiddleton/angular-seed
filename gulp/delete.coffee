del = require('del')

module.exports = (gulp)->
  gulp.task 'clean', 'Deletes the public folder', (cb) ->
    del [
      gulp.paths.DIST
    ], {force: true}, cb
    return

  gulp.task 'delete-haml', 'Deletes all haml files in app/modules', (cb)->
    del [
      'app/modules/**/*.haml'
    ], cb

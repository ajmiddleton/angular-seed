del = require('del')

module.exports = (gulp)->
  gulp.task 'clean', 'Deletes the public folder', (cb) ->
    del [
      gulp.paths.DIST
    ], {force: true}, cb
    return

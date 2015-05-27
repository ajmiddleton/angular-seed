karma = require('karma').server
module.exports = (gulp)->
  gulp.task 'test-unit', 'Run unit tests', (cb)->
    karma.start {
      configFile: __dirname + '/../karma.conf.js'
      singleRun: true
    }, cb

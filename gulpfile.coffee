gulp = require('gulp-help')(require('gulp'))
gulp.paths = {}
gulp.paths.DIST = __dirname + '/../public'

fs = require('fs')
path = require('path')

fs.readdirSync(__dirname + '/gulp')
  .forEach (file)=>
    require(path.join(__dirname + '/gulp', file))(gulp)
gulp.task 'default', 'Alias for build', [ 'build' ]

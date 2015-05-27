mainBowerFiles = require('main-bower-files')
_ = require('lodash')
concat = require('gulp-concat')
rev = require('gulp-rev')
gutil = require('gulp-util')

module.exports = (gulp)->
  gulp.task 'minify-bower', 'Concat and minify bower files', ->
    sources = mainBowerFiles {includeDev: true, paths: {bowerDirectory: 'app/bower_components', bowerJson: './bower.json'}}
    jsSources = _.filter sources, (str)-> str.indexOf('.js') > 1
    sources = _.reject sources, (str)-> str.indexOf('.js') > 1

    cssSources = _.filter sources, (str)-> str.indexOf('.css') > 1
    miscSources = _.reject sources, (str)-> str.indexOf('.css') > 1

    gulp.src(jsSources)
      .pipe concat('vendor.js').on('error', gutil.log)
      .pipe rev()
      .pipe gulp.dest(gulp.paths.DIST)

    gulp.src cssSources
      .pipe concat('vendor.css').on('error', gutil.log)
      .pipe rev()
      .pipe gulp.dest(gulp.paths.DIST)

    # specific dependencies due to bugs or random shit
    randos = ['app/bower_components/bootstrap-select/dist/css/bootstrap-select.css.map', 'app/bower_components/ace-builds/src-noconflict/worker-json.js', 'app/404.html', 'app/favicon.ico', 'app/robots.txt']
    gulp.src randos
      .pipe gulp.dest(gulp.paths.DIST)

    gulp.src miscSources, {base: 'app/bower_components'}
      .pipe gulp.dest(gulp.paths.DIST + '/bower_components')

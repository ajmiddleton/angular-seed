gutil = require('gulp-util')
coffee = require('gulp-coffee')
less = require('gulp-less')
ngAnnotate = require('gulp-ng-annotate')
uglify = require('gulp-uglify')
concat = require('gulp-concat')
rev = require('gulp-rev')
jade = require('gulp-jade')

module.exports = (gulp)->
  gulp.task 'compile-coffee', 'Compiles all coffescript files in app/ into the public folder', ->
    gulp.src('app/modules/**/*.coffee')
      .pipe(coffee(bare: true).on('error', gutil.log))
        .pipe(ngAnnotate()).on('error', gutil.log)
        .pipe(uglify()).on('error', gutil.log)
        .pipe(concat('scripts.js')).on('error', gutil.log)
        .pipe(rev())
      .pipe(gulp.dest(gulp.paths.DIST))

  gulp.task 'compile-coffee-dev', 'Compiles all coffescript files without concatenating', ->
    gulp.src('app/modules/**/*.coffee', {base: 'app'})
      .pipe(coffee(bare: true).on('error', gutil.log))
        .pipe(ngAnnotate()).on('error', gutil.log)
        .pipe(uglify()).on('error', gutil.log)
      .pipe(gulp.dest(gulp.paths.DIST))

  gulp.task 'compile-jade', 'Compile all jade files in app/ into the public folder', ->
    gulp.src('app/modules/**/*.jade')
      .pipe(jade()).on('error', gutil.log)
      .pipe(gulp.dest(gulp.paths.DIST + '/modules'))

  gulp.task 'compile-less', 'Compiles all less files in app/ into the public folder', ['minify-bower'], ->
    gulp.src('app/modules/**/*.less')
      .pipe(less())
      .pipe(gulp.dest(gulp.paths.DIST + '/styles'))

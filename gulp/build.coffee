inject = require('gulp-inject')
runSequence = require('run-sequence')
gutil = require('gulp-util')

module.exports = (gulp)->
  gulp.task 'build-index', 'Builds index.html by injecting script and css tags', ->
    target = gulp.src 'app/index.html'
    sources = []
    sources.push './vendor-*.js'
    sources.push './vendor/*.js'
    sources.push './vendor-*.css'
    sources.push './scripts-*.js'
    sources.push './modules/**/*.{js, css}'
    sources.push './styles/*.css'
    sources = gulp.src sources, {read: false, cwd: gulp.paths.DIST}

    return target.pipe(inject(sources)).on('error', gutil.log).pipe(gulp.dest(gulp.paths.DIST))

  gulp.task 'build', 'Will produce public folder', (cb)->
    compile = ['compile-coffee', 'compile-jade', 'compile-less', 'minify-bower']
    runSequence 'clean', compile, 'build-index', cb

  gulp.task 'build-dev', 'Will produce the /public folder for development', (cb)->
    compile = ['compile-coffee-dev', 'compile-jade', 'compile-less', 'minify-bower']
    runSequence 'clean', compile, 'build-index', cb

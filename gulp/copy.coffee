module.exports = (gulp)->
  gulp.task 'copy-styles', 'Copy the styles directory to the public folder', ->
    gulp.src 'app/styles/*.css'
      .pipe gulp.dest(gulp.paths.DIST + '/styles')

  gulp.task 'copy-images', 'Copy the images folder to public', ->
    gulp.src 'app/images/*.{png, gif, jpeg}'
      .pipe gulp.dest(gulp.paths.DIST + '/images')

    #stupid ass jQuery plugin has an imagepath bug
    gulp.src 'app/bower_components/select2/select2.png'
      .pipe gulp.dest(gulp.paths.DIST)

  gulp.task 'copy-fonts', 'Copy the fonts folder to public', ->
    gulp.src 'app/fonts/*'
      .pipe gulp.dest(gulp.paths.DIST + '/fonts')

  gulp.task 'copy-vendor', 'Copy specific vendor files to public', ->
    gulp.src ['app/vendor/jquery.ui.boxer.js', 'app/vendor/easy-timezones/lib/timezones.full.js']
      .pipe gulp.dest(gulp.paths.DIST + '/vendor')

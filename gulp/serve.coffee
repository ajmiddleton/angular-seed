browserSync = require('browser-sync')
url = require('url')
proxy = require('proxy-middleware')

module.exports = (gulp)->
  gulp.task 'serve', 'Build client side files and launch development server', ['build-dev'], ->
    proxyOptions = url.parse('http://localhost:3000/yo');
    proxyOptions.route = '/yo';
    browserSync({
      open: true,
      port: 9000,
      server: {
        baseDir: gulp.paths.DIST,
        middleware: [proxy(proxyOptions)]
      }
    });

    gulp.watch('./app/modules/**/*.coffee', ['reload-coffee']);
    gulp.watch('./app/modules/**/*.jade', ['reload-jade']);
    gulp.watch('./app/modules/**/*.less', ['reload-less']);

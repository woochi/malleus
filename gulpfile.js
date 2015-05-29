'use strict';

var gulp = require('gulp');
var del = require('del');


// Load plugins
var assign = Object.assign || require('object.assign');
var $ = require('gulp-load-plugins')();
var browserify = require('browserify');
var watchify = require('watchify');
var sequence = require('run-sequence');
var buffer = require('vinyl-buffer');
var source = require('vinyl-source-stream'),
    sourceFile = './app/scripts/app.coffee',
    destFolder = './dist/scripts',
    destFileName = 'app.js';

// Styles
gulp.task('styles', function () {
  gulp.src('app/styles/main.sass')
    .pipe($.sass({
      indentedSyntax: true,
      errorLogToConsole: true,
      onError: $.util.log
    }))
    .pipe($.autoprefixer('last 1 version'))
    .pipe(gulp.dest('dist/styles'))
    .pipe($.size())
    .pipe($.livereload());
});


var options = {
  extensions: [".coffee"],
  paths: ["./app/scripts"]
};
assign(options, watchify.args);
var bundler = watchify(browserify(options));
bundler.add('./app/scripts/app.coffee');
bundler.transform("coffee-reactify", {extension: ".coffee"});
bundler.on('update', rebundle);
bundler.on("log", $.util.log);

function rebundle() {
  bundler.bundle()
    .on('error', $.util.log.bind($.util, 'Browserify Error'))
    .pipe(source("app.js"))
    .pipe(buffer())
    .pipe(gulp.dest(destFolder))
    .pipe($.livereload());
}

// Scripts
gulp.task('scripts', rebundle);

// HTML
gulp.task('html', function () {
  return gulp.src('./app/*.html')
    .pipe(gulp.dest('dist'))
    .pipe($.size())
    .pipe($.livereload());
});

// Clean
gulp.task('clean', function (cb) {
    cb(del.sync(['./dist/styles', './dist/scripts', './dist/images']));
});

// Bundle
gulp.task('bundle', ['styles', 'scripts'], function(){
  gulp.src('./app/*.html')
    .pipe(gulp.dest('dist'))
    .pipe($.livereload());
});

// Webserver
gulp.task('serve', function (next) {
  $.connect.server({
    port: 4321,
    root: "./dist",
    fallback: "./dist/index.html"
  });
  next();
});

gulp.task('json', function() {
  gulp.src('app/scripts/json/**/*.json', {base: 'app/scripts'})
    .pipe(gulp.dest('dist/scripts/'));
});

// Robots.txt and favicon.ico
gulp.task('extras', function () {
  return gulp.src(['app/*.txt', 'app/*.ico'])
      .pipe(gulp.dest('dist/'))
      .pipe($.size());
});

// Watch
gulp.task('watch', function () {
  $.livereload.listen()
  // Watch .json files
  gulp.watch('app/scripts/**/*.json', ['json']);

  // Watch .html files
  gulp.watch('app/*.html', ['html']);

  // Watch .scss files
  gulp.watch('app/styles/**/*.sass', ['styles']);
});

// Build
gulp.task('build', ['html', 'bundle', 'extras']);

// Default task
gulp.task('default', function(callback){
  sequence(
    "clean",
    "build",
    ["watch", "serve"],
    callback
  )
});

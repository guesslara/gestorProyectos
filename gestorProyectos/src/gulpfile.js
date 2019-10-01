'use strict'

const gulp = require("gulp"),
	  postCss = require("gulp-postcss"),
	  sass = require("gulp-sass"),
	  autoprefixer = require("gulp-autoprefixer"),
	  cleanCSS = require('gulp-clean-css');

gulp.task('estilosP', () =>
	gulp.src('source/scss/*.scss')
		.pipe(sass().on('error', sass.logError))
		.pipe(autoprefixer())
		// .pipe(cleanCSS({inline: ['local']}))
		.pipe(gulp.dest('../dist/css/'))
);

gulp.task('default', () =>
	gulp.watch('source/scss/*.scss',['estilosP'])
);

const grunt = require('grunt');
const sass = require('node-sass');
 
require('load-grunt-tasks')(grunt);
 
grunt.initConfig({
    sass: {
        options: {
            implementation: sass,
            sourceMap: false
        },
        dist: {
            files: [{
                expand: true,
                src: 'css/**/*.scss',
                dest: '.',
                ext: '.css',
            }]
        }
    }
});
 
grunt.registerTask('default', ['sass']);
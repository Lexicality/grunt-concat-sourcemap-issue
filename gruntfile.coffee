
module.exports = (grunt) =>

    grunt.initConfig
        concat:
            one:
                src: [
                    'a.js'
                    'b.js'
                ]
                dest: 'built.js'
            three:
                src: 'built.js'
                dest: 'package.js'
            options:
                sourceMap: true
                sourceMapStyle: 'embed'
        uglify:
            two:
                src: 'built.js'
                dest: 'built.js'
            options:
                sourceMap: true
                sourceMapIncludeSources: true
                sourceMapIn: (f) => f + '.map'
                sourceMapRoot: ''


    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');

    grunt.registerTask 'default', [
        'concat:one'
        'uglify:two'
        'concat:three'
    ]

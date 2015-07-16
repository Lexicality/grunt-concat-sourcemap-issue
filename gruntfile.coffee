
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
            two_two:
                src: [
                    'a.min.js'
                    'b.min.js'
                ]
                dest: 'stubs.js'
            options:
                sourceMap: true
                sourceMapStyle: 'embed'
        uglify:
            two_one:
                src: [
                    'a.js'
                    'b.js'
                ]
                dest: '.'
                ext: '.min.js'
                expand: true
                options:
                    sourceMapIn: false
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
        'crash'
    ]

    grunt.registerTask 'crash', [
        'concat:one'
        'uglify:two'
        'concat:three'
    ]

    grunt.registerTask 'stubs', [
        'uglify:two_one'
        'concat:two_two'
    ]

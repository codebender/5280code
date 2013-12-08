module.exports = (config) ->
  config.set
    basePath: __dirname + '../../../../',
    autoWatch: true
    frameworks: ['jasmine']
    files: [
      # asset pipeline
      'http://localhost:3000/assets/application.js'

      # angular mocks
      'http://localhost:3000/assets/angular-mocks.js'

      # specs
      'spec/javascripts/angular/**/*_spec.coffee'

      # don't serve individual js files, but trigger re-run on change
      { pattern: 'app/assets/javascripts/**/*.js', watched: true, included: false, served: false }
      { pattern: 'app/assets/javascripts/**/*.coffee', watched: true, included: false, served: false }

    ]
    reporters: ['progress']
    port: 9876
    runnerPort: 9100
    browsers: ['PhantomJS']
    singleRun: false
    urlRoot: '/__karma__/'

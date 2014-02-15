Meteor.startup ->

  Setup.publish()

  SetupIssues =
    settings: {}

    config: (appConfig) ->
      @settings = _.extend(@settings, appConfig)

  @SetupIssues = SetupIssues

class @Setup
  @publish: ->
    Meteor.publish "issues", () ->
      Issues.find({})
    Meteor.publish "versions", () ->
      Versions.find({})

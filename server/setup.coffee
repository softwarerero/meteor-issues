Meteor.startup ->

#  console.log "startup issues"
  Setup.publish()

  SetupIssues =
    settings: {}

    config: (appConfig) ->
      @settings = _.extend(@settings, appConfig)
      console.log "hi8: " + @settings

#    publish: ->
#      Meteor.publish "issues", () ->
#        Issues.find({})

  @SetupIssues = SetupIssues


#SetupIssues =
#  settings: {}
#
#  config: (appConfig) ->
#    @settings = _.extend(@settings, appConfig)
#    alert "hi2: " + @settings
#
#@SetupIssues = SetupIssues


class @Setup
  @publish: ->
    Meteor.publish "issues", () ->
      Issues.find({})

#@IssuesSetup = IssuesSetup


#  Meteor.methods
#    entryValidateSignupCode: (signupCode) ->
#      signupCode is AccountsEntry.settings.signupCode
#
#    accountsCreateUser: (username, email, password) ->
#      if username
#        Accounts.createUser
#          username: username,
#          email: email,
#          password: password,
#          profile: AccountsEntry.settings.defaultProfile || {}
#      else
#        Accounts.createUser
#          email: email
#          password: password
#          profile: AccountsEntry.settings.defaultProfile || {}

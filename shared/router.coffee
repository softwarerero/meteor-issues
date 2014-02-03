Router.map ->

  @route "issues",
    path: "/issues"
#  @route "issueNew",
#    path: "/issue"
  @route "issue",
    path: "/issue/:id"
    data: () ->
      id: @params.id
      user: Meteor.users.findOne { _id: @params.id }
    waitOn: ->
      Meteor.subscribe("issues")

#    before: ->
#      Session.set('entryError', undefined)
#      Session.set('buttonText', 'in')


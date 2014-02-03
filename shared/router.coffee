Router.map ->

  @route "issues",
    path: "/issues"
  @route "issue",
    path: "/issue/:id"
    data: () ->
      id: @params.id
      user: Meteor.users.findOne { _id: @params.id }
    waitOn: ->
      Meteor.subscribe("issues")

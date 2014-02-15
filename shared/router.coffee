Router.map ->

  @route "issues",
    path: "/issues"
  @route "issue",
    path: "/issue/:id"
    data: () ->
      id: @params.id
    waitOn: ->
      Meteor.subscribe("issues")

  @route "versions",
    path: "/versions"
  @route "version",
    path: "/version/:id"
    data: () ->
      id: @params.id

  @route "releaseNotes",
    path: "/releaseNotes"

collectionName = "versions"
entityName = "version"
Meteor.subscribe(collectionName)
versionsForm = new AutoForm(Versions)

versionsForm.hooks
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    Router.go(collectionName)
  onError: (operation, error, template) ->
    console.log "operation: " + operation + ", error: " + error
  before:
    insert: (doc) ->
      user = Session.get "user"
      doc.user = user._id
      console.log "insert " + JSON.stringify doc
      doc
    remove: (id) ->
      ret = confirm("En serio?");
      Router.go(collectionName)
      ret

Template.versions.helpers
  versions: () ->
    Versions.find({}, {sort: [["name", "desc"]]})

Template.versions.events
  "click .tableRow": (event, template) ->
    id = $(event.target).parent().attr("uid")
    if (id)
      Router.go(entityName, {id: id})

  'click .create': (event, template) ->
    Router.go(entityName, {id: "new"})

Template.version.helpers
  schema: () ->
    versionsForm
  doc: () ->
    if this.id is "new"
      product: Meteor.settings.public.systemName
    else
      Versions.findOne { _id: this.id }

Template.version.events
  'click .cancel': (event, template) ->
    event.preventDefault()
    Router.go(collectionName)

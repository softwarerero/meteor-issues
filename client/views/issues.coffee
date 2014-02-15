collectionName = "issues"
entityName = "issue"
Meteor.subscribe(collectionName)
IssuesForm = new AutoForm(Issues)

IssuesForm.hooks
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    Router.go(collectionName)
  onError: (operation, error, template) ->
    console.log "operation: " + operation + ", error: " + error
  before:
    insert: (doc) ->
#      user = Session.get "user"
#      user = Meteor.user()
#      doc.user = user._id
#      doc
      console.log "insert " + JSON.stringify doc
      doc
    remove: (id) ->
      ret = confirm("En serio?");
      Router.go(collectionName)
      ret

Template.issues.helpers
  issues: () ->
    Issues.find({}, {sort: [["name", "desc"]]})

Template.issues.events
  "click .tableRow": (event, template) ->
    id = $(event.target).parent().attr("uid")
    if (id)
      Router.go(entityName, {id: id})

  'click .create': (event, template) ->
    Router.go(entityName, {id: "new"})

Template.issue.helpers
  schema: () ->
    IssuesForm
  doc: () ->
    if this.id is "new"
      foundBy: Meteor.userId
      product: IssueConfig.systemName
      foundInVersion: IssueConfig.systemVersion
      foundAt: new Date
      state: "new"
    else
      Issues.findOne { _id: this.id }

Template.issue.events
  'click .cancel': (event, template) ->
    event.preventDefault()
    Router.go(collectionName)

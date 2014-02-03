#class Issues
#  @hasRole: (user, role) ->
#    return Meteor.users.findOne { _id: user.id, "profile.role": role }
#  @hasRole: (role) ->
#    user = Meteor.users.findOne {"_id": Meteor.userId() }
#    user?.profile?.role == role
#
#  @isAdmin: (role) ->
#    @hasRole("admin")
#  @isOficial: (role) ->
#    @hasRole("oficial")
#  @isVendedor: (role) ->
#    @hasRole("vendedor")

collectionName = "issues"
entityName = "issue"
Meteor.subscribe(collectionName)
#IssuesForm = new AutoForm(Issues)
IssuesForm = new AutoForm(Issues)

IssuesForm.hooks
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    Router.go(collectionName)
  onError: (operation, error, template) ->
    console.log "operation: " + operation + ", error: " + error
  before:
    insert: (doc) ->
      user = Session.get "user"
      doc.user = user._id
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
#    Router.go(entityName)

Template.issue.helpers
  schema: () ->
    IssuesForm
  doc: () ->
    if this.id is "new"
      foundBy: (Session.get "user")._id
      product: Meteor.settings.public.systemName
      foundInVersion: Meteor.settings.public.version
      foundAt: new Date
      state: "new"
    else
      Issues.findOne { _id: this.id }

Template.issue.events
  'click .cancel': (event, template) ->
    event.preventDefault()
    Router.go(collectionName)

#  'click .remove': (event, template) ->
#    event.preventDefault()
#    id = $(".id").val()
#    #    alert(id)
#    if confirm("En serio?")
#      Meteor.call "deleteUser", id, (error, result) ->
#        console.log('created user: ' + error + ", " + JSON.stringify(result))
#        displayResult(error, result)
#        Router.go(collectionName)



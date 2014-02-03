#if not ("setTitle" in Handlebars._default_helpers)
#  Handlebars.registerHelper "setTitle", (title) ->
#    systemName = if Session.get "systemName"
#      Session.get("systemName") + " - "
#    else
#      ""
#    if(title)
#      document.title = systemName + title
#    ""


Handlebars.registerHelper "issueStates", () ->
  ({value: k, label: v} for k, v of i18n "issueState")

Handlebars.registerHelper "users", () ->
  users = Meteor.users.find().fetch()
  ret = ({value: u._id, label: u.profile.name} for u in users)
  ret.splice 0, 0, {value: "", label: "-"}
  ret
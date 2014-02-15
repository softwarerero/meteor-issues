if not Handlebars._default_helpers['setTitle']
  Handlebars.registerHelper "setTitle", (title) ->
    systemName = if Session.get "systemName"
      Session.get("systemName") + " - "
    else
      ""
    if(title)
      document.title = systemName + title
    ""

Handlebars.registerHelper "issueStates", () ->
  ({value: k, label: v} for k, v of i18n "issueState")

Handlebars.registerHelper "users", () ->
  users = Meteor.users.find().fetch()
  ret = ({value: u._id, label: u.profile.name} for u in users)
  ret.splice 0, 0, {value: "", label: "-"}
  ret

Handlebars.registerHelper "versions", () ->
  objs = Versions.find().fetch()
  ret = ({value: o._id, label: o.name} for o in objs)
  ret.splice 0, 0, {value: "", label: "-"}
  ret

Handlebars.registerHelper 'versionName', (id) ->
  if not id then return ''
  v = Versions.findOne {"_id": id }
  v.name

Handlebars.registerHelper 'userName', (id) ->
  if not id then return ''
  u = Meteor.users.findOne {_id: id}
  console.log "u: #{u}"
  if u then u.profile?.name else ''

if not Handlebars._default_helpers['formatDateShort']
  Handlebars.registerHelper "formatDateShort", (datetime) ->
    if (moment && datetime)
      moment.utc(datetime).format("DD.MM.YY")
    else
      datetime

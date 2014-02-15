#@Versions = new Meteor.Collection2 "versions",
#  schema:
#    version:
#      type: String
#      label: "Version"

#TODO move to collection
#versions = ["-", "1.0.0", "1.0.1"]

@Issues = new Meteor.Collection2 "issues",
  schema:
    title:
      type: String
      label: i18n "title"
    description:
      type: String
      label: i18n "description"
      optional: true
    stepsToReproduce:
      type: String
      label: i18n "stepsToReproduce"
      optional: true
    product:
      type: String
      label: i18n "product"
    foundInVersion:
      type: String
      label: i18n "foundInVersion"
#      allowedValues: versions
    foundBy:
      type: String
      label: i18n "foundBy"
      optional: true
    foundAt:
      type: Date
      label: i18n "foundAt"
    solvedInVersion:
      type: String
      label: i18n "solvedInVersion"
#      allowedValues: versions
      optional: true
    solvedBy:
      type: String
      label: i18n "solvedBy"
      optional: true
    solvedAt:
      type: Date
      label: i18n "solvedAt"
      optional: true
    state:
      type: String
      label: i18n "state"
      optional: true


#TODO some checks
@Issues.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true
  fetch: []

@Versions = new Meteor.Collection2 "versions",
  schema:
    name:
      type: String
      label: i18n "name"
    product:
      type: String
      label: i18n "product"

@Versions.allow
  insert: () ->
    true
  update: () ->
    true
  remove: () ->
    true
  fetch: []

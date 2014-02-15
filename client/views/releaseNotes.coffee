Template.releaseNotes.helpers
  releaseNotes: () ->
    Issues.find {solvedInVersion: {$exists: true}}, {sort: [["solvedInVersion", "asc"], ["solvedAt", "asc"]]}
#  issue: ->
#    console.log "modalIssue: " + Session.get 'issueId'
#    Issues.findOne {_id: Session.get 'issueId'}

#Template.releaseNotes.events
#  "click .tableRow": (event, template) ->
#    id = $(event.target).parent().attr("uid")
#    Session.set 'currentIssueId', id
#    console.log "title: " + (Issues.findOne {_id: Session.get 'currentIssueId'}).title
#    $('#modalIssue').modal({})

#Template.modalIssue.helpers
#  issue: ->
#    console.log "modalIssue: " + Session.get 'issueId'
#    Issues.findOne {_id: Session.get 'issueId'}
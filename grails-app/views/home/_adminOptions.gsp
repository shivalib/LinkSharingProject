<g:select name="visibility" from="${com.ig.LinkShare.applicationEnums.Visibility}" value="${topic.visibility}"
          data-changeVisibility="${createLink(controller: "subscription", action: "changeVisibility")}"
          data-topic-id="${topic.id}"/>


<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myEditModal-${topic.topicName}">
    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
</button>


<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myEditModal-${topic.id}">
    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
</button>
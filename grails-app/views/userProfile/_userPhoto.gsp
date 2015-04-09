<a href="${createLink(controller: "userProfile", action: "showUserPublicProfile", params: [id: loginUser.id])}">

    <img src="${createLink(controller: "image", action: "renderImage", params: [path: loginUser.photoPath])}"
         class="media-object mediaFace">

</a>
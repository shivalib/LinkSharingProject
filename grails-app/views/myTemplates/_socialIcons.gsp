
<div class="fb-share-button" data-href="${g.createLink(controller: "showPost",action: "index",id:resourceID)}" data-layout="button_count"></div>


%{--<div class="fb-share-button"--}%
     %{--data-href="${createLink(controller: "home", action: "shareResource", params: [resourceID: resource.id])}"--}%
     %{--data-layout="button_count"></div>--}%

<button type="button" class="btn btn-default btn-sm">
    <span><img src="${resource(dir: "images", file: "facebook.png")}" class="icon img-rounded"/></span>
</button>

<button type="button" class="btn btn-default btn-sm">
    <span><img src="${resource(dir: "images", file: "twitter-icon.png")}" class="icon img-rounded"/></span>
</button>

<button type="button" class="btn btn-default btn-sm">
    <span><img src="${resource(dir: "images", file: "icon_google_plus.png")}" class="icon img-rounded"/></span>
</button>
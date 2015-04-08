<div class="fb-share-button" data-href="${g.createLink(controller: "showPost", action: "index", id: resourceID)}"
     data-layout="button_count"></div>


<div class="g-plus" data-href="${g.createLink(controller: "showPost", action: "index", id: resourceID)}"
     data-action="share" data-annotation="bubble"></div>

<a href="https://twitter.com/share" class="twitter-share-button"
   data-url="${g.createLink(controller: "showPost", action: "index", id: resourceID,absolute: true)}"
   data-via="LinkShareApplication" data-text="Have a look at this!">Tweet</a>

%{--<button type="button" class="btn btn-default btn-sm">--}%
%{--<span><img src="${resource(dir: "images", file: "facebook.png")}" class="icon img-rounded" /></span>--}
%{--</button>--}%

%{--<button type="button" class="btn btn-default btn-sm">--}%
%{--<span><img src="${resource(dir: "images", file: "twitter-icon.png")}" class="icon img-rounded"/></span>--}%
%{--</button>--}%

%{--<button type="button" class="btn btn-default btn-sm">--}%
%{--<span><img src="${resource(dir: "images", file: "icon_google_plus.png")}" class="icon img-rounded"/></span>--}%
%{--</button>--}%
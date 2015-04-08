<div class="fb-share-button" data-href="${g.createLink(controller: "showPost", action: "index", id: resourceID)}"
     data-layout="button_count"></div>

%{--<div class="g-plus" data-href="${g.createLink(controller: "showPost",action: "index",id:resourceID)}" data-action="share"></div>--}%

%{--<a href="${g.createLink(controller: "showPost", action: "index", id: resourceID)}"--}%
%{--onclick="javascript:window.open(this.href,--}%
%{--'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');--}%
%{--return false;">--}%
%{--<img src="https://www.gstatic.com/images/icons/gplus-32.png" alt="Share on Google+"/></a>--}%

<div class="g-plus" data-href="${g.createLink(controller: "showPost", action: "index", id: resourceID)}"
     data-action="share"></div>




%{--<button type="button" class="btn btn-default btn-sm">--}%
%{--<span><img src="${resource(dir: "images", file: "facebook.png")}" class="icon img-rounded" /></span>--}
%{--</button>--}%

<button type="button" class="btn btn-default btn-sm">
    <span><img src="${resource(dir: "images", file: "twitter-icon.png")}" class="icon img-rounded"/></span>
</button>

%{--<button type="button" class="btn btn-default btn-sm">--}%
%{--<span><img src="${resource(dir: "images", file: "icon_google_plus.png")}" class="icon img-rounded"/></span>--}%
%{--</button>--}%
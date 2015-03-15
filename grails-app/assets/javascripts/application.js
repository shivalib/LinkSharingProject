// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self
//=require jquery-2.1.3.js

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

$(document).ready(function() {

    $("#dialogPlaceholder").dialog({
        autoOpen: false,
        height: 200,
        width: 350,
        modal: true,
        title: 'modal window',
        close: function(){
            $("#dialogPlaceholder").html('');
        }
    });

    $("#trigger_btn").bind("click", function() {
        $.ajax({
            url:'/JqueryModalController/getContentForDialog',
            success: function(data){
                $("#dialogPlaceholder").html(data);
                $("#dialogPlaceholder").dialog("open");
            }
        });
    });

});
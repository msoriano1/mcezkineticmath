// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery3
//= require bootstrap-sprockets
//= require_tree .
//= require cocoon
//= require bootstrap 

$(document).ready(function(){
	function ToggleActivePills(li){
	    $(li).parent().find(".active").removeClass("active");
	    $(li).addClass("active");
	    console.log("did the switch!");
	}
	$('.navbar .dropdown').hover(function () {
        $(this).find('.dropdown-menu').stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.dropdown-menu').stop(true, true).slideUp(105);
    });
    $('.custom-file-input').on('change',function(){
        //get the file name
        var fileName = $(this).val();
        //replace the "Choose a file" label
        $('.custom-file-label').html(fileName);
    })
});
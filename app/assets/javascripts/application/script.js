$(document).ready(function(){

// navigation

	$('.header-logo').click(function(e){
		e.preventDefault();
		$('html, body').animate({scrollTop:'0px'}, 600, function() {
			location.hash = '';
		});
		return false;
	});

	$(window).scroll(function(e){

		if( typeof( window.pageYOffset ) == 'number' )
		{
		offset = window.pageYOffset;
		} else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
		//DOM compliant
		offset = document.body.scrollTop;
		} else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
		//IE6 standards compliant mode
		offset = document.documentElement.scrollTop;
		}
		if( offset == 0 )
		{
			$('.header-menu li').removeClass('current');
			return;
		}
		var prev = 0;
		var delta = 500;
		var anchor = false;
		$('section').each(function()
		{
			var top = $(this).offset().top;
			var bottom = top + $(this).height();

			if ((offset >= (top - delta)) && (offset < (bottom + delta)))
			{
				anchor = $(this).prev('.section-header').attr('id');
			}
		});
		if (anchor)
		{
			$('.header-menu a[href="#'+anchor+'"]').parent().addClass('current').siblings().removeClass('current');
			//Работает некорректно
			//window.location.hash = anchor;
		}
	});

	$('.header-menu a, .nav-link').click(function () {
		elementClick = $(this).attr('href');
		destination = $(elementClick.split('/').join('\\/')).offset().top;
		$('html:not(:animated),body:not(:animated)').animate({ scrollTop: destination}, 600, function () {
			window.location.hash = elementClick;
		});
		return false;
	});

// placeholder
	$('input[placeholder], textarea[placeholder]').placeholder();

// jobs list
	$('.jobs-title-item h4 a').click(function(e){
		e.preventDefault();
		$(this).parent().toggleClass('open').next().slideToggle();
	});

// feedback-loader
	$('.feedback .button').click(function(){
		 $('.feedback-loader').show();
	});
	
// feedback-done submit
	$('.feedback-done .button').click(function(e){
		e.preventDefault();
		$('.feedback-loader').hide();
		$('.feedback').slideDown();
		$('.feedback-done').slideUp();
	});

// height of contacts section
	var minMagicHeight = $('.js-magic-height').height(),
	    otherElementsHeight = $('footer').height() + $('header').height() + parseInt($('.js-magic-height').prev().css('margin-bottom'));
	function fixMagicHeight () {
		var optimalHeight = $(window).height() - otherElementsHeight;
		$('.js-magic-height').height( Math.max(minMagicHeight, optimalHeight) );
	}
	fixMagicHeight();
	$(window).resize(fixMagicHeight);

});




// placeholder
(function(b){function d(a){this.input=a;a.attr("type")=="password"&&this.handlePassword();b(a[0].form).submit(function(){if(a.hasClass("placeholder")&&a[0].value==a.attr("placeholder"))a[0].value=""})}d.prototype={show:function(a){if(this.input[0].value===""||a&&this.valueIsPlaceholder()){if(this.isPassword)try{this.input[0].setAttribute("type","text")}catch(b){this.input.before(this.fakePassword.show()).hide()}this.input.addClass("placeholder");this.input[0].value=this.input.attr("placeholder")}},
hide:function(){if(this.valueIsPlaceholder()&&this.input.hasClass("placeholder")&&(this.input.removeClass("placeholder"),this.input[0].value="",this.isPassword)){try{this.input[0].setAttribute("type","password")}catch(a){}this.input.show();this.input[0].focus()}},valueIsPlaceholder:function(){return this.input[0].value==this.input.attr("placeholder")},handlePassword:function(){var a=this.input;a.attr("realType","password");this.isPassword=!0;if(b.browser.msie&&a[0].outerHTML){var c=b(a[0].outerHTML.replace(/type=(['"])?password\1/gi,
"type=$1text$1"));this.fakePassword=c.val(a.attr("placeholder")).addClass("placeholder").focus(function(){a.trigger("focus");b(this).hide()});b(a[0].form).submit(function(){c.remove();a.show()})}}};var e=!!("placeholder"in document.createElement("input"));b.fn.placeholder=function(){return e?this:this.each(function(){var a=b(this),c=new d(a);c.show(!0);a.focus(function(){c.hide()});a.blur(function(){c.show(!1)});b.browser.msie&&(b(window).load(function(){a.val()&&a.removeClass("placeholder");c.show(!0)}),
a.focus(function(){if(this.value==""){var a=this.createTextRange();a.collapse(!0);a.moveStart("character",0);a.select()}}))})}})(jQuery);
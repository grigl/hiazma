$(document).ready(function(){

// navigation
	
	$('.header-logo').click(function(e){
		 e.preventDefault();
		 $('html, body').animate({scrollTop:'0px'}, 1600);
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
		}
	});
	
	$('.header-menu a, .nav-link').click(function () {	
		elementClick = $(this).attr('href')
		destination = $(elementClick).offset().top + 5;
		$('html:not(:animated),body:not(:animated)').animate({ scrollTop: destination}, 1100 );
		return false;
	});

// placeholder
	$('input[placeholder], textarea[placeholder]').placeholder();

// news list
	oldRel = 1;
	$('.news-list .pager a').click(function(e){
		e.preventDefault();
		var newRel = $(this).attr('rel');
		var pageIds = new Array();
		$('.news-list-page').each(function(){
			pageIds.push(parseInt($(this).attr('id')));
		});
		var relIds = new Array();
		for( i=2; i <= newRel; i++ ) {
			relIds.push(i)
		}
		alert(relIds);
		if ( pageIds.indexOf(parseInt(newRel)) < 0 ) {
			$.each(relIds, function() { 
				$.get('?page=' + this, function(data) {
					$('.news-list .news-list-page:last').after($(data).find('.news-list .news-list-page:first'));
					$('.news-view .news-list-page:last').after($(data).find('.news-view .news-list-page'));
				});
			});
		}
		var delta = newRel - oldRel;
		var speed = Math.abs(delta) > 1 ? 1200 : 600;
		$(this).closest('div').find('.news-list-wrapper').animate({'left': (delta < 0 ? '+' : '-' ) + '=' + Math.abs(delta) * 100 + '%'}, speed);
		oldRel = newRel;
		$('.news-list .pager a').removeClass('active');
	  $('.news-list .pager a[rel='+ newRel +']').addClass('active');
	});
	
	$('.news-item .show-news').click(function(e){
		e.preventDefault();
		var index = $('.news-item .show-news').index(this);
		$('.news-view .pager a').removeClass('active');
		$('.news-view .pager a:eq('+ index +')').addClass('active');
		$('.news-view .news-list-wrapper').css('left', '-'+ index +'00%');
		$('.news-list').slideUp();
		$('.news-view').slideDown();
	});
	
	oldRel2 = 1;
	$('.news-view .pager a').click(function(e){
		e.preventDefault();
		var newRel = $(this).attr('rel');
		var delta = newRel - oldRel2;
		var speed = Math.abs(delta) > 1 ? 1200 : 600;
		$(this).closest('div').find('.news-list-wrapper').animate({'left': (delta < 0 ? '+' : '-' ) + '=' + Math.abs(delta) * 100 + '%'}, speed);
		oldRel2 = newRel;
		$('.news-view .pager a').removeClass('active');
		$('.news-view .pager a[rel='+ newRel +']').addClass('active');
	});
	
	$('.news-item .hide-news').click(function(e){
		 e.preventDefault();
		 $('.news-list').slideDown();
		 $('.news-view').slideUp();
	});

// jobs list
	$('.jobs-title-item h4 a').click(function(e){
		 e.preventDefault();
		 $(this).parent().toggleClass('open').next().slideToggle();
	});

// feedback-done submit
	$('.feedback-done .button').click(function(e){
		e.preventDefault();
		$('.feedback').slideDown();
		$('.feedback-done').slideUp();
	})

});

// placeholder
(function(b){function d(a){this.input=a;a.attr("type")=="password"&&this.handlePassword();b(a[0].form).submit(function(){if(a.hasClass("placeholder")&&a[0].value==a.attr("placeholder"))a[0].value=""})}d.prototype={show:function(a){if(this.input[0].value===""||a&&this.valueIsPlaceholder()){if(this.isPassword)try{this.input[0].setAttribute("type","text")}catch(b){this.input.before(this.fakePassword.show()).hide()}this.input.addClass("placeholder");this.input[0].value=this.input.attr("placeholder")}},
hide:function(){if(this.valueIsPlaceholder()&&this.input.hasClass("placeholder")&&(this.input.removeClass("placeholder"),this.input[0].value="",this.isPassword)){try{this.input[0].setAttribute("type","password")}catch(a){}this.input.show();this.input[0].focus()}},valueIsPlaceholder:function(){return this.input[0].value==this.input.attr("placeholder")},handlePassword:function(){var a=this.input;a.attr("realType","password");this.isPassword=!0;if(b.browser.msie&&a[0].outerHTML){var c=b(a[0].outerHTML.replace(/type=(['"])?password\1/gi,
"type=$1text$1"));this.fakePassword=c.val(a.attr("placeholder")).addClass("placeholder").focus(function(){a.trigger("focus");b(this).hide()});b(a[0].form).submit(function(){c.remove();a.show()})}}};var e=!!("placeholder"in document.createElement("input"));b.fn.placeholder=function(){return e?this:this.each(function(){var a=b(this),c=new d(a);c.show(!0);a.focus(function(){c.hide()});a.blur(function(){c.show(!1)});b.browser.msie&&(b(window).load(function(){a.val()&&a.removeClass("placeholder");c.show(!0)}),
a.focus(function(){if(this.value==""){var a=this.createTextRange();a.collapse(!0);a.moveStart("character",0);a.select()}}))})}})(jQuery);
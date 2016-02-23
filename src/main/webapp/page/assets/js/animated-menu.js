$(document).ready(function(){
	
	//Fix Errors - http://www.learningjquery.com/2009/01/quick-tip-prevent-animation-queue-buildup/
	
	//Remove outline from links
	$("a").click(function(){
		$(this).blur();
	});
	
	//When mouse rolls over
	$("li.headui").mouseover(function(){
		$(this).stop().animate({height:'300px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	});
	$("#userinfo").mouseover(function(){
		$(this).stop().animate({height:'450px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	});
	
	//When mouse is removed
	$("li.headui").mouseout(function(){
		$(this).stop().animate({height:'150px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	});
	
});
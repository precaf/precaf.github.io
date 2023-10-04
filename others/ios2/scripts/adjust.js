window.addEventListener("orientationchange", function() {
	whatsWhat();
	window.location.reload();
}, false);

function whatsWhat () {
    var userAgent = navigator.userAgent;
    var browserName = 'Desktop';
	var width = window.innerWidth;
	var height = window.innerHeight;
	var pixwidth = 1; var pixheight = 1; var psize = 1;
	if (width < height) {
	   pixwidth = Math.floor(width/8)-14;
	   pixheight = Math.floor(height/11)-14;
	   psize = Math.max(pixwidth,pixheight);
	} else {
	   pixwidth = Math.floor(height/11)-14;
	   pixheight = Math.floor(width/8)-14;
	   psize = Math.max(pixwidth,pixheight);
	}	
	if (navigator.userAgent.match(/iPad/i)) {
	   browserName = 'iPad';
	} else {
	   if (navigator.userAgent.match(/iPhone/i)) {
	      browserName = 'iPhone';
	   }
	}
	var DEBUG = 'browserName='+browserName+' width='+width+' height='+height+' pixwidth='+pixwidth+' pixheight='+pixheight+' psize='+psize
	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
	document.write('\n<!--  '+DEBUG+'  -->\n');
}

whatsWhat();

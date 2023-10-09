window.addEventListener("landscapechange", function() {
	whatsWhat();
	window.location.reload(true);
}, false);

window.addEventListener("resize", function() {
	whatsWhat();
	window.location.reload(true);
}, false);

function whatsWhat () {
    var userAgent = navigator.userAgent;
    var browserName = 'Desktop';
    var pixels = screen.width * screen.height;
    switch (pixels) {
       case (744*1133): 
         browserName = 'iPad';
       break;
       case (390*844): 
         browserName = 'iPhone';
       break;
       default: 
         browserName = 'Desktop';
       break;
    }
	var width = screen.width;
	var height = screen.height;
	var browserwidth = window.innerWidth;
	var browserheight = window.innerHeight;
	var landscape = true;
	var x = 1; var y = 1;
	if (browserwidth < browserheight) {
	  landscape = false;
	  x = Math.floor(browserwidth/8);
	  y = Math.floor(browserheight/11);
	} else {
	  x = Math.floor(browserwidth/11);
	  y = Math.floor(browserheight/8);
	}
	var psize = Math.min(x,y);
	
	var DEBUG = 'userAgent='+userAgent+' browserName='+browserName+' width='+width+' height='+height+' browserwidth='+browserwidth+' browserheight='+browserheight+' landscape='+landscape+' psize='+psize+' x='+x+' y='+y;

	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
	document.write('\n<!-- '+DEBUG+' -->\n');
}

whatsWhat();

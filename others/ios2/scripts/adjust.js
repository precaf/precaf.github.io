window.addEventListener("landscapechange", function() {
	whatsWhat();
	window.location.reload();
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
	if (browserwidth < browserheight) {
	  landscape = false;
	}
	if (landscape) {
	   psize = Math.floor((browserwidth-12*12)/11)
	} else {
	   psize = Math.floor((browserwidth-9*12)/8)
	}
	
	var DEBUG = 'userAgent='+userAgent+' browserName='+browserName+' width='+width+' height='+height+' browserwidth='+browserwidth+' browserheight='+browserheight+' landscape='+landscape+' psize='+psize
	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
	document.write('\n<!--  '+DEBUG+'  -->\n');
}

whatsWhat();

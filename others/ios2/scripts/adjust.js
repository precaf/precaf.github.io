window.addEventListener("orientationchange", function() {
	whatsWhat();
	window.location.reload();
}, false);

function whatsWhat () {
    var userAgent = navigator.userAgent;
    var browserName = 'Desktop';
    var pixels = screen.width * screen.height;
    switch (pixels) {
       case (1920*1200): 
         browserName = 'iPad';
       break;
       case (1920*1200): 
         browserName = 'iPhone';
       break;
       default: 
         browserName = 'Desktop';
       break;
    }
	var width = screen.width;
	var height = screen.height;
	var orientation = 'landscape';
	if (width < height) {
	  orientation = 'portrait';
	}
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
	   psize = 79;
	} else {
	   if (navigator.userAgent.match(/iPhone/i)) {
	      browserName = 'iPhone';
	      psize = 79;
	   }
	}
	var DEBUG = 'userAgent='+userAgent+' browserName='+browserName+' width='+width+' height='+height+' orientation='+orientation+' pixwidth='+pixwidth+' pixheight='+pixheight+' psize='+psize
	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
	document.write('\n<h2 style="color:yellow">  '+DEBUG+'  </h2>\n');
}

whatsWhat();

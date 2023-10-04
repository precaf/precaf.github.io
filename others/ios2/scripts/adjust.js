window.addEventListener("orientationchange", function() {
	whatsWhat();
	window.location.reload();
}, false);

function whatsWhat () {
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
	var DEBUG = 'width='+width+' height='+height+' pixwidth='+pixwidth+' pixheight='+pixheight+' psize='+psize
	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
	document.write('\n<!--  '+DEBUG+'  -->\n');
}

whatsWhat();

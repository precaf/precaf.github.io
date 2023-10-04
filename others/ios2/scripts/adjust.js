window.addEventListener("orientationchange", function() {
	whatsWhat();
	window.location.reload();
}, false);

function whatsWhat () {
	var squares = 88;
	var width = window.innerWidth;
	var height = window.innerHeight;
	var total = width * height;
	var pixels = screen.pixelDepth;
	var avg = Math.sqrt(total/squares)-25;
	var psize = Math.floor(avg);
	var DEBUG = 'squares='+squares+' width='+width+' height='+height+' total='+total+' pixels='+pixels+' avg='+avg+' psize='+psize
	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
	document.write('\n<!--  '+DEBUG+'  -->\n');
}

whatsWhat();

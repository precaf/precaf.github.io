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
	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
}

whatsWhat();

window.addEventListener("orientationchange", function() {
	whatsWhat();
	window.location.reload();
}, false);

function whatsWhat () {
	var width = window.innerWidth;
	var height = window.innerHeight;
	var smallest = Math.min(width,height);
	var psize = Math.floor(smallest/8);
	var DEBUG = 'width='+width+' height='+height+' smallest='+smallest+' psize='+psize
	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
	document.write('\n<!--  '+DEBUG+'  -->\n');
}

whatsWhat();

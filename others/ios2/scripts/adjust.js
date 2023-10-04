window.addEventListener("orientationchange", function() {
	whatsWhat();
	window.location.reload();
}, false);

function whatsWhat () {
	var width = window.innerWidth;
	var height = window.innerHeight;
	var dim1 = 1; var dim2 = 1;
	if (width < height) {
	   dim1 = Math.floor((width-108)/8);
	   dim2 = Math.floor((height-144)/11);
	} else {
	   dim1 = Math.floor((height-108)/8);
	   dim2 = Math.floor((width-144)/11);
	}
	var psize = Math.min(dim1,dim2);
	var DEBUG = 'width='+width+' height='+height+' dim1='+dim1+' dim2='+dim2+' psize='+psize
	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
	document.write('\n<!--  '+DEBUG+'  -->\n');
}

whatsWhat();

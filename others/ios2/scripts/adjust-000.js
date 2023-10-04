window.addEventListener("orientationchange", function() {
	whatsWhat();
	window.location.reload();
}, false);

function whatsWhat () {
	var width = window.innerWidth;
	var height = window.innerHeight;
	var divisor = 11*1.1;
	if (width < height) {
	  divisor = 8*1.1;
	}
	var each = width/divisor;
	var psize = Math.floor(each);	
	var browser =
      "navigator.oscpu = " + navigator.oscpu + "\n" +
      "navigator.platform = " + navigator.platform + "\n" +
      "navigator.product = " + navigator.product + "\n" +
      "navigator.productSub = " + navigator.productSub + "\n" +
      "navigator.userAgent = " + navigator.userAgent + "\n" +
      "navigator.vendor = " + navigator.vendor + "\n" +
      "navigator.vendorSub = " + navigator.vendorSub + "\n" +
      "navigator.webdriver = " + navigator.webdriver + "\n";
	
	document.write('\n<style>img { width:' + psize + 'px; height:' + psize + 'px; }</style>\n');
	// alert("browser="+browser+"\nwidth="+width+"\nheight="+height+"\neach="+each+"\npsize="+psize+"");
}

whatsWhat();

$(function(){
	var url = window.location.pathname;
	var element = $('ul.treeview a').filter(function(){
		return this.href == url;
	})
	console.info(element);
	element.parent().addClass('active');
	
	/*while(true){
		if(element.is('li')){
			element = element.parent().addClass('in').parent();
		} else {
			break;
		}
	}*/
});

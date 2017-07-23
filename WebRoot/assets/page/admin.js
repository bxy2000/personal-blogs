$(function(){
	var url = $('.currentpage').attr('href');
	if(url == null || url == "") return;
	
	var element = $('li.treeview a').filter(function(){
		return this.href.indexOf('#') == -1 && this.href.indexOf(url) >= 0;
	}).parent().addClass('active');

	element.parent().parent().addClass('active');
});

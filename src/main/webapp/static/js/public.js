
//左侧导航收缩
function OpenClose(className){
	$(className).click(function() {

					if($(this).parent().attr('class') == "left-main left-full") {
//						$(this).parent().animate({
//							    width:'-=172px'
//						});
						$(this).parent().removeClass("left-full");
						$(this).parent().addClass("left-off");
						$("#page-wrapper").css("margin-left", "45px");
						$(".glyphicon-menu-hamburger").html("");
						$('.sBox .glyphicon-chevron-up').css('visibility', 'hidden');
						$('.sBox .glyphicon-chevron-down').css('visibility', 'hidden');
						$(this).css('width', '47px').css("height",'150px');
						$(".subNavBox").css("margin-top",'150px');
						$('.sBox .navContent a').css('text-align', 'center');
						$("#ascrail2000").css("left","45px");
					} else {
//						$(this).parent().animate({
//							    width:'+=172px'
//						});
						$(this).parent().removeClass("left-off");
						$(this).parent().addClass("left-full");
						$("#page-wrapper").css("margin-left", "220px");
						$(".glyphicon-menu-hamburger").html(" 菜单列表");
						$('.sBox .glyphicon-chevron-up').css('visibility', 'visible');
						$('.sBox .glyphicon-chevron-down').css('visibility', 'visible');
						$('.sBox .sublist-icon').css('width', '48px');
						$(this).css('width', '219px').css("height",'180px');
						$(".subNavBox").css("margin-top",'180px');
						$('.sBox .navContent a').css('text-align', 'left');
						$("#ascrail2000").css("left","177px");
					}
				})
}

//获取url参数
function getUrlOption(name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    }
    return null;
}


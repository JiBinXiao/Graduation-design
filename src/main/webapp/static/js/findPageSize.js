/*分页选择条数 modify by liuds 2018-01-30*/
$(function(){
    $("#page_size").on("change",function(){
        var pagesize =$("#page_size").val();
        page(1, pagesize);
    })
    var size = $("#pageSize").val();
    $("#page_size").find("option").each(function(){
        if($(this).val()==size){
            $(this).attr("selected","selected");
        }
    })
})



	
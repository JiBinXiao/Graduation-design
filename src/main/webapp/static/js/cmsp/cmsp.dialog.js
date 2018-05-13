
/**
 * 全局弹出窗口
 * Created by dangy on 2017/3/1.
 */
//全局变量，用于标识关闭弹出窗口后是否刷新父窗口
var Dialog_IsRefresh = false;
//弹出窗口返回值
var Dialog_ReturnValue={};
/**
*弹出窗口（页面）
 * 此方法仅满足了现在的弹出页面模态框，后续将完善其它类型的窗口
 *add by dangfy on 20170301
 * */
(function (window) {
    var dlg = {
        /**
         * show: 打开弹窗并传值
         * @example
         * {data,title,url,width,height,closed:function}
         */
        show: function (options) {
            if (!options) {
                $.jBox();
                return false;
            }
            if(options.isAjax==false){
            $.jBox("iframe:" + options.url, {
                title: options.title,
                data: options.data,
                width: typeof (options.width) == "undefined" ? 640 : options.width,
                height: typeof (options.height) == "undefined" ? 640 : options.height,
                opacity: 0.5,
                theme: 'Bootstrap',
                buttons: {},
                closed: function () {
                    if (options.closed)
                        options.closed(Dialog_IsRefresh,Dialog_ReturnValue);
                    	Dialog_IsRefresh = false;
                }
            });
            }else{
                $.jBox("iframe:" + options.url, {
                    title: options.title,
                    ajaxData: options.data,
                    width: typeof (options.width) == "undefined" ? 640 : options.width,
                    height: typeof (options.height) == "undefined" ? 640 : options.height,
                    opacity: 0.5,
                    theme: 'Bootstrap',
                    buttons: {},
                    closed: function () {
                        if (options.closed)
                            options.closed(Dialog_IsRefresh,Dialog_ReturnValue);
                            Dialog_IsRefresh = false;
                    }
                });
            }
            return false;
        },
        closeRefresh: function (returnData) {
            if (returnData) {
                Dialog_ReturnValue=returnData;
            }
            Dialog_IsRefresh = true;
            top.jBox.close();
        },
        closeNoRefresh: function (returnData) {
            if (returnData) {
                Dialog_ReturnValue=returnData;
            }
            Dialog_IsRefresh = false;
            top.jBox.close();
        },
        upload: function (o, t) {
            /*此处待修改为jBox*/
            top.dialog({
                title: '选择文件',
                url: '/ComManage/Upload/FileMain',
                width: 800,
                height: 480,
                data: o, // 给 iframe 的数据
                onclose: t,
                oniframeload: function () {
                }
            }).showModal();
            return false;
        }
    }
    window.dlg = dlg;
})(window)


/**主页面打开调用示例 add by dangfy on 20170302*/
function open(pid){
    var dialog=	window.top.dlg;
    dialog.show({
        title: "批复操作",
        url: "${ctx}/dialogWindow",
        data: {pid:pid},
        width: 700,
        height: 370,
        closed:function(isRefresh,returnValue){
            if(isRefresh)
                location.reload();
        }
    })
}
/*子页面关闭事件 add by dangfy on 20170302*/
function close(){
    //关闭后需要刷新，返回值是josn类型（根据需要填写)
    top.dlg.closeRefresh({aid:aid});
    //关闭后不需要刷新，返回值是josn类型（根据需要填写)
    top.dlg.closeNoRefresh({aid:aid});
}
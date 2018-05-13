/**
 * @描述:ajaxsubmit 提交
 * @author dangfy
 * @创建日期：
 * @version 1.0
 * @修改人：
 * @修改日期：
 * @Copyright: Copyright (c) Jnwat Soft
 * @备注：
 */

/**
 * ajax提交通用方法
 *
 * @param url
 *            请求url
 * @param data
 *            请求参数（json:{key:value,key:value}）
 * @param callback
 *            请求成功后调用方法(非必须)
 */
function ajaxSubmit(_url, _data, callback) {
    var result = false;
    $.ajax({
        url: _url,
        method: 'post',
        dataType: 'JSON',
        data: _data,
        success: function (data) {
            if (data.success) {
                top.$.jBox.alert(data.msg,"提示", function () {
                    if (callback)
                        callback();
                });
            } else {
                top.$.jBox.alert(data.msg,"错误");
            }
            result = data.success;
        },
        error: function (data) {
            top.$.jBox.alert("网络请求失败","错误");
            result = false;
        }
    });
    return result;
}


/**
 * ajax获取数据通用方法
 *
 * @param url
 *            请求url
 * @param data
 *            请求参数（json:{key:value,key:value}）
 */
/*function ajaxGetData(_url, _data) {
    var result =[];
    $.ajax({
        url: _url,
        method: 'post',
        dataType: 'JSON',
        data: _data,
        success: function (data) {
            if (data.success) {
                result= data.data;
            } else {
                top.$.jBox.alert(data.msg,"错误");
            }
        },
        error: function (data) {
            top.$.jBox.alert("网络请求失败","错误");
        }
    });
    return result;
}*/

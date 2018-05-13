<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称（ID）"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="隐藏域值（ID）"%>
<%@ attribute name="labelName" type="java.lang.String" required="true" description="输入框名称（Name）"%>
<%@ attribute name="labelValue" type="java.lang.String" required="true" description="输入框值（Name）"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="选择框标题"%>
<%@ attribute name="url" type="java.lang.String" required="true" description="树结构数据地址"%>
<%@ attribute name="checked" type="java.lang.Boolean" required="false" description="是否显示复选框，如果不需要返回父节点，请设置notAllowSelectParent为true"%>
<%@ attribute name="extId" type="java.lang.String" required="false" description="排除掉的编号（不能选择的编号）"%>
<%@ attribute name="isAll" type="java.lang.Boolean" required="false" description="是否列出全部数据，设置true则不进行数据权限过滤（目前仅对Office有效）"%>
<%@ attribute name="notAllowSelectRoot" type="java.lang.Boolean" required="false" description="不允许选择根节点"%>
<%@ attribute name="notAllowSelectParent" type="java.lang.Boolean" required="false" description="不允许选择父节点"%>
<%@ attribute name="module" type="java.lang.String" required="false" description="过滤栏目模型（只显示指定模型，仅针对CMS的Category树）"%>
<%@ attribute name="selectScopeModule" type="java.lang.Boolean" required="false" description="选择范围内的模型（控制不能选择公共模型，不能选择本栏目外的模型）（仅针对CMS的Category树）"%>
<%@ attribute name="allowClear" type="java.lang.Boolean" required="false" description="是否允许清除"%>
<%@ attribute name="allowInput" type="java.lang.Boolean" required="false" description="文本框可填写"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="cssStyle" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="smallBtn" type="java.lang.Boolean" required="false" description="缩小按钮显示"%>
<%@ attribute name="hideBtn" type="java.lang.Boolean" required="false" description="是否显示按钮"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否限制选择，如果限制，设置为disabled"%>
<%@ attribute name="dataMsgRequired" type="java.lang.String" required="false" description=""%>
<%@ attribute name="notAllowSelectCity" type="java.lang.Boolean" required="false" description="不允许选择地市"%>
<%@ attribute name="placeholder" type="java.lang.String" required="false" description=""%>
<%@ attribute name="bootstrapvalidate" type="java.lang.String" required="false" description="bootstrap验证"%>
<%@ attribute name="formid" type="java.lang.String" required="false" description="表单id"%>
<!-- 用来查询人员时限定部门-->
<%@ attribute name="deptid" type="java.lang.String" required="false" description="部门id"%>

<!-- 选部门时，关联部门负责人   add by chenyq 2017-09-11 -->
<%@ attribute name="relationName" type="java.lang.String" required="false" description="隐藏域名称（ID）"%>
<%@ attribute name="relationValue" type="java.lang.String" required="false" description="隐藏域值（ID）"%>

<div class="input-append input-group">
	<input id="${id}Id" name="${name}" class="${cssClass}" type="hidden" value="${value}"/>
	<input id="${id}Name" name="${labelName}" ${allowInput?'':'readonly="readonly"'} type="text" value="${labelValue}" data-msg-required="${dataMsgRequired}"
		class="${cssClass}" style="${cssStyle}" placeholder="${placeholder}"  ${bootstrapvalidate }/><%-- <a id="${id}Button" href="javascript:" class="btn ${disabled} ${hideBtn ? 'hide' : ''}" style="${smallBtn?'padding:4px 2px;':''}">&nbsp;<i class="icon-search"></i>&nbsp;</a>&nbsp;&nbsp; --%>
		<div class="input-group-addon"><i class="glyphicon glyphicon-search" id="search${id}"></i></div>
		<!-- <span class="input-icon"><i class="glyphicon glyphicon-search"></i></span> -->
</div>
<script type="text/javascript">
	$("#${id}Button, #${id}Name, #search${id}").click(function(){
	    var deptid = $("#${deptid}").val();
		// 是否限制选择，如果限制，设置为disabled
		if ($("#${id}Button").hasClass("disabled")){
			return true;
		}
		// 正常打开	
		top.$.jBox.open("iframe:${ctx}/tag/treeselect?url="+encodeURIComponent("${fns:escapeHtml(url)}")+"&module=${module}&checked=${checked}&extId=${extId}&isAll=${isAll}&deptid="+deptid, "选择${title}", 300, 520, {
			ajaxData:{selectIds: $("#${id}Id").val()},buttons:{"确定":"ok", ${allowClear?"\"清除\":\"clear\", ":""}"关闭":true}, submit:function(v, h, f){
				if (v=="ok"){
					var tree = h.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
					var ids = [], names = [], nodes = [],relationid = [],relationname = [];
					if ("${checked}" == "true"){
						nodes = tree.getCheckedNodes(true);
					}else{
						nodes = tree.getSelectedNodes();
					}
					if(nodes == null || nodes == ""){
						top.$.jBox.alert("未选择任何${title}");
						return false;
					}
					for(var i=0; i<nodes.length; i++) {//<c:if test="${checked && notAllowSelectParent}">
						debugger
						if (nodes[i].isParent){
							continue; // 如果为复选框选择，则过滤掉父节点
						}//</c:if><c:if test="${notAllowSelectRoot}">
						if (nodes[i].level == 0){
							top.$.jBox.tip("不能选择根节点（"+nodes[i].name+"）请重新选择。");
							return false;
						}//</c:if><c:if test="${notAllowSelectParent}">
						if (nodes[i].isParent){
							top.$.jBox.tip("不能选择父节点（"+nodes[i].name+"）请重新选择。");
							return false;
						}//</c:if><c:if test="${not empty module && selectScopeModule}">
						if (nodes[i].module == ""){
							top.$.jBox.tip("不能选择公共模型（"+nodes[i].name+"）请重新选择。");
							return false;
						}else if (nodes[i].module != "${module}"){
							top.$.jBox.tip("不能选择当前栏目以外的栏目模型，请重新选择。");
							return false;
						}//</c:if><c:if test="${notAllowSelectCity}">
						if(nodes[i].level == 0 || nodes[i].level == 1) {
							top.$.jBox.tip("请选择桥梁、人行通道、道路。");
							return false;
						}//</c:if>
						
						ids.push(nodes[i].id);
						names.push(nodes[i].name);//<c:if test="${!checked}">
						relationid.push(nodes[i].master);
						relationname.push(nodes[i].mastername);
						break; // 如果为非复选框选择，则返回第一个选择  </c:if>
					}
					$("#${id}Id").val(ids.join(",").replace(/u_/ig,"")).keyup();
					$("#${id}Name").val(names.join(","));
					$("#${relationName}").val(relationname.join(",").replace(/u_/ig,""));
					$("#${relationValue}").val(relationid.join(","));
					if("${formid}" != "" && $('#${formid}').data('bootstrapValidator') != null) {
						$('#${formid}').data('bootstrapValidator').updateStatus('${labelName}', 'NOT_VALIDATED', null) .validateField('${labelName}');
					}
					$("#${id}Id").trigger("input"); 
					
					
					
				}//<c:if test="${allowClear}">
				else if (v=="clear"){
					$("#${id}Id").val("");
					$("#${id}Name").val("");
                }//</c:if>
				if(typeof ${id}TreeselectCallBack == 'function'){
					${id}TreeselectCallBack(v, h, f);
				}
			}, loaded:function(h){
				$(".jbox-content", top.document).css("overflow-y","hidden");
			}
		});
	});
	

</script>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<style>
.pagination {
    margin: 0px 20px 0 0;
}
</style>
	 <!-- 分页控件 -->
	 <div class="fixed-table-pagination" style="display: block;">
	   <div class="pull-left pagination-detail">
         <span class="pagination-info">显示第 ${(page.pageNo-1)*page.pageSize+1} 到第
              <c:if test="${page.pageNo*page.pageSize>page.count}">${page.count}</c:if>
              <c:if test="${page.pageNo*page.pageSize<page.count}">${page.pageNo*page.pageSize}</c:if>
                                        条数据，共 ${page.count} 条数据</span>
		</div>
		<div class="pull-right pagination">
          <ul class="pagination" >
             <c:if test="${page.firstPage }" var="isFirst">
                 <li class="page-pre">
                     <a href="javascript:page(${page.lastPage},${page.pageSize})" aria-label="Previous">
                         <span aria-hidden="true">‹</span>
                     </a>
                 </li>
             </c:if>
             <c:if test="${not isFirst }">
                 <li>
                     <a href="javascript:page(${page.prev},${page.pageSize})" aria-label="Previous">
                         <span aria-hidden="true">‹</span>
                     </a>
                 </li>
             </c:if> 
             <c:if test="${page.pageLinkNumber gt 0}"> 
                 <c:set var="betweenIndex" value="${2}"></c:set> 
                 <c:forEach var="linkIndex" begin="${page.getFirst()}" end="${page.getLast()}">
                     <c:if test="${linkIndex eq  page.pageNo}" var="isCurr">
                         <li class="active"><a href="javascript:void(0)">${linkIndex}</a></li>
                     </c:if>
                     <c:if test="${not isCurr}">
                         <li>
                             <a href="javascript:page(${linkIndex},${page.pageSize})">${linkIndex}</a>
                         </li>
                     </c:if>
                 </c:forEach>
             </c:if>  
             <c:if test="${page.lastPage }" var="isLast">
                 <li class="page-next">
                     <a href="javascript:page(${page.firstPage},${page.pageSize})"
                        aria-label="Next">
                         <span aria-hidden="true">›</span>
                     </a>
                 </li>
               </c:if>
               <c:if test="${not isLast }">
                   <li class="page-next">
                       <a href="javascript:page(${page.next },${page.pageSize})"
                          aria-label="Next">
                           <span aria-hidden="true">›</span>
                       </a>
                   </li>
             </c:if>
                                </ul>
                         </div>
       </div>
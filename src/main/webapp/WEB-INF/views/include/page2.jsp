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
                                    <span class="pagination-info">显示第 ${(page2.pageNo-1)*page2.pageSize+1} 到第
                                        <c:if test="${page2.pageNo*page2.pageSize>page2.count}">${page2.count}</c:if>
                                        <c:if test="${page2.pageNo*page2.pageSize<page2.count}">${page2.pageNo*page2.pageSize}</c:if>
                                        条数据，共 ${page2.count} 条数据</span>
								</div>
								<div class="pull-right pagination">
                                <ul class="pagination" >
                                    <c:if test="${page2.firstPage }" var="isFirst">
                                        <li class="page-pre">
                                            <a href="javascript:page2(${page2.lastPage},${page2.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${not isFirst }">
                                        <li>
                                            <a href="javascript:page2(${page2.prev},${page2.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if> 
                                    <c:if test="${page2.pageLinkNumber gt 0}"> 
                                        <c:set var="betweenIndex" value="${2}"></c:set> 
                                        <c:forEach var="linkIndex" begin="${page2.getFirst()}" end="${page2.getLast()}">
                                            <c:if test="${linkIndex eq  page2.pageNo}" var="isCurr">
                                                <li class="active"><a href="javascript:void(0)">${linkIndex}</a></li>
                                            </c:if>
                                            <c:if test="${not isCurr}">
                                                <li>
                                                    <a href="javascript:page2(${linkIndex},${page2.pageSize})">${linkIndex}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>  
                                  <c:if test="${page2.lastPage }" var="isLast">
                                      <li class="page-next">
                                          <a href="javascript:page2(${page2.firstPage},${page2.pageSize})"
                                             aria-label="Next">
                                              <span aria-hidden="true">›</span>
                                          </a>
                                      </li>
                                    </c:if>
                                    <c:if test="${not isLast }">
                                        <li class="page-next">
                                            <a href="javascript:page2(${page2.next },${page2.pageSize})"
                                               aria-label="Next">
                                                <span aria-hidden="true">›</span>
                                            </a>
                                        </li>
                                  </c:if>
                                </ul>
                         </div>
       </div>
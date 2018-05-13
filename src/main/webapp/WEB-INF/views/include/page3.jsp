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
                                    <span class="pagination-info">显示第 ${(page3.pageNo-1)*page3.pageSize+1} 到第
                                        <c:if test="${page3.pageNo*page3.pageSize>page3.count}">${page3.count}</c:if>
                                        <c:if test="${page3.pageNo*page3.pageSize<page3.count}">${page3.pageNo*page3.pageSize}</c:if>
                                        条数据，共 ${page3.count} 条数据</span>
								</div>
								<div class="pull-right pagination">
                                <ul class="pagination" >
                                    <c:if test="${page3.firstPage }" var="isFirst">
                                        <li class="page-pre">
                                            <a href="javascript:page3(${page3.lastPage},${page3.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${not isFirst }">
                                        <li>
                                            <a href="javascript:page3(${page3.prev},${page3.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if> 
                                    <c:if test="${page3.pageLinkNumber gt 0}"> 
                                        <c:set var="betweenIndex" value="${2}"></c:set> 
                                        <c:forEach var="linkIndex" begin="${page3.getFirst()}" end="${page3.getLast()}">
                                            <c:if test="${linkIndex eq  page3.pageNo}" var="isCurr">
                                                <li class="active"><a href="javascript:void(0)">${linkIndex}</a></li>
                                            </c:if>
                                            <c:if test="${not isCurr}">
                                                <li>
                                                    <a href="javascript:page3(${linkIndex},${page3.pageSize})">${linkIndex}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>  
                                  <c:if test="${page3.lastPage }" var="isLast">
                                      <li class="page-next">
                                          <a href="javascript:page3(${page3.firstPage},${page3.pageSize})"
                                             aria-label="Next">
                                              <span aria-hidden="true">›</span>
                                          </a>
                                      </li>
                                    </c:if>
                                    <c:if test="${not isLast }">
                                        <li class="page-next">
                                            <a href="javascript:page3(${page3.next },${page3.pageSize})"
                                               aria-label="Next">
                                                <span aria-hidden="true">›</span>
                                            </a>
                                        </li>
                                  </c:if>
                                </ul>
                         </div>
       </div>
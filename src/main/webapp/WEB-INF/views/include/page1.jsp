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
                                    <span class="pagination-info">显示第 ${(page1.pageNo-1)*page1.pageSize+1} 到第
                                        <c:if test="${page1.pageNo*page1.pageSize>page1.count}">${page1.count}</c:if>
                                        <c:if test="${page1.pageNo*page1.pageSize<page1.count}">${page1.pageNo*page1.pageSize}</c:if>
                                        条数据，共 ${page1.count} 条数据</span>
								</div>
								<div class="pull-right pagination">
                                <ul class="pagination" >
                                    <c:if test="${page1.firstPage }" var="isFirst">
                                        <li class="page-pre">
                                            <a href="javascript:page1(${page1.lastPage},${page1.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${not isFirst }">
                                        <li>
                                            <a href="javascript:page1(${page1.prev},${page1.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if> 
                                    <c:if test="${page1.pageLinkNumber gt 0}"> 
                                        <c:set var="betweenIndex" value="${2}"></c:set> 
                                        <c:forEach var="linkIndex" begin="${page1.getFirst()}" end="${page1.getLast()}">
                                            <c:if test="${linkIndex eq  page1.pageNo}" var="isCurr">
                                                <li class="active"><a href="javascript:void(0)">${linkIndex}</a></li>
                                            </c:if>
                                            <c:if test="${not isCurr}">
                                                <li>
                                                    <a href="javascript:page1(${linkIndex},${page1.pageSize})">${linkIndex}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>  
                                  <c:if test="${page1.lastPage }" var="isLast">
                                      <li class="page-next">
                                          <a href="javascript:page1(${page1.firstPage},${page1.pageSize})"
                                             aria-label="Next">
                                              <span aria-hidden="true">›</span>
                                          </a>
                                      </li>
                                    </c:if>
                                    <c:if test="${not isLast }">
                                        <li class="page-next">
                                            <a href="javascript:page1(${page1.next },${page1.pageSize})"
                                               aria-label="Next">
                                                <span aria-hidden="true">›</span>
                                            </a>
                                        </li>
                                  </c:if>
                                </ul>
                         </div>
       </div>
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
                                    <span class="pagination-info">显示第 ${(pageDocument.pageNo-1)*pageDocument.pageSize+1} 到第
                                        <c:if test="${pageDocument.pageNo*pageDocument.pageSize>pageDocument.count}">${pageDocument.count}</c:if>
                                        <c:if test="${pageDocument.pageNo*pageDocument.pageSize<pageDocument.count}">${pageDocument.pageNo*pageDocument.pageSize}</c:if>
                                        条数据，共 ${pageDocument.count} 条数据</span>
								</div>
								<div class="pull-right pagination">
                                <ul class="pagination" >
                                    <c:if test="${pageDocument.firstPage }" var="isFirst">
                                        <li class="page-pre">
                                            <a href="javascript:page1(${pageDocument.lastPage},${pageDocument.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${not isFirst }">
                                        <li>
                                            <a href="javascript:page1(${pageDocument.prev},${pageDocument.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if> 
                                    <c:if test="${pageDocument.pageLinkNumber gt 0}"> 
                                        <c:set var="betweenIndex" value="${2}"></c:set> 
                                        <c:forEach var="linkIndex" begin="${pageDocument.getFirst()}" end="${pageDocument.getLast()}">
                                            <c:if test="${linkIndex eq  pageDocument.pageNo}" var="isCurr">
                                                <li class="active"><a href="javascript:void(0)">${linkIndex}</a></li>
                                            </c:if>
                                            <c:if test="${not isCurr}">
                                                <li>
                                                    <a href="javascript:page1(${linkIndex},${pageDocument.pageSize})">${linkIndex}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>  
                                  <c:if test="${pageDocument.lastPage }" var="isLast">
                                      <li class="page-next">
                                          <a href="javascript:page1(${pageDocument.firstPage},${pageDocument.pageSize})"
                                             aria-label="Next">
                                              <span aria-hidden="true">›</span>
                                          </a>
                                      </li>
                                    </c:if>
                                    <c:if test="${not isLast }">
                                        <li class="page-next">
                                            <a href="javascript:page1(${pageDocument.next },${pageDocument.pageSize})"
                                               aria-label="Next">
                                                <span aria-hidden="true">›</span>
                                            </a>
                                        </li>
                                  </c:if>
                                </ul>
                         </div>
       </div>
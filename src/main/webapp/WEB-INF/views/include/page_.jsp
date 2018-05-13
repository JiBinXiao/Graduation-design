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
                                    <span class="pagination-info">显示第 ${(wordpage.pageNo-1)*wordpage.pageSize+1} 到第
                                        <c:if test="${wordpage.pageNo*wordpage.pageSize>wordpage.count}">${wordpage.count}</c:if>
                                        <c:if test="${wordpage.pageNo*wordpage.pageSize<wordpage.count}">${wordpage.pageNo*wordpage.pageSize}</c:if>
                                        条数据，共 ${wordpage.count} 条数据</span>
								</div>
								<div class="pull-right pagination">
                                <ul class="pagination" >
                                    <c:if test="${wordpage.firstPage }" var="isFirst">
                                        <li class="page-pre">
                                            <a href="javascript:page(${wordpage.lastPage},${wordpage.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${not isFirst }">
                                        <li>
                                            <a href="javascript:page(${wordpage.prev},${wordpage.pageSize})" aria-label="Previous">
                                                <span aria-hidden="true">‹</span>
                                            </a>
                                        </li>
                                    </c:if> 
                                    <c:if test="${wordpage.pageLinkNumber gt 0}"> 
                                        <c:set var="betweenIndex" value="${2}"></c:set> 
                                        <c:forEach var="linkIndex" begin="${wordpage.getFirst()}" end="${wordpage.getLast()}">
                                            <c:if test="${linkIndex eq  wordpage.pageNo}" var="isCurr">
                                                <li class="active"><a href="javascript:void(0)">${linkIndex}</a></li>
                                            </c:if>
                                            <c:if test="${not isCurr}">
                                                <li>
                                                    <a href="javascript:page(${linkIndex},${wordpage.pageSize})">${linkIndex}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>  
                                  <c:if test="${wordpage.lastPage }" var="isLast">
                                      <li class="page-next">
                                          <a href="javascript:page(${wordpage.firstPage},${wordpage.pageSize})"
                                             aria-label="Next">
                                              <span aria-hidden="true">›</span>
                                          </a>
                                      </li>
                                    </c:if>
                                    <c:if test="${not isLast }">
                                        <li class="page-next">
                                            <a href="javascript:page(${wordpage.next },${wordpage.pageSize})"
                                               aria-label="Next">
                                                <span aria-hidden="true">›</span>
                                            </a>
                                        </li>
                                  </c:if>
                                </ul>
                         </div>
       </div>
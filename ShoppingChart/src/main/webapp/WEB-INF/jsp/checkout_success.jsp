<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<style>
    .images{
        display:inline-block;
        width:160px;
        height:160px;
        overflow:hidden;
        vertical-align:top
    }
</style>
<html lang="en">
  <head>
    <jsp:include page="include/header.jsp" />
  </head>
<body>
<jsp:include page="include/menu.jsp" />

<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="span3">
		<div class="well well-small"><a id="myCart" href="${pageContext.request.contextPath}/product_summary"><img src="${pageContext.request.contextPath}/themes/images/ico-cart.png" alt="cart">${sessionScope.listOrderDetail.size() ==  null ? 0 : sessionScope.listOrderDetail.size()} Items in your cart  <span class="badge badge-warning pull-right">Rp.${sessionScope.totalPrice == null ? 0 : sessionScope.totalPrice}</span></a></div>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
                        <c:forEach var="amountCategory" items="${amountCategories}">
                                <c:choose>
                                    <c:when test="${amountCategory.listAmountCategory.size() == 0}">
                                        <li>
                                        <a href="${pageContext.request.contextPath}/category/${amountCategory.itemCategory.category.code}?page=1">
                                        ${amountCategory.itemCategory.category.title.toUpperCase()} [${amountCategory.count}]  
                                        </a>
                                    </c:when>    
                                    <c:otherwise>
                                        <li class="subMenu"><a>${amountCategory.itemCategory.category.title.toUpperCase()} [${amountCategory.count}]</a>                
                                        <ul>
                                            <c:forEach var="subAmountCategory" items="${amountCategory.listAmountCategory}">
                                                <li><a href="${pageContext.request.contextPath}/category/${subAmountCategory.itemCategory.category.code}?page=1"><i class="icon-chevron-right"></i>${subAmountCategory.itemCategory.category.title.toUpperCase()} ( ${subAmountCategory.count} )</a></li>
                                            </c:forEach>
                                        </ul> 
                                        </li>
                                    </c:otherwise>        
                                </c:choose>
                                  
                        </c:forEach>
		</ul>
		<br/>
                  <h4>Recommended</h4>
		  <c:forEach var="product" items="${latestProducts}" begin="0" end="1" step="1">
                    <div class="thumbnail">
			<img src="data:image/jpeg;base64,${product.getEncodedImageString()}" alt=""/>
			<div class="caption">
			  <h5>${product.title}</h5>
				<h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath}/product/${product.code}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="${pageContext.request.contextPath}/contact">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${product.getRupiahFormat()}</a></h4>
			</div>
                    </div><br/>
                  </c:forEach>
			<div class="thumbnail">
				<img src="${pageContext.request.contextPath}/themes/images/bca.gif" title="BCA" alt="BCA">
                                <div class="caption">
				  <h5>Payment Methods</h5>
				</div>
			  </div>
	</div>
<!-- Sidebar end=============================================== -->
		<div class="span9">		
		
                    <h1>Pembeliaan Berhasil, silakan lakukan transfer di rekening bawah berikut</h1>
                    
		</div>
		</div>
	</div>
</div>
                         
    <jsp:include page="include/footer.jsp" />
    
<span id="themesBtn"></span>
</body>
</html>


<script>
    (function($){
    $.fn.extend({
        donetyping: function(callback,timeout){
            timeout = timeout || 1e3; // 1 second default timeout
            var timeoutReference,
                doneTyping = function(el){
                    if (!timeoutReference) return;
                    timeoutReference = null;
                    callback.call(el);
                };
            return this.each(function(i,el){
                var $el = $(el);
                // Chrome Fix (Use keyup over keypress to detect backspace)
                // thank you @palerdot
                $el.is(':input') && $el.on('keyup keypress',function(e){
                    // This catches the backspace button in chrome, but also prevents
                    // the event from triggering too premptively. Without this line,
                    // using tab/shift+tab will make the focused element fire the callback.
                    if (e.type=='keyup' && e.keyCode!=8) return;
                    
                    // Check if timeout has been set. If it has, "reset" the clock and
                    // start over again.
                    if (timeoutReference) clearTimeout(timeoutReference);
                    timeoutReference = setTimeout(function(){
                        // if we made it here, our timeout has elapsed. Fire the
                        // callback
                        doneTyping(el);
                    }, timeout);
                }).on('blur',function(){
                    // If we can, fire the event since we're leaving the field
                    doneTyping(el);
                });
            });
        }
    });
})(jQuery);
<c:forEach var="orderDetail" items="${sessionScope.listOrderDetail}">
    
    $('#appendedInputButtons${orderDetail.product.code}').donetyping(function(){
        var value = $('#appendedInputButtons${orderDetail.product.code}').val();
        //console.log(value);
        window.location.href = '${pageContext.request.contextPath}/setquantity/${orderDetail.product.code}?quantity=' + value + '#appendedInputButtons${orderDetail.product.code}' ;
    });
    
</c:forEach>

</script>    
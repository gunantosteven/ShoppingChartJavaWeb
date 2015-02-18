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
                            <li><a href="${pageContext.request.contextPath}/category/${amountCategory.code}?page=1">${amountCategory.title.toUpperCase()} [${amountCategory.count}]</a></li>
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
			
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/register" method="POST" >
                    
                        <div class="control-group">
                                <label class="control-label" for="namaPenerima">Nama Penerima <sup>*</sup></label>
                                <div class="controls">
                                    <input type="text" id="namaPenerima" name="namaPenerima" placeholder="Nama Penerima" value="${customer.firstName}">
                                </div>
                        </div>
                                
                        <div class="control-group">
                                <label class="control-label" for="alamatPenagihan">Alamat Penagihan <sup>*</sup></label>
                                <div class="controls">
                                    <input type="text" id="alamatPenagihan" name="alamatPenagihan" placeholder="Alamat Penagihan" value="${customer.address.address1}">
                                </div>
                        </div>   
                                
                        <div class="control-group">
                                <label class="control-label" for="alamatPengiriman">Alamat Pengiriman <sup>*</sup></label>
                                <div class="controls">
                                    <input type="text" id="alamatPenagihan" name="alamatPengiriman" placeholder="Alamat Pengiriman" value="${customer.address.address2}">
                                </div>
                        </div>      
                                
                        <div class="control-group">
                                <label class="control-label" for="kota">Kota <sup>*</sup></label>
                                <div class="controls">
                                    <input type="text" id="kota" name="kota" placeholder="Kota" value="${customer.address.city}">
                                </div>
                        </div>    
                                
                        <div class="control-group">
                                <label class="control-label" for="negara">Negara <sup>*</sup></label>
                                <div class="controls">
                                    <input type="text" id="negara" name="negara" placeholder="Negara" value="${customer.address.country}">
                                </div>
                        </div>   
                                
                        <div class="control-group">
                                <label class="control-label" for="kodePos">Kode Pos <sup>*</sup></label>
                                <div class="controls">
                                    <input type="text" id="kodePos" name="kodePos" placeholder="kodePos" value="${customer.address.kodePos}">
                                </div>
                        </div>      
                                
                        <div class="control-group">
                                <label class="control-label" for="mobilephone">Telepon <sup>*</sup></label>
                                <div class="controls">
                                    <input type="text" id="mobilephone" name="mobilephone" placeholder="Telepon" value="${customer.address.mobilephone}">
                                </div>
                        </div>    
                                
                        <div class="control-group">
                                <label class="control-label" for="additionalInformation">Informasi Tambahan <sup>*</sup></label>
                                <div class="controls">
                                    <input type="text" id="additionalInformation" name="additionalInformation" placeholder="Informasi Tamabahan" value="${customer.address.additionalInformation}">
                                </div>
                        </div>           
                                
                        <div class="control-group">
                                <div class="controls">
                                        <input class="btn btn-large btn-success" type="submit" value="Selesai" />
                                </div>
                        </div>        
                    
                    </form>
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
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
<div id="carouselBlk">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
		  <div class="item active">
		  <div class="container">
			<a href="${pageContext.request.contextPath}/register"><img style="width:100%" src="${pageContext.request.contextPath}/themes/images/carousel/1.png" alt="special offers"/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="${pageContext.request.contextPath}/register"><img style="width:100%" src="${pageContext.request.contextPath}/themes/images/carousel/2.png" alt=""/></a>
				<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="${pageContext.request.contextPath}/register"><img src="${pageContext.request.contextPath}/themes/images/carousel/3.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
			
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="${pageContext.request.contextPath}/register"><img src="${pageContext.request.contextPath}/themes/images/carousel/4.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		   
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="${pageContext.request.contextPath}/register"><img src="${pageContext.request.contextPath}/themes/images/carousel/5.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			</div>
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="${pageContext.request.contextPath}/register"><img src="${pageContext.request.contextPath}/themes/images/carousel/6.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	  </div> 
</div>
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="span3">
		<div class="well well-small"><a id="myCart" href="product_summary.html"><img src="${pageContext.request.contextPath}/themes/images/ico-cart.png" alt="cart">${sessionScope.listOrderDetail.size() ==  null ? 0 : sessionScope.listOrderDetail.size()} Items in your cart  <span class="badge badge-warning pull-right">Rp.${sessionScope.totalPrice == null ? 0 : sessionScope.totalPrice}</span></a></div>
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
			
		<h4>Latest Products </h4>
			  <ul class="thumbnails">
                              <c:forEach var="product" items="${latestProducts}">
                                  <li class="span3">
                                    <div class="thumbnail">
                                        <a  href="${pageContext.request.contextPath}/product/${product.code}">
                                            <div class="images">
                                                <img src="data:image/jpeg;base64,${product.getEncodedImageString()}" width="160" height="160" alt=""/> 
                                            </div>
                                        </a>
                                          <div class="caption">
                                              <c:choose>
                                                    <c:when test="${product.title.length() <= 22}">
                                                        <h5>${product.title}</h5> <br>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h5>${product.title}</h5>
                                                    </c:otherwise>
                                              </c:choose>
                                            <p> 
                                                  ${product.description}
                                            </p>

                                            <h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath}/product/${product.code}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="${pageContext.request.contextPath}/addcart/${product.code}">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${product.getRupiahFormat()}</a></h4>
                                          </div>
                                    </div>
                                  </li>
                              </c:forEach>
			  </ul>	

		</div>
		</div>
	</div>
</div>
                         
    <jsp:include page="include/footer.jsp" />
    
<span id="themesBtn"></span>
</body>
</html>
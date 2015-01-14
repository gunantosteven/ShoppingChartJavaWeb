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
<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="include/header.jsp" />
  </head>
<body>
<jsp:include page="include/menu.jsp" >
    <jsp:param name="amountCategories" value="${amountCategories}"/>
</jsp:include>
<!-- Header End====================================================================== -->
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="span3">
		<div class="well well-small"><a id="myCart" href="product_summary.html"><img src="${pageContext.request.contextPath}/themes/images/ico-cart.png" alt="cart">0 Items in your cart  <span class="badge badge-warning pull-right">Rp.0</span></a></div>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
			<c:forEach var="amountCategory" items="${amountCategories}">
                            <li><a href="${pageContext.request.contextPath}/products/${amountCategory.title}?page=1">${amountCategory.title.toUpperCase()} [${amountCategory.count}]</a></li>
                        </c:forEach>
		</ul>
		<br/>
                <c:forEach var="product" items="${productsByCategory}" begin="0" end="1" step="1">
                    <div class="thumbnail">
			<img src="data:image/jpeg;base64,${product.getEncodedImageString()}" alt=""/>
			<div class="caption">
			  <h5>${product.title}</h5>
				<h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath}/product/${product.code}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="${pageContext.request.contextPath}/contact">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${product.getRupiahFormat()}</a></h4>
			</div>
		  </div><br/>
                </c:forEach>
			<div class="thumbnail">
				<img src="${pageContext.request.contextPath}/themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
				<div class="caption">
				  <h5>Payment Methods</h5>
				</div>
			  </div>
	</div>
<!-- Sidebar end=============================================== -->
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/">Home</a> <span class="divider">/</span></li>
		<li class="active">${amountCategory.title.toUpperCase()} Products</li>
    </ul>
	<h3> ${amountCategory.title.toUpperCase()} Products <small class="pull-right"> ${amountCategory.count} products are available </small></h3>	
	<hr class="soft"/>
	<p>
		 ${category.description}
	</p>
	<hr class="soft"/>
	<form class="form-horizontal span6">
		<div class="control-group">
		  <label class="control-label alignL">Sort By </label>
			<select>
              <option>Product name A - Z</option>
              <option>Prioduct name Z - A</option>
              <option>Product Stoke</option>
              <option>Price Lowest first</option>
            </select>
		</div>
	  </form>
	  
<div id="myTab" class="pull-right">
 <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
 <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
</div>
<br class="clr"/>
<div class="tab-content">
	<div class="tab-pane" id="listView">
		<c:forEach var="product" items="${productsByCategory}">
				<div class="row">	  
					<div class="span2">
                                            <div class="images">
						<img src="data:image/jpeg;base64,${product.getEncodedImageString()}" alt=""/>
					
                                            </div>
                                        </div>        
					<div class="span4">
						<h3>New | Available</h3>				
						<hr class="soft"/>
						<h5>${product.title} </h5>
						<p>
						${product.descriptionFull}
						</p>
						<a class="btn btn-small pull-right" href="${pageContext.request.contextPath}/product/${product.code}">View Details</a>
						<br class="clr"/>
					</div>
					<div class="span3 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> ${product.getRupiahFormat()}</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br/>
					<div class="btn-group">
					  <a href="${pageContext.request.contextPath}/contact" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
					  <a href="${pageContext.request.contextPath}/product/${product.code}" class="btn btn-large"><i class="icon-zoom-in"></i></a>
					 </div>
						</form>
					</div>
                                <hr class="soft"/>  
                                </div> 
                </c:forEach>        
	</div>

	<div class="tab-pane  active" id="blockView">
		<ul class="thumbnails">
			<c:forEach var="product" items="${productsByCategory}">
					<li class="span3">
					  <div class="thumbnail">
                                              <a href="${pageContext.request.contextPath}/product/${product.code}"><div class="images"><img src="data:image/jpeg;base64,${product.getEncodedImageString()}" alt=""/></div></a>
						<div class="caption">
						  <h5>${product.category.title.toUpperCase()}</h5>
						  <p> 
							${product.description}
						  </p>
						  <h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath}/product/${product.code}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="${pageContext.request.contextPath}/contact">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${product.getRupiahFormat()}</a></h4>
						</div>
					  </div>
					</li>
                        </c:forEach> 
		  </ul>
	<hr class="soft"/>
	</div>
</div>

	<a href="compair.html" class="btn btn-large pull-right">Compair Product</a>
	<div class="pagination">
			<ul>
			<li><a href="#">&lsaquo;</a></li>
                        <c:forEach var="i" begin="1" end="${amountCategory.count/6 == 1 ? amountCategory.count/6 : amountCategory.count/6+1}">
                            <li><a href="${pageContext.request.contextPath}/products/${amountCategory.title}?page=${i}">${i}</a></li>
                        </c:forEach>
			<li><a href="#">&rsaquo;</a></li>
			</ul>
			</div>
			<br class="clr"/>
</div>
</div>
</div>
</div>
<!-- MainBody End ============================= -->
<jsp:include page="include/footer.jsp" />
<span id="themesBtn"></span>
</body>
</html>
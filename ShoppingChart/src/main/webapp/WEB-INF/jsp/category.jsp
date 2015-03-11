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
<jsp:include page="include/menu.jsp" />
<!-- Header End====================================================================== -->
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="span3">
		<div class="well well-small"><a id="myCart" href="${pageContext.request.contextPath}/product_summary"><img src="${pageContext.request.contextPath}/themes/images/ico-cart.png" alt="cart">0 Items in your cart  <span class="badge badge-warning pull-right">Rp.0</span></a></div>
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
                <c:forEach var="itemCategory" items="${recommendedProducts}" begin="0" end="1" step="1">
                    <div class="thumbnail">
			<img src="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}" alt=""/>
			<div class="caption">
			  <h5>${itemCategory.product.title}</h5>
				<h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath}/product/${itemCategory.product.code}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="${pageContext.request.contextPath}/addcart/${itemCategory.product.code}">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${itemCategory.product.getRupiahFormat()}</a></h4>
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
    <ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/">Home</a> <span class="divider">/</span></li>
		<li class="active">${amountCategory.itemCategory.category.title.toUpperCase()} Products</li>
    </ul>
	<h3> ${amountCategory.itemCategory.category.title.toUpperCase()} Products <small class="pull-right"> ${amountCategory.count} products are available </small></h3>	
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
		<c:forEach var="itemCategory" items="${itemCategoriesByCategory}">
				<div class="row">	  
					<div class="span2">
                                            <div class="images">
						<img src="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}" alt=""/>
					
                                            </div>
                                        </div>        
					<div class="span4">
						<h3>New | Available</h3>				
						<hr class="soft"/>
						<h5>${itemCategory.product.title} </h5>
						<p>
						${itemCategory.product.descriptionFull}
						</p>
						<a class="btn btn-small pull-right" href="${pageContext.request.contextPath}/product/${itemCategory.product.code}">View Details</a>
						<br class="clr"/>
					</div>
					<div class="span3 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> ${itemCategory.product.getRupiahFormat()}</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br/>
					<div class="btn-group">
					  <a href="${pageContext.request.contextPath}/addcart/${itemCategory.product.code}" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
					  <a href="${pageContext.request.contextPath}/product/${itemCategory.product.code}" class="btn btn-large"><i class="icon-zoom-in"></i></a>
					 </div>
						</form>
					</div>
                                <hr class="soft"/>  
                                </div> 
                </c:forEach>        
	</div>

	<div class="tab-pane  active" id="blockView">
		<ul class="thumbnails">
			<c:forEach var="itemCategory" items="${itemCategoriesByCategory}">
					<li class="span3">
					  <div class="thumbnail">
                                              <a href="${pageContext.request.contextPath}/product/${itemCategory.product.code}"><div class="images"><img src="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}" alt=""/></div></a>
						<div class="caption">
						  <h5>${itemCategory.product.title.toUpperCase()}</h5>
						  <p> 
							${itemCategory.product.description}
						  </p>
						  <h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath}/product/${itemCategory.product.code}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="${pageContext.request.contextPath}/addcart/${itemCategory.product.code}">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${itemCategory.product.getRupiahFormat()}</a></h4>
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
                            <li><a href="${pageContext.request.contextPath}/products/${amountCategory.itemCategory.category.title}?page=${i}">${i}</a></li>
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
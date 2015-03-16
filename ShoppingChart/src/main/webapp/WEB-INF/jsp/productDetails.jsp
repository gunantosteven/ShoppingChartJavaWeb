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
    <li><a href="${pageContext.request.contextPath}/products/${itemCategory.category.title}?page=1">${itemCategory.category.title.toUpperCase()} Products</a> <span class="divider">/</span></li>
    <li class="active">${itemCategory.product.title} Details</li>
    </ul>	
	<div class="row">	  
			<div id="gallery" class="span3">
            <a href="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}" title="Fujifilm FinePix S2950 Digital Camera">
				<img src="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}" style="width:100%" alt="Fujifilm FinePix S2950 Digital Camera"/>
            </a>
			<div id="differentview" class="moreOptopm carousel slide">
                <div class="carousel-inner">
                  <div class="item active">
                   <a href="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}"> <img style="width:29%" src="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}" alt=""/></a>
                  </div>
                  <div class="item">
                   <a href="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}" > <img style="width:29%" src="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}" alt=""/></a>
                  </div>
                </div>
              <!--  
			  <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
              <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> 
			  -->
              </div>
			  
			 <div class="btn-toolbar">
			  <div class="btn-group">
				<span class="btn"><i class="icon-envelope"></i></span>
				<span class="btn" ><i class="icon-print"></i></span>
				<span class="btn" ><i class="icon-zoom-in"></i></span>
				<span class="btn" ><i class="icon-star"></i></span>
				<span class="btn" ><i class=" icon-thumbs-up"></i></span>
				<span class="btn" ><i class="icon-thumbs-down"></i></span>
			  </div>
			</div>
			</div>
			<div class="span6">
				<h3>${itemCategory.product.title}  </h3>
				<small>- ${itemCategory.product.description}</small>
				<hr class="soft"/>
                                <form id="formProducts" class="form-horizontal qtyFrm" action="${pageContext.request.contextPath}/setquantity/${itemCategory.product.code}">
				  <div class="control-group">
					<label class="control-label"><span>${itemCategory.product.getRupiahFormat()}</span></label>
					<div class="controls">
                                            <input type="number" class="span1" placeholder="Qty." name="quantity"/>
					  <button type="submit" class="btn btn-large btn-primary pull-right" > Add to cart <i class=" icon-shopping-cart"></i></button>
					</div>
				  </div>
				</form>
				
				<hr class="soft"/>
				<h4>Stock Masih Ada</h4>
				
				<hr class="soft clr"/>
				<p>
				${itemCategory.product.descriptionFull}
				
				</p>
				<a class="btn btn-small pull-right" href="#detail">More Details</a>
				<br class="clr"/>
			<a href="#" name="detail"></a>
			<hr class="soft"/>
			</div>
			
			<div class="span9">
            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">${itemCategory.product.title} Details</a></li>
              <li><a href="#profile" data-toggle="tab">Related Products</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade active in" id="home">
			  <h4>Product Information</h4>
                
              </div>
		<div class="tab-pane fade" id="profile">
		<div id="myTab" class="pull-right">
		 <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
		 <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
		</div>
		<br class="clr"/>
		<hr class="soft"/>
		<div class="tab-content">
			<div class="tab-pane" id="listView">
                            <c:forEach var="itemCategory" items="${recommendedProducts}">
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
					  <a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>
					 </div>
						</form>
					</div>
                                <hr class="soft"/>  
                                </div> 
                            </c:forEach>            
			
			
			
		</div>
			<div class="tab-pane active" id="blockView">
				<ul class="thumbnails">
                                    <c:forEach var="itemCategory" items="${recommendedProducts}">
					<li class="span3">
					  <div class="thumbnail">
                                              <a href="${pageContext.request.contextPath}/product/${itemCategory.product.code}"><div class="images"><img src="data:image/jpeg;base64,${itemCategory.product.getEncodedImageString()}" alt=""/></div></a>
						<div class="caption">
						  <h5>${itemCategory.category.title.toUpperCase()}</h5>
						  <p> 
							${itemCategory.product.description}
						  </p>
						  <h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath}/product/${itemCategory.product.code}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="${pageContext.request.contextPath}/contact">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${itemCategory.product.getRupiahFormat()}</a></h4>
						</div>
					  </div>
					</li>
                                    </c:forEach>    
				  </ul>
			<hr class="soft"/>
			</div>
		</div>
				<br class="clr">
					 </div>
		</div>
          </div>

	</div>
</div>
</div> </div>
</div>
<!-- MainBody End ============================= -->
    <jsp:include page="include/footer.jsp" />
<span id="themesBtn"></span>
</body>


<script type="text/javascript">
        $(document).ready(function () {
            
            $('#formProducts').submit(function(e) {
                e.preventDefault();
                var $form = $(this);
                
                $.ajax({
                    // url can be obtained via the form action attribute passed to the JSP.
                    url: $form.attr("action"),
                    cache: false,
                    data: $(this).serialize(),
                    type: 'GET',
                    statusCode: {
                        404: function() {
                            alert("Qty belum diisi");
                        },
                        500: function() {
                            alert("Failed to update Product");
                        },
                        400: function() {
                            alert("Persediaan product tidak cukup untuk memenuhi permintaan Anda");
                        }
                    },
                    success: function() {
                        alert("Success");
                        location.href = "${pageContext.request.contextPath}/product_summary";
                    }
                });
                return false;
            });
        });
    </script>
    
    

</html>
﻿<!DOCTYPE html>
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
			
                    <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Home</a> <span class="divider">/</span></li>
                    <li class="active"> SHOPPING CART</li>
                    </ul>
                    <h3>  SHOPPING CART [ <small>${sessionScope.listOrderDetail.size() ==  null ? 0 : sessionScope.listOrderDetail.size()} Item(s) </small>]<a href="${pageContext.request.contextPath}/" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Continue Shopping </a></h3>	
                    <hr class="soft"/>
                    <table class="table table-bordered">
                            <tr><th> I AM ALREADY REGISTERED  </th></tr>
                             <tr> 
                             <td>
                                    <form class="form-horizontal">
                                            <div class="control-group">
                                              <label class="control-label" for="inputUsername">Username</label>
                                              <div class="controls">
                                                    <input type="text" id="inputUsername" placeholder="Username" name="username">
                                              </div>
                                            </div>
                                            <div class="control-group">
                                              <label class="control-label" for="inputPassword1">Password</label>
                                              <div class="controls">
                                                    <input type="password" id="inputPassword1" placeholder="Password" name="password">
                                              </div>
                                            </div>
                                            <div class="control-group">
                                              <div class="controls">
                                                    <button type="submit" class="btn">Sign in</button> OR <a href="${pageContext.request.contextPath}/login" class="btn">Register Now!</a>
                                              </div>
                                            </div>
                                            <div class="control-group">
                                                    <div class="controls">
                                                      <a href="forgetpass.html" style="text-decoration:underline">Forgot password ?</a>
                                                    </div>
                                            </div>
                                    </form>
                              </td>
                              </tr>
                    </table>		

                    <table class="table table-bordered">
                          <thead>
                            <tr>
                              <th>Product</th>
                              <th>Description</th>
                              <th>Quantity/Update</th>
                                              <th>Price</th>
                              <th>Discount</th>
                              <th>Tax</th>
                              <th>Total</th>
                                            </tr>
                          </thead>
                          <tbody>
                              <c:forEach var="orderDetail" items="${sessionScope.listOrderDetail}">
                                  <tr>
                                    <td><img width="60" src="data:image/jpeg;base64,${orderDetail.product.getEncodedImageString()}" alt=""/></td>
                                    <td>${orderDetail.product.description}</td>
                                    <td>
                                        <div class="input-append">
                                            <input class="span1" style="max-width:34px" placeholder="${orderDetail.quantity}" id="appendedInputButtons" size="16" type="text">
                                            <button class="btn" type="button"><i class="icon-minus"></i></button>
                                            <button class="btn" type="button"><i class="icon-plus"></i></button>
                                            <button class="btn btn-danger" type="button"><i class="icon-remove icon-white"></i></button>
                                        </div>
                                  </td>
                                  <td>Rp.${orderDetail.product.price}</td>
                                  <td>--</td>
                                  <td>--</td>
                                  <td>Rp.${orderDetail.product.price * orderDetail.quantity}</td>
                                </tr>
                              </c:forEach>

                            <tr>
                              <td colspan="6" style="text-align:right">Total Price:	</td>
                              <td> Rp.${totalPrice}</td>
                            </tr>
                                             <tr>
                              <td colspan="6" style="text-align:right">Total Discount:	</td>
                              <td> Rp.0 </td>
                            </tr>
                             <tr>
                              <td colspan="6" style="text-align:right">Total Tax:	</td>
                              <td> Rp.0 </td>
                            </tr>
                                             <tr>
                              <td colspan="6" style="text-align:right"><strong>TOTAL (Rp.${totalPrice} - Rp.0 + Rp.0) =</strong></td>
                              <td class="label label-important" style="display:block"> <strong> Rp.${totalPrice} </strong></td>
                            </tr>
                                            </tbody>
                        </table>


                        <table class="table table-bordered">
                                    <tbody>
                                             <tr>
                              <td> 
                                            <form class="form-horizontal">
                                            <div class="control-group">
                                            <label class="control-label"><strong> VOUCHERS CODE: </strong> </label>
                                            <div class="controls">
                                            <input type="text" class="input-medium" placeholder="CODE">
                                            <button type="submit" class="btn"> ADD </button>
                                            </div>
                                            </div>
                                            </form>
                                            </td>
                            </tr>

                                    </tbody>
                                    </table>

                                    <table class="table table-bordered">
                                     <tr><th>ESTIMATE YOUR SHIPPING </th></tr>
                                     <tr> 
                                     <td>
                                            <form class="form-horizontal">
                                              <div class="control-group">
                                                    <label class="control-label" for="inputCountry">Country </label>
                                                    <div class="controls">
                                                      <input type="text" id="inputCountry" placeholder="Country">
                                                    </div>
                                              </div>
                                              <div class="control-group">
                                                    <label class="control-label" for="inputPost">Post Code/ Zipcode </label>
                                                    <div class="controls">
                                                      <input type="text" id="inputPost" placeholder="Postcode">
                                                    </div>
                                              </div>
                                              <div class="control-group">
                                                    <div class="controls">
                                                      <button type="submit" class="btn">ESTIMATE </button>
                                                    </div>
                                              </div>
                                            </form>				  
                                      </td>
                                      </tr>
                        </table>		
                    <a href="${pageContext.request.contextPath}/" class="btn btn-large"><i class="icon-arrow-left"></i> Continue Shopping </a>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-large pull-right">Next <i class="icon-arrow-right"></i></a>
		

		</div>
		</div>
	</div>
</div>
                         
    <jsp:include page="include/footer.jsp" />
    
<span id="themesBtn"></span>
</body>
</html>
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
		<div class="well well-small"><a id="myCart" href="product_summary.html"><img src="${pageContext.request.contextPath}/themes/images/ico-cart.png" alt="cart">0 Items in your cart  <span class="badge badge-warning pull-right">Rp.0</span></a></div>
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
		<div class="span9" style="min-height:900px">		
                    <ul class="breadcrumb">
                        <li><a href="${pageContext.request.contextPath}/">Home</a> <span class="divider">/</span></li>
                        <li class="active">Forget password?</li>
                    </ul>
                    <div class="well">
                            <h5>Reset your password</h5><br/>
                            Please enter the email address for your account. A verification code will be sent to you. Once you have received the verification code, you will be able to choose a new password for your account.<br/><br/><br/>
                            <form>
                              <div class="control-group">
                                    <label class="control-label" for="inputEmail1">E-mail address</label>
                                    <div class="controls">
                                      <input class="span3"  type="text" id="inputEmail1" placeholder="Email">
                                    </div>
                              </div>
                              <div class="controls">
                              <button type="submit" class="btn block">Submit</button>
                              </div>
                            </form>
                    </div>

		</div>
		</div>
	</div>
</div>
                         
    <jsp:include page="include/footer.jsp" />
    
<span id="themesBtn"></span>
</body>
</html>
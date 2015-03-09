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
		<div class="span9">
                    <ul class="breadcrumb">
                                <li><a href="${pageContext.request.contextPath}/">Home</a> <span class="divider">/</span></li>
                                <li class="active">Login</li>
                    </ul>
                    <h3> Login</h3>	
                    <hr class="soft"/>

                    <div class="row">
                            <div class="span4">
                                    <div class="well">
                                    <h5>CREATE YOUR ACCOUNT</h5><br/>
                                    Enter your e-mail address to create an account.<br/><br/><br/>
                                    <form action="${pageContext.request.contextPath}/register">
                                      <div class="control-group">
                                            <label class="control-label" for="inputEmail0">E-mail address</label>
                                            <div class="controls">
                                              <input class="span3"  type="text" id="inputEmail0" name="email" placeholder="Email">
                                            </div>
                                      </div>
                                      <div class="controls">
                                      <button type="submit" class="btn block">Create Your Account</button>
                                      </div>
                                    </form>
                            </div>
                            </div>
                            <div class="span1"> &nbsp;</div>
                            <div class="span4">
                                    <div class="well">
                                    <h5>ALREADY REGISTERED ?</h5>
                                    <c:if test="${not empty error}">
                                        <div class="error">${error}</div>
                                    </c:if>
                                    <c:if test="${not empty msg}">
                                        <div class="success">${msg}</div>
                                    </c:if>
                                    <form role="form" method="POST" action="${pageContext.request.contextPath}/j_spring_security_check">
                                      <div class="control-group">
                                            <label class="control-label" for="inputEmail1">Email</label>
                                            <div class="controls">
                                              <input class="span3"  type="text" id="inputEmail1" name="username" placeholder="Email">
                                            </div>
                                      </div>
                                      <div class="control-group">
                                            <label class="control-label" for="inputPassword1">Password</label>
                                            <div class="controls">
                                              <input type="password" class="span3"  id="inputPassword1" name="password" placeholder="Password">
                                            </div>
                                      </div>
                                      <div class="control-group">
                                            <div class="controls">
                                              <button type="submit" class="btn">Sign in</button> <a href="${pageContext.request.contextPath}/forgetpass">Forget password?</a>
                                            </div>
                                      </div>
                                      
                                      <input type="hidden" name="${_csrf.parameterName}"
                                        value="${_csrf.token}" />
                                    </form>
                            </div>
                            </div>
                    </div>	

		</div>
	</div>
	</div>
</div>
                         
    <jsp:include page="include/footer.jsp" />
    
<span id="themesBtn"></span>
</body>
</html>

<style>
    
    .info, .success, .warning, .error, .validation {
        border: 1px solid;
        margin: 10px 0px;
        padding:15px 10px 15px 50px;
        background-repeat: no-repeat;
        background-position: 10px center;
    }
    
    .error {
        color: #D8000C;
        background-color: #FFBABA;
        background-image: url('error.png');
    }
    
    .success {
        color: #4F8A10;
        background-color: #DFF2BF;
        background-image:url('success.png');
    }
</style>    
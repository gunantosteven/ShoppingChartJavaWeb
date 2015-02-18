<%-- 
    Document   : menu
    Created on : Jan 8, 2015, 1:21:53 PM
    Author     : gunanto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
    <div class="span6">Welcome! 
        <c:choose>
            <c:when test="${name != 'anonymousUser'}">
                <strong>${name}</strong> <a href="javascript:formSubmit()"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
            </c:when>
            <c:otherwise>
                <strong>User</strong> 
            </c:otherwise>
        </c:choose>
    </div>
	<div class="span6">
	<div class="pull-right">
		<a href="product_summary.html"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ 0 ] Items in your cart </span> </a> 
	</div>
	</div>
</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/themes/images/logo.png" alt="Bootsshop"/></a>
		<form class="form-inline navbar-search" method="get" action="${pageContext.request.contextPath}/search" >
                    <input id="titleProduct" class="titleProduct" name="titleProduct" type="text" />
                    <select class="srchTxt" name="codeCategory">
                      <option value="all">All</option>
                      <c:forEach var="category" items="${amountCategories}">
                          <option value="${category.code}" >${fn:toUpperCase(category.title)} </option>
                      </c:forEach>
                  </select> 
		  <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                </form>
    <ul id="topMenu" class="nav pull-right">
	 <li class=""><a href="${pageContext.request.contextPath}/">Specials Offer</a></li>
	 <li class=""><a href="${pageContext.request.contextPath}/contact">Cara Pembeliaan</a></li>
	 <li class="">
        <c:choose>
        <c:when test="${name == 'anonymousUser'}">
            <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
        </c:when>
        <c:otherwise>
            <a href="javascript:formSubmit()" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Logout</span></a>
        </c:otherwise>
        </c:choose>
	 
	<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3>Login Block</h3>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal loginFrm" method="POST" action="${pageContext.request.contextPath}/j_spring_security_check" >	
                            
                          <div class="control-group">								
				<input type="text" name="username" id="inputEmail" placeholder="Email">
			  </div>
			  <div class="control-group">
				<input type="password" name="password" id="inputPassword" placeholder="Password">
			  </div>
			  <div class="control-group">
				<label class="checkbox">
				<input type="checkbox"> Remember me
				</label>
			  </div>
                          
                          <input type="hidden" name="${_csrf.parameterName}"
                                            value="${_csrf.token}" />
                          
                            <button type="submit" class="btn btn-success">Sign in</button>
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                        
                        
			</form>		
			
		  </div>
	</div>
	</li>
    </ul>
  </div>
</div>
</div>
</div>
<!-- Header End====================================================================== -->
<form action="${pageContext.request.contextPath}/j_spring_security_logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
</form>
<script>
        function formSubmit() {
                document.getElementById("logoutForm").submit();
        }
</script>        

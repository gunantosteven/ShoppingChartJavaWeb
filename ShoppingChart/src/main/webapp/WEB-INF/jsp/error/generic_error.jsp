<%-- 
    Document   : generic_error
    Created on : Jan 9, 2015, 7:29:39 PM
    Author     : gunanto
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
 
	<c:if test="${not empty errCode}">
		<h1>${errCode} : System Errors</h1>
	</c:if>
 
	<c:if test="${empty errCode}">
		<h1>System Errors</h1>
	</c:if>
 
	<c:if test="${not empty errMsg}">
		<h4>${errMsg}</h4>
	</c:if>
 
</body>
</html>

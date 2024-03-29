<%-- 
    Document   : AddCategory
    Created on : Jan 4, 2015, 8:50:07 PM
    Author     : gunanto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <jsp:include page="include/header.jsp" />
        
    </head>
    <body>
        <div id="wrapper">
            
            <jsp:include page="include/menu.jsp" />
            
            <div id="page-wrapper">
                
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Tambah Category</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            
                
                <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Form Elements
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <c:if test="${error != null}">
                                        <div class="alert alert-warning">
                                            <a href="#" class="close" data-dismiss="alert">&times;</a>
                                            <strong>Warning !</strong> ${error}
                                        </div>
                                    </c:if> 
                                    
                                    <form role="form" action="${pageContext.request.contextPath}/admin/categories/addcategory" method="POST">
                                        <div class="form-group">
                                            <label>Title</label>
                                            <input name="title" class="form-control" placeholder="Enter text">
                                            <p class="help-block">Filled with title category</p>
                                            
                                            <label>Code</label>
                                            <input name="code" class="form-control" placeholder="Enter text">
                                            <p class="help-block">Filled with code category</p>
                                            
                                            <label>Description</label>
                                            <input name="description" class="form-control" placeholder="Enter text">
                                            <p class="help-block">Description Category</p>
                                            
                                            <label>Parent Category</label>
                                            <select class="form-control" name="parentCategoryUuid">
                                                    <option value="" >Kosong</option>
                                                <c:forEach var="category" items="${listCategories}">
                                                    <c:choose>
                                                        <c:when test="${category.uuid.equals(requestScope.category.parentCategory.uuid) }">
                                                            <option value="${category.uuid}" selected>${category.title}</option>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <option value="${category.uuid}"  >${category.title}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                            <p class="help-block">Select Category</p>
                                        </div>
                                        
                                        <!-- spring security needed -->
                                        <input type="hidden" name="${_csrf.parameterName}"
                                        value="${_csrf.token}" />
                                        
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                    </form>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
            
        </div>
        <!-- /#wrapper -->
        
        
        <jsp:include page="include/footer.jsp" />
    </body>
</html>

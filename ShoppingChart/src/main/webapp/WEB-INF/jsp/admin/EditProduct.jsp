<%-- 
    Document   : product.jsp
    Created on : Dec 26, 2014, 4:50:25 PM
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
                        <h1 class="page-header">Tambah Produk</h1>
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
                                    <form role="form" action="${pageContext.request.contextPath}/admin/products" method="POST" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>UUID</label>
                                            <input value="${product.uuid}" name="uuid" class="form-control" readonly="readonly">
                                            
                                            <label>Title</label>
                                            <input value="${product.title}" name="title" class="form-control" placeholder="Enter text">
                                            <p class="help-block">Filled with title product</p>
                                            
                                            <label>Description</label>
                                            <input value="${product.description}" name="description" class="form-control" placeholder="Enter text">
                                            <p class="help-block">Description Product</p>
                                            
                                            <label>Description Full</label>
                                            <textarea name="descriptionFull" class="form-control" rows="3">${product.descriptionFull}</textarea>
                                            <p class="help-block">Description Full</p>
                                            
                                            <label>Category</label>
                                            <select class="form-control" name="categoryUuid">
                                                <c:forEach var="category" items="${listCategories}">
                                                    <c:choose>
                                                        <c:when test="${category.uuid.equals(product.category.uuid) }">
                                                            <option value="${category.uuid}" selected>${category.title}</option>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <option value="${category.uuid}"  >${category.title}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                            <p class="help-block">Select Category</p>
                                            
                                            <label>Code</label>
                                            <input value="${product.code}" name="code" class="form-control" placeholder="Enter text">
                                            <p class="help-block">Product Code</p>
                                            
                                            <label>Image</label><br>    
                                            <img src="data:image/jpeg;base64,${image}" width="200" height="200"> 
                                            <input name="img" type="file" value="${product.image}">
                                            <p class="help-block">Image Product</p>
                                            
                                            <label>Price</label>
                                            <input value="${product.price}" name="price" class="form-control" placeholder="Enter text" type="number">
                                            <p class="help-block">Product Price</p>
                                        </div>
                                        <button type="submit" class="btn btn-default">Edit</button>
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

<%-- 
    Document   : products
    Created on : Dec 28, 2014, 8:46:46 AM
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
                    <div class="col-lg-8">
                        <h1 class="page-header">Products</h1>
                    </div>
                    <!-- /.col-lg-8 -->
                    <div class="col-lg-4">
                        <h2 class="page-header"><a href="${pageContext.request.contextPath}/admin/products/addproduct">Add Product</a></h2>
                    </div>
                    <!-- /.col-lg-4 -->
                </div>
                
                
                <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Products Table
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Code</th>
                                            <th>Description</th>
                                            <th>Price</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <c:forEach var="product" items="${listProducts}">
                                            <tr class="odd gradeX">
                                                <td>${product.uuid}</td>
                                                <td>${product.code}</td>
                                                <td>${product.description}</td>
                                                <td>${product.price}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/products/detail/${product.uuid}">Edit</a>
                                                    <a href="${pageContext.request.contextPath}/admin/products/delete/${product.uuid}" onClick="return confirm('Apakah Anda Yakin?')">Delete</a></td>
                                            </tr>                                           
                                        </c:forEach>
                                    </tbody>    
                                    
                                </table>
                            </div>
                        </div>    
                    </div>
                </div>    
                
                </div>
                                    
            </div>                        
            
        </div>    
                                    
        <jsp:include page="include/footer.jsp" />                            
        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
        $(document).ready(function() {
            $('#dataTables-example').dataTable();
        });
        </script>                          
    </body>
</html>

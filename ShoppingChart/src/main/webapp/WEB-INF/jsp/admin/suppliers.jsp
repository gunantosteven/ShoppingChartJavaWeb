<%-- 
    Document   : suppliers
    Created on : Mar 17, 2015, 8:57:14 PM
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
                        <h1 class="page-header">Suppliers</h1>
                    </div>
                    <!-- /.col-lg-8 -->
                    <div class="col-lg-4">
                        <h2 class="page-header"><a href="${pageContext.request.contextPath}/admin/suppliers/addsupplier">Add Supplier</a></h2>
                    </div>
                    <!-- /.col-lg-4 -->
                </div>
                    
                <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Suppliers Table
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    
                                    <thead>
                                        <tr>
                                            <th>Kode Supplier</th>
                                            <th>Nama Supplier</th>
                                            <th>PIN BB</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <c:forEach var="supplier" items="${listSuppliers}">
                                            <tr class="odd gradeX">
                                                <td><a href="${pageContext.request.contextPath}/admin/suppliers/detail/${supplier.uuid}">${supplier.kodeSupplier}</a></td>
                                                <td>${supplier.namaSupplier}</td>
                                                <td>${supplier.pinBb}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/suppliers/detail/${supplier.uuid}">Edit</a>
                                                    <a href="${pageContext.request.contextPath}/admin/suppliers/delete/${supplier.uuid}" onClick="return confirm('Apakah Anda Yakin?')">Delete</a></td>
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

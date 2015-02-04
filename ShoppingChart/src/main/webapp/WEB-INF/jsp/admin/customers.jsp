<%-- 
    Document   : customers
    Created on : Jan 4, 2015, 8:13:35 PM
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
                        <h1 class="page-header">Customers</h1>
                    </div>
                    <!-- /.col-lg-8 -->
                    <div class="col-lg-4">
                        <h2 class="page-header"><a href="${pageContext.request.contextPath}/admin/customers/addcustomer">Add Customer</a></h2>
                    </div>
                    <!-- /.col-lg-4 -->
                </div>
                    
                <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Customers Table
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    
                                    <thead>
                                        <tr>
                                            <th>Email</th>
                                            <th>FirstName</th>
                                            <th>LastName</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <c:forEach var="customer" items="${listCustomer}">
                                            <tr class="odd gradeX">
                                                <td>${customer.user.username}</td>
                                                <td>${customer.firstName}</td>
                                                <td>${customer.lastName}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/customers/detail/${customer.uuid}">Edit</a>
                                                    <a href="${pageContext.request.contextPath}/admin/customers/delete/${customer.uuid}" onClick="return confirm('Apakah Anda Yakin?')">Delete</a></td>
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

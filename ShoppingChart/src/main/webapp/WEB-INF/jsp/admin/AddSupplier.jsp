<%-- 
    Document   : AddSupplier
    Created on : Mar 17, 2015, 9:30:09 PM
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
                        <h1 class="page-header">Tambah Supplier</h1>
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
                                    
                                    <form role="form" action="${pageContext.request.contextPath}/admin/suppliers/addsupplier" method="POST">
                                        <div class="control-group">
                                                <label class="control-label" for="kodeSupplier">Kode Supplier <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="kodeSupplier" name="kodeSupplier" placeholder="Kode Supplier">
                                                </div>
                                         </div>
                                         <div class="control-group">
                                                <label class="control-label" for="namaSupplier">Nama Supplier <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="namaSupplier" name="namaSupplier" placeholder="Nama Supplier">
                                                </div>
                                         </div>
                                        <div class="control-group">
                                                <label class="control-label" for="alamatSupplier">Alamat Supplier <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="alamatSupplier" name="alamatSupplier" placeholder="Alamat Supplier">
                                                </div>
                                        </div>	  
                                        <div class="control-group">
                                                <label class="control-label" for="teleponSupplier">Telepon Supplier <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="teleponSupplier" name="teleponSupplier" placeholder="Telepon Supplier">
                                                </div>
                                        </div>		  
                                        <div class="control-group">
                                                <label class="control-label" for="pinBb">PIN BB <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="pinBb" name="pinBb" placeholder="PIN BB">
                                                </div>
                                        </div>

                                        <p><sup>*</sup>Required field	</p>
                                        
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



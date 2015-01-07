<%-- 
    Document   : product.jsp
    Created on : Dec 26, 2014, 4:50:25 PM
    Author     : gunanto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <h1 class="page-header">Edit Category</h1>
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
                                    <form role="form" action="${pageContext.request.contextPath}/admin/categories" method="POST">
                                        <div class="form-group">
                                            <label>UUID</label>
                                            <input value="${category.uuid}" name="uuid" class="form-control" readonly="readonly">
                                            
                                            <label>Title</label>
                                            <input value="${category.title}" name="title" class="form-control" placeholder="Enter text">
                                            <p class="help-block">Filled with title category</p>
                                            
                                            <label>Description</label>
                                            <input value="${category.description}" name="description" class="form-control" placeholder="Enter text">
                                            <p class="help-block">Description Category</p>
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

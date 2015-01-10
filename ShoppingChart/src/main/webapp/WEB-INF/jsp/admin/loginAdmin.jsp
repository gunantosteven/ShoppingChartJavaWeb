<%-- 
    Document   : admin
    Created on : Sep 20, 2014, 6:35:40 PM
    Author     : Steven Gunanto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Admin</title>
       
        
        <jsp:include page="include/header.jsp" />
    </head>
    <body>
     
        <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
         

                        <c:if test="${not empty error}">
                                <div class="error">${error}</div>
                        </c:if>
                        <c:if test="${not empty msg}">
                                <div class="msg">${msg}</div>
                        </c:if>


                        <form role="form" method="POST" action="${pageContext.request.contextPath}/j_spring_security_check" >  
                            <fieldset>

                                <!-- Form Name -->
                                <legend>Login Admin</legend>


                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Username" name="username" type="username" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                        </label>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <button type="submit" class="btn btn-lg btn-success btn-block">Login</button>
                                </fieldset>

                                <input type="hidden" name="${_csrf.parameterName}"
                                        value="${_csrf.token}" />

                            </fieldset>
                        </form>
                                        
                    </div>
                </div>
            </div>
        </div>
    </div>                       
        
        
        <jsp:include page="include/footer.jsp" />
        
        <!-- Script to Activate the Carousel -->
        <script>
        $('.carousel').carousel({
            interval: 5000 //changes the speed
        })
        </script>
        
    </body>
</html>


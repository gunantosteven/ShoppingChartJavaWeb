cu<%-- 
    Document   : EditCustomer
    Created on : Feb 4, 2015, 7:51:48 PM
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
                        <h1 class="page-header">Edit Customer</h1>
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
                                    
                                    <form role="form" action="${pageContext.request.contextPath}/admin/customers/detail/${customer.uuid}" method="POST">
                                        <div class="control-group">
                                            <label class="control-label">Title <sup>*</sup></label>
                                            <div class="controls">
                                            <select class="span1 form-control" name="title">
                                                    <option value="" ${customer.title == '' ? "selected" : ""}>-</option>
                                                    <option value="Mr" ${customer.title == 'Mr' ? "selected" : ""}>Mr.</option>
                                                    <option value="Mrs" ${customer.title == 'Mrs' ? "selected" : ""}>Mrs</option>
                                                    <option value="Miss" ${customer.title == 'Miss' ? "selected" : ""}>Miss</option>
                                            </select>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                                <label class="control-label" for="inputFname1">First name <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="inputFname1" name="firstName" placeholder="First Name" value="${customer.firstName}">
                                                </div>
                                         </div>
                                         <div class="control-group">
                                                <label class="control-label" for="inputLnam">Last name <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="inputLname" name="lastName" placeholder="Last Name" value="${customer.lastName}">
                                                </div>
                                         </div>
                                        <div class="control-group">
                                                <label class="control-label" for="input_email">Email <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="input_email" name="username" placeholder="Email" readonly="readonly" value="${customer.user.username}">
                                                </div>
                                        </div>	  
                                        <div class="control-group">
                                                <label class="control-label" for="inputPassword1">Password <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="password" name="password" id="inputPassword1" placeholder="Password" value="${customer.user.password}">
                                                </div>
                                        </div>	  
                                        <div class="control-group">
                                                <label class="control-label">Date of Birth <sup>*</sup></label>
                                                <div class="controls">
                                                  <!-- Date Picker -->
                                                  <input class="form-control" placeholder="click to show datepicker"   name="birth"  type="date" value="${customer.birth}" required>
                                                </div>
                                        </div>

                                        <div class="alert alert-block alert-error fade in">
                                                <button type="button" class="close" data-dismiss="alert">×</button>
                                                <strong>Lorem Ipsum is simply</strong> dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
                                        </div>	

                                        <h4>Your address</h4>
                                        <div class="control-group">
                                                <label class="control-label" for="inputFname">First name <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="inputFname" name="firstNameAddress" placeholder="First Name" value="${customer.address.firstName}">
                                                </div>
                                        </div>
                                        <div class="control-group">
                                                <label class="control-label" for="inputLname">Last name <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="inputLname" name="lastNameAddress" placeholder="Last Name" value="${customer.address.lastName}"/>
                                                </div>
                                        </div>

                                        <div class="control-group">
                                                <label class="control-label" for="company">Company</label>
                                                <div class="controls">
                                                  <input class="form-control" type="text" id="company" name="company" placeholder="company" value="${customer.address.company}"/>
                                                </div>
                                        </div>

                                        <div class="control-group">
                                                <label class="control-label" for="address">Address<sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="address" name="address1" placeholder="Address" value="${customer.address.address1}"/> <span>Street address, P.O. box, company name, c/o</span>
                                                </div>
                                        </div>

                                        <div class="control-group">
                                                <label class="control-label" for="address2">Address (Line 2)<sup>*</sup></label>
                                                <div class="controls">
                                                  <input class="form-control" type="text" id="address2" name="address2" placeholder="Adress line 2" value="${customer.address.address2}"/> <span>Apartment, suite, unit, building, floor, etc.</span>
                                                </div>
                                        </div>
                                        <div class="control-group">
                                                <label class="control-label" for="city">City<sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="city" name="city" placeholder="city" value="${customer.address.city}"/> 
                                                </div>
                                        </div>
                                        <div class="control-group">
                                                <label class="control-label" for="Country">Country<sup>*</sup></label>
                                                <div class="controls">
                                                  <select class="form-control" id="country" name="country" >
                                                        <option value="">-</option>
                                                        <option value="1">Alabama</option><option value="2">Alaska</option><option value="3">Arizona</option><option value="4">Arkansas</option><option value="5">California</option><option value="6">Colorado</option><option value="7">Connecticut</option><option value="8">Delaware</option><option value="53">District of Columbia</option><option value="9">Florida</option><option value="10">Georgia</option><option value="11">Hawaii</option><option value="12">Idaho</option><option value="13">Illinois</option><option value="14">Indiana</option><option value="indonesia">Indonesia</option><option value="15">Iowa</option><option value="16">Kansas</option><option value="17">Kentucky</option><option value="18">Louisiana</option><option value="19">Maine</option><option value="20">Maryland</option><option value="21">Massachusetts</option><option value="22">Michigan</option><option value="23">Minnesota</option><option value="24">Mississippi</option><option value="25">Missouri</option><option value="26">Montana</option><option value="27">Nebraska</option><option value="28">Nevada</option><option value="29">New Hampshire</option><option value="30">New Jersey</option><option value="31">New Mexico</option><option value="32">New York</option><option value="33">North Carolina</option><option value="34">North Dakota</option><option value="35">Ohio</option><option value="36">Oklahoma</option><option value="37">Oregon</option><option value="38">Pennsylvania</option><option value="51">Puerto Rico</option><option value="39">Rhode Island</option><option value="40">South Carolina</option><option value="41">South Dakota</option><option value="42">Tennessee</option><option value="43">Texas</option><option value="52">US Virgin Islands</option><option value="44">Utah</option><option value="45">Vermont</option><option value="46">Virginia</option><option value="47">Washington</option><option value="48">West Virginia</option><option value="49">Wisconsin</option><option value="50">Wyoming</option></select>
                                                </div>
                                        </div>		
                                        <div class="control-group">
                                                <label class="control-label" for="kodePos">Kode Pos<sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text" id="kodePos" name="kodePos" placeholder="Kode Pos" value="${customer.address.kodePos}"/> 
                                                </div>
                                        </div>

                                        <div class="control-group">
                                                <label class="control-label" for="aditionalInfo">Additional information</label>
                                                <div class="controls">
                                                  <textarea class="form-control" name="additionalInformation" id="aditionalInfo" cols="26" rows="3">${customer.address.additionalInformation}</textarea>
                                                </div>
                                        </div>
                                        <div class="control-group">
                                                <label class="control-label" for="phone">Home phone <sup>*</sup></label>
                                                <div class="controls">
                                                    <input class="form-control" type="text"  name="homephone" id="phone" placeholder="phone" value="${customer.address.homephone}"/> <span>You must register at least one phone number</span>
                                                </div>
                                        </div>

                                        <div class="control-group">
                                                <label class="control-label" for="mobile">Mobile Phone </label>
                                                <div class="controls">
                                                    <input class="form-control" type="text"  name="mobilephone" id="mobile" placeholder="Mobile Phone" value="${customer.address.mobilephone}"/> 
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
    
    <script type="text/javascript">
        // When the document is ready
        $(document).ready(function () {

            $('#datepicker').datepicker({
                format: "yyyy-mm-dd"
            });  

        });
    </script>
</html>


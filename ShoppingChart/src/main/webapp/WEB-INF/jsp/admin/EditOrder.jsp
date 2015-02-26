<%-- 
    Document   : product.jsp
    Created on : Feb 24, 2015, 6:36:25 PM
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
                        <h1 class="page-header">Edit Orders</h1>
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
                                <div class="col-lg-12">
                                    <c:if test="${error != null}">
                                        <div class="alert alert-warning">
                                            <a href="#" class="close" data-dismiss="alert">&times;</a>
                                            <strong>Warning !</strong> ${error}
                                        </div>
                                    </c:if> 
                                    <form role="form" action="${pageContext.request.contextPath}/admin/orders" method="POST">
                                        <div class="form-group">
                                            <label>UUID</label>
                                            <input value="${order.uuid}" name="uuid" class="form-control" readonly="readonly">
                                            
                                            <label>Tanggal Order</label>
                                            <input class="form-control" placeholder="click to show datepicker"   name="date"   value="${order.date}" readonly="readonly">
                                            
                                            <label>BANK</label>
                                            <input value="${order.bank}" name="bank" class="form-control" placeholder="Enter text" readonly="readonly">

                                            
                                            <label>Nama Orang Transfer</label>
                                            <input value="${order.namaRekening}" name="namaRekening" class="form-control" placeholder="Enter text" readonly="readonly">
  
                                            
                                            <label>No Rekening</label>
                                            <input value="${order.noRekening}" name="noRekening" class="form-control" placeholder="Enter text" readonly="readonly">

                                            
                                            <label>Username</label>
                                            <input value="${order.customer.user.username}" name="username" class="form-control" placeholder="Enter text" readonly="readonly">

                                            
                                            <label>Status</label>
                                            <select class="span1 form-control" name="status">
                                                    <option value="" ${order.status.toString() == '' ? "selected" : ""}>-</option>
                                                    <option value="CANCELED" ${order.status.toString() == 'Canceled' ? "selected" : ""}>Canceled.</option>
                                                    <option value="DELIVERED" ${order.status.toString() == 'Delivered' ? "selected" : ""}>Delivered</option>
                                                    <option value="PAYMENTERROR" ${order.status.toString() == 'Payment Error' ? "selected" : ""}>Payment Error</option>
                                                    <option value="REFUND" ${order.status.toString() == 'Refund' ? "selected" : ""} >Refund</option>
                                                    <option value="SEND" ${order.status.toString() == 'Send' ? "selected" : ""} >Send</option>
                                            </select>
                                            <p class="help-block">Filled with Status</p>
                                            
                                            <button type="submit" class="btn btn-default">Change Status</button>
                                            
                                            <br><h4><b>Address Order</b></h4><br>
                                            
                                            <label>Nama Penerima</label>
                                            <input value="${order.addressOrder.namaPenerima}" name="namaPenerima" class="form-control" placeholder="Enter text" readonly="readonly">
                                            <p class="help-block">Filled with Nama Penerima</p>
                                            
                                            <label>Alamat Penagihan</label>
                                            <input value="${order.addressOrder.alamatPenagihan}" name="alamatPenagihan" class="form-control" placeholder="Enter text" readonly="readonly">
                                            <p class="help-block">Filled with Alamat Penagihan</p>
                                            
                                            <label>Alamat Pengiriman</label>
                                            <input value="${order.addressOrder.alamatPengiriman}" name="alamatPengiriman" class="form-control" placeholder="Enter text" readonly="readonly">
                                            <p class="help-block">Filled with Alamat Pengiriman</p>
                                            
                                            <label>Kota</label>
                                            <input value="${order.addressOrder.kota}" name="kota" class="form-control" placeholder="Enter text" readonly="readonly">
                                            <p class="help-block">Filled with Kota</p>
                                            
                                            <label>Negara</label>
                                            <input value="${order.addressOrder.negara}" name="negara" class="form-control" placeholder="Enter text" readonly="readonly">
                                            <p class="help-block">Filled with Negara</p>
                                            
                                            <label>Kode Pos</label>
                                            <input value="${order.addressOrder.kodePos}" name="kodePos" class="form-control" placeholder="Enter text" readonly="readonly">
                                            <p class="help-block">Filled with Kode Pos</p>
                                            
                                            <label>Telepon</label>
                                            <input value="${order.addressOrder.telepon}" name="telepon" class="form-control" placeholder="Enter text" readonly="readonly">
                                            <p class="help-block">Filled with Telepon</p>
                                            
                                            <label>Informasi Tambahan</label>
                                            <input value="${order.addressOrder.additionalInformation}" name="additionalInformation" class="form-control" placeholder="Enter text" readonly="readonly">
                                            <p class="help-block">Filled with Informasi Tambahan</p>
                                        </div>
                                            
                                        <!-- spring security needed -->
                                        <input type="hidden" name="${_csrf.parameterName}"
                                        value="${_csrf.token}" />    
                                            
                                        
                                    </form> 
                                        
                                    <h4>List Order</h4>    
                                    <table class='table borderless'>
                                        <thead>
                                            <tr>
                                                <th>Nama Produk</th>
                                                <th>Kategori</th>
                                                <th>Kuantitas</th>
                                                <th>Harga Satuan</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="orderDetail" items="${order.listOrderDetail}">
                                                <tr>
                                                    <td>${orderDetail.product.title}</td>
                                                    <td>${orderDetail.product.category.title}</td>
                                                    <td>${orderDetail.quantity}</td>
                                                    <td>${orderDetail.product.price}</td>
                                                    <td>${orderDetail.quantity * orderDetail.product.price}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <right><h3>Total ${order.amount}</h3></right>
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

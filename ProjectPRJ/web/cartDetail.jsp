<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href='https://fonts.googleapis.com/css?family=Racing%20Sans%20One' rel='stylesheet'>
        <title>Shoe09</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cartDetail.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <script>
            function onClickRemove(id, size) {
                document.getElementById("removeID").value = id;
                document.getElementById("size").value = size;
            }
        </script>
        <div class="container">
            <div class="header">
                <a href="home?page=0"><image class="logo" src="${pageContext.request.contextPath}/image/logo.png" title="home"/></a>
                <div class="wrap">
                    <form action="search" class="search" method="post">
                        <input name="txt" type="text" class="searchTerm" placeholder="What do you want?">
                        <button type="submit" class="searchButton">
                            Search
                        </button>
                    </form>
                </div>

                <div class="lors">   
                    <c:choose>
                        <c:when test="${sessionScope.customer !=  null}">
                            <a href="manageListProduct" style="${sessionScope.customer.getRole() == "admin" ? "" : "display: none"}">
                                <div class = "fa fa-bars">
                                </div>
                                <a href="profile">
                                    <div class = "fa fa-user">
                                    </div>
                                    <a href="cart">
                                        <div class = "fa fa-shopping-cart">
                                        </div>
                                    </a>
                                    <a href = "logOut">Log Out</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="login">Login/Register</a> 
                                </c:otherwise>
                            </c:choose>                                 
                            </div>
                            </div>

                            <div class = "menuCategory">
                                <ul>
                                    <c:forEach items="${requestScope.listCategory}" var="o">
                                        <li><a href="category?CategoryID=${o.getCategoryID()}">${o.getName()}</a></li>  
                                        </c:forEach>               
                                </ul>
                            </div>
                            </div> 
                            <c:choose>
                                <c:when test="${requestScope.isCartEmpty}">
                                    <span></span><br/>
                                    <span></span><br/>
                                    <span></span><br/>
                                    <span></span><br/>
                                    <span></span><br/>

                                    <span class="resultCart">Don't have Product in Cart</span>
                                </c:when>
                                <c:otherwise>
                                    <div class="orderCart">
                                        <div class = "left">
                                            <form action="cart" method="post">
                                                <table>
                                                    <tr>
                                                        <th>Product</th>
                                                        <th> </th>
                                                        <th>Size</th>
                                                        <th>Price</th>
                                                        <th>Quantity</th>
                                                        <th> </th>
                                                    </tr>
                                                    <c:forEach items="${sessionScope.customer.getCart().getCartDetail()}" var="o">
                                                        <% int productId = 1; %>
                                                        <tr>    
                                                            <td> <img class = "itemImage" src = "${pageContext.request.contextPath}${o.getProduct().getImage()}"></td>
                                                            <td>${o.getProduct().getName()}</td>
                                                            <td>${o.getSize()}</td>
                                                            <td>${o.getProduct().getFormatedMoney()} $</td>
                                                            <td><input type="number" id="quantity" name="quantity" min="1" max="${o.getProduct().getQuantity()}" value = "${o.getQuantity()}"></td>
                                                            <td><input class="removeButtom" onclick="onClickRemove(${o.getProduct().getProductID()},${o.getSize()})" type="submit" name="btnRemove" value="x"></td>
                                                        </tr>
                                                    </c:forEach>          
                                                </table>
                                                <input type="text" name="removeID" id = "removeID" style="display: none;">
                                                <input type="text" name="size" id = "size" style="display: none;">
                                            </form>
                                        </div>

                                        <div class = "right">
                                            <form action="cart" method="post" >
                                                <span>PAYMENT</span>
                                                <table>
                                                    <tr>
                                                        <th>Total</th>
                                                        <th>Address</th>
                                                    </tr>
                                                    <tr>
                                                        <td>${requestScope.totalMoney} $</td>
                                                        <td>${sessionScope.customer.getAddress()}</td>
                                                    </tr>
                                                </table>
                                                <input type="submit" value="Confirm Order" name = "btnConfirmCart">
                                            </form> 
                                        </div>
                                    </div> 
                                </c:otherwise>
                            </c:choose>  

                            <div class = "footer">
                                <div class="describe">
                                    <div> Shoe09 Shop </div>
                                    <div>All kinds of basketball shoes</div>
                                    <div> Prestige and quality</div>
                                </div>
                                <div class = "address">
                                    <a class='fas fa-map-marker-alt'>
                                    </a>FPT University<br/>
                                    <a class="fa fa-phone"></a>0383053423<br/>
                                    <a class="fa fa-envelope"></a>hongthang394@gmail.com
                                </div>
                                <div class = "about">
                                    <span>Ngo Hong Thang - HE163975</span><br/>
                                    Project-PRJ301 <br/>
                                    <a class="fa fa-facebook-official" href="https://www.facebook.com/lewlew19"></a>
                                    <a class="fa fa-instagram" href="https://instagram.com/nowkei_"></a>
                                </div>
                            </div>
                            </div>
                            </body>
                            </html>
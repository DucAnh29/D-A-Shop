
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href='https://fonts.googleapis.com/css?family=Racing%20Sans%20One' rel='stylesheet'>
        <title>Shoe09</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manageProduct.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
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
                        <c:when test="${sessionScope.customer != null}">
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

            <div class="container">
                <div class="tabletittle">
                    <div class="left">
                        <h2>Manage Product </h2>
                        
                    </div>
                    <div class="right">
                        <a href="addNewProduct" class="add"> <span><i class="fa fa-plus"></i>Add New Product</span> </a>
                    </div>
                </div>

                <form action="manageProduct" class="manageProduct" method="post">
                    <table border="1" width="5"  style="width:89%">
                        <thead>
                            <tr>
                                <th>ProductID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Image</th>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>CategoryID</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listProduct}" var="o">
                            <tr>
                                <td>${o.getProductID()}</td>
                                <td>${o.getName()}</td>
                                <td>${o.getFormatedMoney()}$</td>
                                <td style="text-align: center"><image class="imgManage" src="${pageContext.request.contextPath}${o.getImage()}"/></td>
                                <td>${o.getDescription()}</td>
                                <td>${o.getQuantity()}</td>
                                <td>${o.getCategoryID()}</td>
                                <td>
                                    <a href="manageProductDetail?productID=${o.getProductID()}" class="fa fa-edit"></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </form>
            </div>   
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
    </body>
</html>

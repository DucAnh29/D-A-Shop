<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href='https://fonts.googleapis.com/css?family=Racing%20Sans%20One' rel='stylesheet'>
        <title>Shoe09</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=PT+Sans" />
        <link href='https://fonts.googleapis.com/css?family=Libre Franklin' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/detail.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <script>
            function chooseShoesSize(id) {
                let shoesSize = document.getElementById("shoesSize");
                shoesSize.value = id;

                for (let i = 39; i <= 44; i++) {
                    let item = document.getElementById(i);
                    if (item.style.background === "yellow") {
                        item.style.background = "#F0F0F0";
                    }
                }

                let itemShoes = document.getElementById(id);
                itemShoes.style.background = "yellow";
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

            <div class = "productDetail">
                <div class = "left">
                    <img class="productImage" src="${pageContext.request.contextPath}${detail.getImage()}" alt="alt"/>
                </div>

                <div class = "right">
                    <div class = "productContent" >
                        <p class="detailName">${detail.getName()}</p>  
                        <p class="detailDes">${detail.getDescription()}</p>
                        <p class="detailPrice">${detail.getFormatedMoney()} $</p>
                    </div>
                    <div class="size">
                        Size
                    </div>
                    <button class="shoesize" id = "39" onClick = "chooseShoesSize('39')" style="background: yellow">39</button>
                    <button class="shoesize" id = "40" onClick = "chooseShoesSize('40')">40</button>
                    <button class="shoesize" id = "41" onClick = "chooseShoesSize('41')">41</button>
                    <button class="shoesize" id = "42" onClick = "chooseShoesSize('42')">42</button>
                    <button class="shoesize" id = "43" onClick = "chooseShoesSize('43')">43</button>
                    <button class="shoesize" id = "44" onClick = "chooseShoesSize('44')">44</button>

                    <form class="cart" method="post" action="cart">
                        <input type = "text" value = "39" id = "shoesSize" name = "shoeSize" style="display: none;"/>
                        <input type = "text" value = "${detail.getProductID()}" name = "productID" style="display: none;"/>
                        <label for="quantity"></label>
                        <input type="number" id="quantity" name="quantity" min="1" max="1000" value = "1"><br/>
                        <input type="submit" value="Add to Cart">
                    </form>
                </div>
            </div>

            <div class = "title">ALIKE SHOES</div>
            <div class = "productList">
                <c:forEach items="${requestScope.listProductAlike}" var="o">
                    <div class = "productItem">
                        <a href = "detail?ProductID=${o.getProductID()}">
                            <img class="productImageItem" src="${pageContext.request.contextPath}${o.getImage()}" alt="alt"/>
                            <div class = "productContentItem" >
                                <p>${o.getName()}</p>
                                <p class="price">${o.getFormatedMoney()} $</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>   
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
        </div>
    </body>
</html>

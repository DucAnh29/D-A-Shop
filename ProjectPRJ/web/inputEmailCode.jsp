<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://fonts.googleapis.com/css?family=Racing Sans One' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/inputEmailCode.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Shoe09</title>
    </head>
    <body>
        <div class = "container">
            <div class="header">
                <image class="logo" src="${pageContext.request.contextPath}/image/logo.png" />
                <h1>Input Email Code</h1>
            </div>

            <div class = "inputEmailCode">
                <form action="resetPassword" method="post">
                    <h1>Input Email Code</h1>
                    <input type="text" placeholder="Code" id="code" name="inputCode" required=""><br/>
                    <p class = "errorMessage">${requestScope.errorMessage}</p>
                    <input class="" type="submit" value="Check Code" name="btnCheckCode">
                </form>
            </div>

            <div class = "footer">
                <div class="describe">
                    <div> Shoe09 Store </div>
                    <div>Welcome to my store</div>
                    <div>Authentic shop say no with fake</div>
                </div>
                <div class = "address">
                    <a class='fas fa-map-marker-alt'>
                    </a>Thon 5 Tan Xa<br/>
                    <a class="fa fa-phone"></a>0383053423<br/>
                    <a class="fa fa-envelope"></a>hongthang394@gmail.com
                </div>
                <div class = "about">
                    <span>About the shop</span><br/>
                    My Shop Very Nice<br/>
                    <a class="fa fa-facebook-official" href="https://www.facebook.com/lewlew19"></a>
                    <a class="fa fa-instagram" href="https://instagram.com/nowkei_"></a>
                </div>
            </div>        
        </div>
    </body>
</html>

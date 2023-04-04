<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href='https://fonts.googleapis.com/css?family=Racing%20Sans%20One' rel='stylesheet'>
        <title>Shoe09</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container">
            <div class="header">
                <image class="logo" src="${pageContext.request.contextPath}/image/logo.png" />
                <h1>Login</h1>
            </div>
                
            <div class="taikhoan">
                <div class="login">
                    <form action="login" method="post">
                        <h1>Login</h1>
                        <input type="text" placeholder="Email" id="username" name="loginUsername"><br/>
                        <input type="password" placeholder="Password" id="password" name="loginPassword"><br/>
                        <p class = "errorMessage">${requestScope.errorMessageLogin}</p><br>
                        <input class="buttonLogin" type="submit" value="Login" name="btnLogin">
                        <span class="rightInput"><a href="resetPassword" title="Forgot Password">Forgot password?</a></span>
                    </form>
                </div>
                
                <div class="register">
                    <form action="register" method="post" id="form_load">
                        <h1>Sign up</h1>
                        <input type="text" placeholder="Fullname" id="user" name="CustomerName" required=""><br/>
                        <input type="email" placeholder="Email" id="email" name="Email"  required=""><br/>
                        <input type="number" placeholder="Phone" id="phone" name="Phone" required=""><br/>
                        <input type="address" placeholder="Address" id="address" name="Address"  required=""><br/>
                        <input type="password" placeholder="Password" id="passworddk" name="Password" class="password-strength" required="">
                        <p class = "errorMessage">${requestScope.errorMessageRegister}</p><br>
                        <div class="relative"></div>
                        <input type="submit" value=Sign up" name="btnRegister">
                    </form>
                    <div class="clear"></div>
                    <div class="note">
                        <p>Your Personal information will be used to fill in the menu, helping you pay quickly and easily..</p>
                        <p>Benefits for you:</p>
                        <div>
                            Track your order<br/>
                            Get promotions<br/>
                            Quick payment &amp; convenient<br/>     
                        </div>
                    </div>
                </div>
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



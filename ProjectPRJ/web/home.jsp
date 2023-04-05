<%-- 
    Document   : home
    Created on : Oct 20, 2022, 10:37:58 PM
    Author     : Duc Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>MultiShop - Online Shop Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            .pagination a{
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                text-align: center;
            }
            
            .pagination{
                display: inline-block
            }
            .pagination a.active{
                background-color: orange;
                color: white

            }

        </style>
    </head>
    <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-1 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center h-100">
                        <a class="text-body mr-3" href="">About</a>
                        <a class="text-body mr-3" href="">Contact</a>
                        <a class="text-body mr-3" href="">Help</a>
                        <a class="text-body mr-3" href="">FAQs</a>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">My Account</button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <button class="dropdown-item" type="button"><a href="Login.jsp">Sign in</a></button>
                                <button class="dropdown-item" type="button">Sign up</button>
                            </div>
                        </div>
                        <div class="btn-group mx-2">
                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">USD</button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <button class="dropdown-item" type="button">EUR</button>
                                <button class="dropdown-item" type="button">GBP</button>
                                <button class="dropdown-item" type="button">CAD</button>
                            </div>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">EN</button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <button class="dropdown-item" type="button">FR</button>
                                <button class="dropdown-item" type="button">AR</button>
                                <button class="dropdown-item" type="button">RU</button>
                            </div>
                        </div>
                    </div>
                    <div class="d-inline-flex align-items-center d-block d-lg-none">
                        <a href="" class="btn px-0 ml-2">
                            <i class="fas fa-heart text-dark"></i>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                        <a href="" class="btn px-0 ml-2">
                            <i class="fas fa-shopping-cart text-dark"></i>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
                <div class="col-lg-4">
                    <a href="" class="text-decoration-none">
                        <span class="h1 text-uppercase text-primary bg-dark px-2">D&A</span>
                        <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
                    </a>
                </div>
                <div class="col-lg-4 col-6 text-left">
                    <form action="search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products" name="key">
                                                        <div class="input-group-append">

                            
                                <span class="input-group-text bg-transparent text-primary">
                                   <input type="submit" value="SEARCH"/>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4 col-6 text-right">
                    <p class="m-0">Customer Service</p>
                    <h5 class="m-0">+012 345 6789</h5>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid bg-dark mb-30">
            <div class="row px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                        <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>

                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                        <c:forEach items="${requestScope.data}" var="c">

                            <div class="navbar-nav w-100">
                                <a href="" class="nav-item nav-link">${c.name}</a>


                            </div>
                        </c:forEach>

                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <span class="h1 text-uppercase text-dark bg-light px-2">D&A</span>
                            <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="home" class="nav-item nav-link active">Home</a>
                                <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                                <a href="detail.jsp" class="nav-item nav-link">Shop Detail</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down mt-1"></i></a>
                                    <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                        <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                        <a href="checkout.html" class="dropdown-item">Checkout</a>
                                    </div>
                                </div>
                                <a href="contact.html" class="nav-item nav-link">Contact</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                <a href="" class="btn px-0">
                                    <i class="fas fa-heart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                                </a>
                                <a href="" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Carousel Start -->
        <div class="container-fluid mb-3">
            <div class="row px-xl-5">
                <div class="col-lg-8">
                    <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#header-carousel" data-slide-to="1"></li>
                            <li data-target="#header-carousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item position-relative active" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="img/carousel-1.jpg" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Men Fashion</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item position-relative" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="img/carousel-2.jpg" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Women Fashion</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item position-relative" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="img/carousel-3.jpg" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Kids Fashion</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="img/offer-1.jpg" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 20%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="img/offer-2.jpg" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 20%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End -->
        <div class="row px-xl-5">
        <c:forEach items="${requestScope.products}" var="s">
                                <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                                        <div class="product-item bg-light mb-4">
                                            <div class="product-img position-relative overflow-hidden">
                                                <img class="img-fluid w-100" src="${s.image}" alt="">
                                                <div class="product-action">
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                                </div>
                                            </div>
                                            <div class="text-center py-4">
                                                <a class="h6 text-decoration-none text-truncate" href="detail?pid=${s.id}">${s.name}</a>
                                                <div class="d-flex align-items-center justify-content-center mt-2">
                                                    <h5>$${s.price}</h5><h6 class="text-muted ml-2"><del>$${s.oldPrice}</del></h6>
                                                </div>
                                                <div class="d-flex align-items-center justify-content-center mb-1">
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small>(80)</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </c:forEach>
        </div>
        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categories</span></h2>
            <div class="row px-xl-5 pb-3">

                <c:forEach items="${requestScope.data}" var="c">

                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="products?cid=${c.id}">
                            <div class="cat-item d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="${c.img}" alt="">

                                </div>

                                <div class="flex-fill pl-3">
                                    <h6 >${c.name}</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>



                </c:forEach>
            </div>
        </div>
                <div class="container-fluid">
                    <div class="row px-xl-5">
                        <!-- Shop Sidebar Start -->
                        <div class="col-lg-3 col-md-4">
                            <!-- Price Start -->
                            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by price</span></h5>
                            <div class="bg-light p-4 mb-30">
                                <form>
                                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                        <input type="checkbox" class="custom-control-input" checked id="price-all">
                                        <label class="custom-control-label" for="price-all">All Price</label>
                                        <span class="badge border font-weight-normal">1000</span>
                                    </div>
                                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                        <input type="checkbox" class="custom-control-input" id="price-1">
                                        <label class="custom-control-label" for="price-1">$0 - $100</label>
                                        <span class="badge border font-weight-normal">150</span>
                                    </div>
                                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                        <input type="checkbox" class="custom-control-input" id="price-2">
                                        <label class="custom-control-label" for="price-2">$100 - $200</label>
                                        <span class="badge border font-weight-normal">295</span>
                                    </div>
                                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                        <input type="checkbox" class="custom-control-input" id="price-3">
                                        <label class="custom-control-label" for="price-3">$200 - $300</label>
                                        <span class="badge border font-weight-normal">246</span>
                                    </div>
                                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                        <input type="checkbox" class="custom-control-input" id="price-4">
                                        <label class="custom-control-label" for="price-4">$300 - $400</label>
                                        <span class="badge border font-weight-normal">145</span>
                                    </div>
                                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                                        <input type="checkbox" class="custom-control-input" id="price-5">
                                        <label class="custom-control-label" for="price-5">$400 - $500</label>
                                        <span class="badge border font-weight-normal">168</span>
                                    </div>
                                </form>
                            </div>
                            <!-- Price End -->




                        </div>
                        <!-- Shop Sidebar End -->


                        <!-- Shop Product Start -->
                        <div class="col-lg-9 col-md-8">
                            <div class="row pb-3">
                                <div class="col-12 pb-1">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div>
                                            <button class="btn btn-sm btn-light"><i class="fa fa-th-large"></i></button>
                                            <button class="btn btn-sm btn-light ml-2"><i class="fa fa-bars"></i></button>
                                        </div>
                                        <div class="ml-2">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Sorting</button>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item" href="#">Latest</a>
                                                    <a class="dropdown-item" href="#">Popularity</a>
                                                    <a class="dropdown-item" href="#">Best Rating</a>
                                                </div>
                                            </div>
                                            <div class="btn-group ml-2">
                                                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Showing</button>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item" href="#">10</a>
                                                    <a class="dropdown-item" href="#">20</a>
                                                    <a class="dropdown-item" href="#">30</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <c:forEach items="${requestScope.products}" var="p">

                                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                                        <div class="product-item bg-light mb-4">
                                            <div class="product-img position-relative overflow-hidden">
                                                <img class="img-fluid w-100" src="${p.image}" alt="">
                                                <div class="product-action">
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                                </div>
                                            </div>
                                            <div class="text-center py-4">
                                                <a class="h6 text-decoration-none text-truncate" href="detail?pid=${p.id}">${p.name}</a>
                                                <div class="d-flex align-items-center justify-content-center mt-2">
                                                    <h5>$${p.price}</h5><h6 class="text-muted ml-2"><del>$${p.oldPrice}</del></h6>
                                                </div>
                                                <div class="d-flex align-items-center justify-content-center mb-1">
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small>(80)</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- Shop Product End -->
                            </div>
                        </div>
                        <!-- Offer Start -->
                        <div class="container-fluid pt-5 pb-3">
                            <div class="row px-xl-5">
                                <div class="col-md-6">
                                    <div class="product-offer mb-30" style="height: 300px;">
                                        <img class="img-fluid" src="img/offer-1.jpg" alt="">
                                        <div class="offer-text">
                                            <h6 class="text-white text-uppercase">Save 20%</h6>
                                            <h3 class="text-white mb-3">Special Offer</h3>
                                            <a href="" class="btn btn-primary">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="product-offer mb-30" style="height: 300px;">
                                        <img class="img-fluid" src="img/offer-2.jpg" alt="">
                                        <div class="offer-text">
                                            <h6 class="text-white text-uppercase">Save 20%</h6>
                                            <h3 class="text-white mb-3">Special Offer</h3>
                                            <a href="" class="btn btn-primary">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Offer End -->


                        <!-- Products Start -->
                        <div class="container-fluid pt-5 pb-3">
                            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Products</span></h2>
                            <div class="row px-xl-5">

                                <c:forEach items="${requestScope.data2}" var="p">
                                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                        <div class="product-item bg-light mb-4">
                                            <div class="product-img position-relative overflow-hidden">
                                                <img class="img-fluid w-100" src="${p.image}" alt="">
                                                <div class="product-action">
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                                </div>
                                            </div>
                                            <div class="text-center py-4">
                                                <a class="h6 text-decoration-none text-truncate" href="">${p.name}</a>
                                                <div class="d-flex align-items-center justify-content-center mt-2">
                                                    <h5>$${p.price}</h5><h6 class="text-muted ml-2"><del>${p.oldPrice}</del></h6>
                                                </div>
                                                <div class="d-flex align-items-center justify-content-center mb-1">
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small>(99)</small>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>


                                <c:set var="page" value="${requestScope.page}"/>
                                <div class="pagination">
                                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">

                                        <a class="${i==page?"active":""}" href="home?page=${i}">${i}</a>


                                    </c:forEach>
                                </div>


                            </div>
                        </div>
                        <!-- Products End -->




                        <!-- Products Start -->
                        <div class="container-fluid pt-5 pb-3">
                            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Recent Products</span></h2>
                            <div class="row px-xl-5">
                                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                    <div class="product-item bg-light mb-4">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product-1.jpg" alt="">
                                            <div class="product-action">
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small>(99)</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                    <div class="product-item bg-light mb-4">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product-2.jpg" alt="">
                                            <div class="product-action">
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star-half-alt text-primary mr-1"></small>
                                                <small>(99)</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                    <div class="product-item bg-light mb-4">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product-3.jpg" alt="">
                                            <div class="product-action">
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star-half-alt text-primary mr-1"></small>
                                                <small class="far fa-star text-primary mr-1"></small>
                                                <small>(99)</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                    <div class="product-item bg-light mb-4">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product-4.jpg" alt="">
                                            <div class="product-action">
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="far fa-star text-primary mr-1"></small>
                                                <small class="far fa-star text-primary mr-1"></small>
                                                <small>(99)</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                    <div class="product-item bg-light mb-4">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product-5.jpg" alt="">
                                            <div class="product-action">
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small>(99)</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                    <div class="product-item bg-light mb-4">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product-6.jpg" alt="">
                                            <div class="product-action">
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star-half-alt text-primary mr-1"></small>
                                                <small>(99)</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                    <div class="product-item bg-light mb-4">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product-7.jpg" alt="">
                                            <div class="product-action">
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star-half-alt text-primary mr-1"></small>
                                                <small class="far fa-star text-primary mr-1"></small>
                                                <small>(99)</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                    <div class="product-item bg-light mb-4">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product-8.jpg" alt="">
                                            <div class="product-action">
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                                            <div class="d-flex align-items-center justify-content-center mt-2">
                                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center mb-1">
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="fa fa-star text-primary mr-1"></small>
                                                <small class="far fa-star text-primary mr-1"></small>
                                                <small class="far fa-star text-primary mr-1"></small>
                                                <small>(99)</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Products End -->

                        <!-- Vendor Start -->
                        <div class="container-fluid py-5">
                            <div class="row px-xl-5">
                                <div class="col">
                                    <div class="owl-carousel vendor-carousel">
                                        <div class="bg-light p-4">
                                            <img src="img/vendor-1.jpg" alt="">
                                        </div>
                                        <div class="bg-light p-4">
                                            <img src="img/vendor-2.jpg" alt="">
                                        </div>
                                        <div class="bg-light p-4">
                                            <img src="img/vendor-3.jpg" alt="">
                                        </div>
                                        <div class="bg-light p-4">
                                            <img src="img/vendor-4.jpg" alt="">
                                        </div>
                                        <div class="bg-light p-4">
                                            <img src="img/vendor-5.jpg" alt="">
                                        </div>
                                        <div class="bg-light p-4">
                                            <img src="img/vendor-6.jpg" alt="">
                                        </div>
                                        <div class="bg-light p-4">
                                            <img src="img/vendor-7.jpg" alt="">
                                        </div>
                                        <div class="bg-light p-4">
                                            <img src="img/vendor-8.jpg" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Vendor End -->


                        <!-- Footer Start -->
                        <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
                            <div class="row px-xl-5 pt-5">
                                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                                    <h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
                                    <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed clita kasd clita et et dolor sed dolor. Rebum tempor no vero est magna amet no</p>
                                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                                </div>
                                <div class="col-lg-8 col-md-12">
                                    <div class="row">
                                        <div class="col-md-4 mb-5">
                                            <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                                            <div class="d-flex flex-column justify-content-start">
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                                <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-5">
                                            <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                                            <div class="d-flex flex-column justify-content-start">
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                                <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-5">
                                            <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                                            <p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
                                            <form action="">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Your Email Address">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary">Sign Up</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                                            <div class="d-flex">
                                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                                                <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
                                <div class="col-md-6 px-xl-0">
                                    <p class="mb-md-0 text-center text-md-left text-secondary">
                                        &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                                        by
                                        <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a>
                                    </p>
                                </div>
                                <div class="col-md-6 px-xl-0 text-center text-md-right">
                                    <img class="img-fluid" src="img/payments.png" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- Footer End -->


                        <!-- Back to Top -->
                        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


                        <!-- JavaScript Libraries -->
                        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
                        <script src="lib/easing/easing.min.js"></script>
                        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

                        <!-- Contact Javascript File -->
                        <script src="mail/jqBootstrapValidation.min.js"></script>
                        <script src="mail/contact.js"></script>

                        <!-- Template Javascript -->
                        <script src="js/main.js"></script>
                        </body>
                        </html>

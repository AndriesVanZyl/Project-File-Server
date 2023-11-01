<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_File_Server.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Namaqua Engineering File Share</title>
        <!-- Css Styles -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css">

</head>
<body>
    <form id="form1" runat="server">
    <!-- Page Preloder -->
    <div id="preloder" style="display: none;">
        <div class="loader" style="display: none;"></div>
    </div>



    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header__info">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__info-left">
                            <ul>
                                <li><span class="icon_phone"></span> 027 213 1622</li>
                                <li><span class="fa fa-envelope"></span> dries@namaqua-eng.co.za</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__info-right" >
                            <ul>
                                <li><a href="#"><asp:TextBox runat="server" ID="txtUsername" placeholder="Username" ></asp:TextBox></a></li>
                                <li><a href="#"><asp:TextBox runat="server" ID="txtPassword" placeholder="Password" TextMode="Password"></asp:TextBox></a></li>
                                <li><a href="#"><asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" CssClass="site-btn sign-up" Text="LOGIN" Font-Size="10px"/></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="bootstrap/img/logo.png" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <span class="fa fa-bars"></span>
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero__slider owl-carousel owl-loaded owl-drag">
            
            
        <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-2048px, 0px, 0px); transition: all 0s ease 0s; width: 6144px;"><div class="owl-item cloned" style="width: 1024px;"><div class="hero__item set-bg" data-setbg="bootstrap/img/hero-1.jpg" style="background-image: url(&quot;bootstrap/img/hero-1.jpg&quot;);">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <h5>Private File Sharing</h5>
                                <h2>Welcome to NEFS a<br> file share solution</h2>
                                <a href="#learnmore" class="primary-btn">Learn More</a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="hero__img">
                                <img src="bootstrap/img/hero-right.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div></div></div></div>
            <div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div></div>
    </section>
    <!-- Hero Section End -->

    <!-- Services Section Begin -->
    <section id="learnmore" class="services-section spad" style="background-color:white">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h3>File Sharing Made Easy</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services__item">
                        <h5>Store</h5>
                        <span>File Storage</span>
                        <p>Store your files you wish to share. Just drag and drop.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services__item">
                        <h5>Lock</h5>
                        <span>Folder Lock</span>
                        <p>Want to keep a folder private. Just add a password.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services__item">
                        <h5>Access</h5>
                        <span>Anytime Anywhere</span>
                        <p>Have access to the files 24/7 from any internet capable device.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services__item">
                        <h5>Zero Downtime</h5>
                        <span>Always On</span>
                        <p>The server is online 24/7. LOADSHEDDING??</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services__item">
                        <h5>Preview</h5>
                        <span>Preview Files</span>
                        <p>PDF files can be viewed on the site. No need for downloads.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services__item">
                        <h5>Download</h5>
                        <span>Download Files</span>
                        <p>All files on the server can be downloaded at any time.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services Section End -->

    <!-- Achievement Section Begin -->
    <section class="achievement-section set-bg spad" data-setbg="bootstrap/img/achievement-bg.jpg" style="background-image: url(&quot;bootstrap/img/achievement-bg.jpg&quot;);">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="achievement__item">
                        <span class="fa fa-calendar"></span>
                        <h2 class="achieve-counter">25</h2>
                        <p>Years of Service</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="achievement__item">
                        <span class="fa fa-user-o"></span>
                        <h2 class="achieve-counter">160</h2>
                        <p>Employees</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="achievement__item">
                        <span class="fa fa-cog"></span>
                        <h2 class="achieve-counter">140</h2>
                        <p>Projects</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="achievement__item">
                        <span class="fa fa-star"></span>
                        <div>
                            <h2 class="achieve-counter">30</h2>
                        </div>
                        
                        <p>Years of Experience</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Achievement Section End -->

    <!-- Work Section Begin -->
    <section class="work-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h3>HOW TO GET CONNECTED TODAY?</h3>
                    </div>
                    <div class="work__text">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="work__item">
                                    <i class="fa fa-desktop"></i>
                                    <span>NEED ACCESS</span>
                                    <h3>GET REGISTERED</h3>
                                    <p>NEFS is a closed system and only Namaqua Engineering can register users. To get access to the system please contact Namaqua Engineering. </p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="work__item">
                                    <i class="fa fa-user-o"></i>
                                    <span>EASY CREATE, MANAGE &amp; SELL</span>
                                    <h3>ALREADY REGISTERED</h3>
                                    <p>Use the login at the top of this page to login. Use the username and password that was provided to login to the system. You will be taken to the main page. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Work Section End -->

    <!-- Choose Plan Section Begin -->
    <section class="choose-plan-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <img src="bootstrap/img/choose-plan.png" alt="">
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="plan__text">
                        <h3>Sharing files has never been this easy.</h3>
                        <ul>
                            <li><span class="fa fa-check"></span> Secure Storage</li>
                            <li><span class="fa fa-check"></span> 24/7 Uptime</li>
                            <li><span class="fa fa-check"></span> Plenty of disk space</li>
                            <li><span class="fa fa-check"></span> User Friendly</li>
                            <li><span class="fa fa-check"></span> Multi Device</li>
                            <li><span class="fa fa-check"></span> Local Servers</li>
                        </ul>
                        <a href="#" class="primary-btn">LOGIN NOW</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Choose Plan Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="footer__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="footer__top-call">
                            <h5>Need Access? Call us</h5>
                            <h2>027 213 1622</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="footer__top-auth">
                            <h5>Get your access today.</h5>
                            <a href="#" class="primary-btn">Login</a>
                            <a href="#" class="primary-btn sign-up">Get Access</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer" class="footer__text set-bg" data-setbg="bootstrap/img/footer-bg.png" style="background-image: url(&quot;bootstrap/img/footer-bg.png&quot;);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="footer__text-about">
                            <div class="footer__logo">
                                <a href="./index.html"><img src="bootstrap/img/logo.png" alt=""></a>
                            </div>
                            <p>Namaqua Engineering was established in 1998 by Stokkies van Zyl, who identified the need for engineering services in the area. Starting with a small team of 4 committed individuals, the company has since grown to one of the largest private employers in the area.Today, with more than 160 employees, Namaqua Engineering has become the preferred supplier of quality engineering products and services. </p>
                            <div class="footer__social">

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="footer__text-widget">
                            <h5>Company</h5>
                            <ul>
                                <li><a href="https://namaqua-eng.co.za/wp/">Company</a></li>
                                <li><a href="https://namaqua-eng.co.za/wp/services/">Services</a></li>
                                <li><a href="https://namaqua-eng.co.za/wp/projects/">Projects</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="footer__text-widget">
                            <h5>Our Services</h5>
                            <ul>
                                <li><a href="#">Design and technical drawings</a></li>
                                <li><a href="#">Manufacturing</a></li>
                                <li><a href="#">HDPE piping</a></li>
                                <li><a href="#">Rigging and cranage</a></li>
                                <li><a href="#">On-site installation</a></li>
                            </ul>
                        </div>
                    </div>
                   
                </div>
                <div class="footer__text-copyright">
                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright ©<script>document.write(new Date().getFullYear());</script> All rights reserved under Namaqua Engineering| Theme template by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.slicknav.js"></script>
    <script src="bootstrap/js/owl.carousel.min.js"></script>
    <script src="bootstrap/js/main.js"></script>


    </form>
</body>
</html>

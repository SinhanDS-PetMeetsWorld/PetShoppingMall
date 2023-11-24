<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="css/style.css">

    <!-- 모든 페이지에 공통적으로 사용되는 요소 -->
    <script src="js/script.js"></script>
    <!-- 메인화면에서만 사용되는 요소 -->
    <script src="js/main.js"></script>
</head>

<body>

    <div id="popup">
        <img src="img/event_popup.png" alt="">
    </div>

    <div class="wrap">
        <div class="header">
            <div class="size">
                <div><img src="img/logo.png" alt=""></div>
                <div class="login">
                    <a href="">로그인</a> |
                    <a href="">회원가입</a>
                </div>
            </div>
        </div>
        <div class="menu">
            <ul class="depth1">
                <li>
                    <a href="">MENU1</a>
                    <ul class="depth2">
                        <li><a href="">MENU1-1</a></li>
                        <li><a href="">MENU1-2</a></li>
                        <li><a href="">MENU1-3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">MENU2</a>
                    <ul class="depth2">
                        <li><a href="">MENU2-1</a></li>
                        <li><a href="">MENU2-2</a></li>
                        <li><a href="">MENU2-3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">MENU3</a>
                    <ul class="depth2">
                        <li><a href="">MENU3-1</a></li>
                        <li><a href="">MENU3-2</a></li>
                        <li><a href="">MENU3-3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">MENU4</a>
                    <ul class="depth2">
                        <li><a href="">MENU4-1</a></li>
                        <li><a href="">MENU4-2</a></li>
                        <li><a href="">MENU4-3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">MENU5</a>
                    <ul class="depth2">
                        <li><a href="">MENU5-1</a></li>
                        <li><a href="">MENU5-2</a></li>
                        <li><a href="">MENU5-3</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="visual">
            <div class="swiper swiper-visual">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" style="background-image: url('img/visual1.png');"></div>
                    <div class="swiper-slide" style="background-image: url('img/visual2.png');"></div>
                    <div class="swiper-slide" style="background-image: url('img/visual3.png');"></div>
                    <div class="swiper-slide" style="background-image: url('img/visual4.png');"></div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="size">
                <div class="section">
                    <img src="img/section1_1.png" alt="">
                </div>
                <div class="section">
                    <img src="img/section1_2.png" alt="">
                </div>
                <div class="section">
                    <img src="img/section1_3.png" alt="">
                </div>
                <div class="section">
                    <img src="img/section1_4.png" alt="">
                </div>
                <div class="section">
                    <img src="img/section1_5.png" alt="">
                </div>
                <div class="section">
                    <img src="img/section1_6.png" alt="">
                </div>
            </div>
        </div>

        <div class="info">
            <div class="content">
                <div class="board_area">
                    <div class="board_title on">공지사항</div>
                    <div class="board_title">자료실</div>
                    <div class="board_title">Temp</div>
                    <div class="board_contents on" >
                        <ul>
                            <li>공지사항 1입니다. <span>2023-10-18</span></li>
                            <li>공지사항 2입니다. <span>2023-10-17</span></li>
                            <li>공지사항 3입니다. <span>2023-10-16</span></li>
                            <li>공지사항 4입니다. <span>2023-10-15</span></li>
                            <li>공지사항 5입니다. <span>2023-10-14</span></li>
                            <li>공지사항 6입니다. <span>2023-10-13</span></li>
                            <li>공지사항 7입니다. <span>2023-10-12</span></li>
                        </ul>
                    </div>
                    <div class="board_contents" >
                        <ul>
                            <li>글입니다1 <span>2013-10-18</span></li>
                            <li>글입니다2 <span>2013-10-17</span></li>
                            <li>글입니다3 <span>2013-10-16</span></li>
                            <li>글입니다4 <span>2013-10-15</span></li>
                            <li>글입니다5 <span>2013-10-14</span></li>
                            <li>글입니다6 <span>2013-10-13</span></li>
                            <li>글입니다7 <span>2013-10-12</span></li>
                        </ul>
                    </div>
                    <div class="board_contents" >
                        <ul>
                            <li>Temp글입니다1 <span>2013-10-18</span></li>
                            <li>Temp글입니다2 <span>2013-10-17</span></li>
                            <li>Temp글입니다3 <span>2013-10-16</span></li>
                            <li>Temp글입니다4 <span>2013-10-15</span></li>
                            <li>Temp글입니다5 <span>2013-10-14</span></li>
                            <li>Temp글입니다6 <span>2013-10-13</span></li>
                            <li>Temp글입니다7 <span>2013-10-12</span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="video_container">
                    <iframe src="http://www.youtube.com/embed/4CTKsqT4y64"  width="100%" height="360"></iframe>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="size">
                <div class="info">
                    <p>신한DS 금융 SW 아카데미</p>
                    <p>서울시 마포구 월드컵북로 4길 77</p>
                    <p>02-123-4567 | 02-380-4444</p>
                    <p>대표자: 서민구 | 개인정보책임자: 아무개</p>
                    <p>사업자등록번호 111-02-1244</p>
                </div>

                <div class="sns_area">
                    <a href="" target="_blank"><img src="img/blog_ico.png" alt=""></a>
                    <a href="" target="_blank"><img src="img/facebook_ico.png" alt=""></a>
                    <a href="" target="_blank"><img src="img/insta_ico.png" alt=""></a>
                </div>
            </div>
        </div>
        <div id="quickmenu">
            <div><img src="img/quick_01.jpg" alt=""></div>
            <div><img src="img/quick_02.jpg" alt=""></div>
            <div><img src="img/quick_03.jpg" alt=""></div>
            <div><img src="img/quick_04.jpg" alt=""></div>
            <div><img src="img/quick_05.jpg" alt="" id="top"></div>

        </div>
    </div>
</body>

</html>
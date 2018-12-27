<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>I PART</title>
  <link href='//fonts.googleapis.com/css?family=Roboto:700,400&subset=latin' rel='stylesheet' type='text/css'>
  
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.3/normalize.min.css'>

  <style type="text/css">
  * { box-sizing:border-box }
*:before, *:after { box-sizing:inherit }

/* Basic styles */
html {
  font-size: 62.5%;
  -webkit-tap-highlight-color: rgba(0,0,0,0);
  font-family: @font-family-base;
}

body {
    font-family: 'Roboto', sans-serif;
    font-size: 1.4rem;
    line-height: 1.42857143;
    color: #555;
    background-color: #f7f7f7;
}

a { text-decoration: none }

ul {
    margin: 0;
    padding: 0;
    list-style: none;
}

main {
    margin-top: 10rem;
    text-align: center;
}
/* Header styles */
header {
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    background-color: #fff;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    height: 7rem;
    padding: 0 15px;
    position: fixed;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
    top: 0;
    width: 100%
}

.site-logo {
    transition: color 200ms cubic-bezier(.55, 0, .1, 1);
    color: #30acff;
    font-size: 3rem;
}

.ok-header__logo:hover {color: #546edb}

/* okayNav styles */
body.okayNav-loaded {
  overflow-x: hidden;
}
.okayNav:not(.loaded) {
  visibility: hidden;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.okayNav ul {
  /* We want two navigations - one hidden and one visible */
  float: left;
}
.okayNav a {
  /* Links general styling */
  color: #2e2e33;
  font-size: 1.4rem;
  font-weight: bold;
  position: relative;
  z-index: 1;
}
.okayNav__nav--visible {
  overflow: hidden;
  white-space: nowrap;
}
.okayNav__nav--visible li {
  display: inline-block;
}
.okayNav__nav--visible a {
  /* Link styling for the visible part of the nav */
  display: block;
  transition: color 200ms cubic-bezier(0.55, 0, 0.1, 1);
  padding: 15px 15px;
}
.okayNav__nav--visible a:hover {
  color: #546edb;
}
/* Link styling for the off-screen part of the nav */
.okayNav__nav--invisible {
  position: fixed;
  top: 70px;
  bottom: 0;
  overflow-y: scroll;
  -webkit-overflow-scrolling: touch;
  background: #fff;
}
.okayNav__nav--invisible a {
  background: #fff;
  width: 240px;
  display: block;
  padding: 15px;
}
.okayNav__nav--invisible.nav-left {
  left: 0;
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.okayNav__nav--invisible.nav-right {
  right: 0;
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.okayNav__nav--invisible.transition-enabled {
  transition: -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1), -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
}
.okayNav__nav--invisible.nav-open {
  -webkit-transform: translateX(0);
          transform: translateX(0);
}
/* Kebab icon */
.okayNav__menu-toggle {
  position: relative;
  transition: -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1), -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  cursor: pointer;
  width: 40px;
  height: 20px;
  float: left;
  z-index: 1;
  top: 15px;
}
.okayNav__menu-toggle.okay-invisible {
  position: absolute;
  opacity: 0;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  pointer-events: none;
}
.okayNav__menu-toggle span {
  display: block;
  position: absolute;
  margin: auto;
  height: 4px;
  width: 4px;
  background: #2e2e33;
  border-radius: 50%;
  left: 0;
  right: 0;
  pointer-events: none;
}
.okayNav__menu-toggle span:nth-child(1) {
  top: 0;
}
.okayNav__menu-toggle span:nth-child(2) {
  top: 50%;
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
}
.okayNav__menu-toggle span:nth-child(3) {
  bottom: 0;
}
.okayNav__menu-toggle.icon--active {
  /* Kebab icon when off-screen nav is open */
  -webkit-transform: rotate(90deg);
          transform: rotate(90deg);
}
.okayNav__menu-toggle.icon--active span {
  background: #546edb;
}
  
  </style>

  
</head>

<body>

  <header id="header">
  <a class="site-logo" href="#">
           I PART
        </a>

  <nav role="navigation" id="nav-main" class="okayNav">
    <ul>
      <li><a href='<c:url value='/board/board.ipart?category=notice'/>'>공지사항</a></li>
      <li><a href='<c:url value='/board/list/community'/>'>사랑방</a></li>
      <li><a href='<c:url value='/board/list/gallery'/>'>갤러리</a></li>
      <li><a href='<c:url value='/board/list/vote'/>' >투표</a></li>
      <!-- <li><a href="#">지금은...</a></li>  => 메인 피드 형식 -->
    </ul>
  </nav>
</header>
<!-- /header -->

<main>
  
</main>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdn.rawgit.com/VPenkov/okayNav/master/app/js/jquery.okayNav.js'></script>

  

    <script>
    var navigation = $('#nav-main').okayNav();
    </script>




</body>

</html>
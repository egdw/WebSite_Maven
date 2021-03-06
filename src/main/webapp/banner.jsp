<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" href="/blog/banner/css/style.css"/>
    <script type='text/javascript' src='/blog/banner/js/modernizr.min.js?ver=2.6.1'></script>
    <script type='text/javascript'>
        /* <![CDATA[ */
        var CSSettings = {"pluginPath": "/blog/banner"};
        /* ]]> */
    </script>
    <script type='text/javascript' src='/blog/banner/js/cute.slider.js?ver=2.0.0'></script>
    <script type='text/javascript' src='/blog/banner/js/cute.transitions.all.js?ver=2.0.0'></script>
</head>
<body>
<div class="c-860 c-demoslider">
    <div id="cuteslider_3_wrapper" class="cs-circleslight">

        <div id="cuteslider_3" class="cute-slider" data-width="960" data-height="420" data-overpause="true">
            <c:if test="${requestScope.banners == null}">
                <ul data-type="slides">
                    <li data-delay="5" data-src="5"
                        data-trans3d="tr6,tr17,tr22,tr23,tr29,tr27,tr32,tr34,tr35,tr53,tr54,tr62,tr63,tr4,tr13,tr45"
                        data-trans2d="tr3,tr8,tr12,tr19,tr22,tr25,tr27,tr29,tr31,tr34,tr35,tr38,tr39,tr41"><img
                            src="/blog/banner/001/001.jpg" data-thumb="/blog/banner/001/001a.png"><a data-type="link"
                                                                                                     href="##"
                                                                                                     target="_blank"></a>
                    </li>
                    <li data-delay="5" data-src="5"
                        data-trans3d="tr6,tr17,tr22,tr23,tr26,tr27,tr29,tr32,tr34,tr35,tr53,tr54,tr62,tr63,tr4,tr13"
                        data-trans2d="tr3,tr8,tr12,tr19,tr22,tr25,tr27,tr29,tr31,tr34,tr35,tr38,tr39,tr41"><img
                            src="/blog/banner/bg/blank.png" data-src="/blog/banner/001/002.jpg"
                            data-thumb="/blog/banner/001/002a.png"><a data-type="link" href="##" target="_blank"></a>
                    </li>
                    <li data-delay="5" data-src="5"
                        data-trans3d="tr6,tr17,tr22,tr23,tr26,tr27,tr29,tr32,tr34,tr35,tr53,tr54,tr62,tr63,tr4,tr13"
                        data-trans2d="tr3,tr8,tr12,tr19,tr22,tr25,tr27,tr29,tr31,tr34,tr35,tr38,tr41"><img
                            src="/blog/banner/bg/blank.png" data-src="/blog/banner/001/003.jpg"
                            data-thumb="/blog/banner/001/003a.png"><a data-type="link" href="##" target="_blank"></a>
                    </li>
                    <li data-delay="5" data-src="5"
                        data-trans3d="tr6,tr17,tr22,tr23,tr26,tr27,tr29,tr32,tr34,tr35,tr53,tr54,tr62,tr63,tr4,tr13"
                        data-trans2d="tr3,tr8,tr12,tr19,tr22,tr25,tr27,tr29,tr31,tr34,tr35,tr38,tr39,tr41"><img
                            src="/blog/banner/bg/blank.png" data-src="/blog/banner/001/004.jpg"
                            data-thumb="/blog/banner/001/004a.png"><a data-type="link" href="##" target="_blank"></a>
                    </li>
                    <li data-delay="5" data-src="5"
                        data-trans3d="tr6,tr17,tr22,tr23,tr26,tr27,tr29,tr32,tr34,tr35,tr53,tr54,tr62,tr63,tr4,tr13"
                        data-trans2d="tr3,tr8,tr12,tr19,tr22,tr25,tr27,tr29,tr31,tr34,tr35,tr38,tr39,tr41"><img
                            src="/blog/banner/bg/blank.png" data-src="/blog/banner/001/005.jpg"
                            data-thumb="/blog/banner/001/005a.png"><a data-type="link" href="##" target="_blank"></a>
                    </li>
                    <li data-delay="5" data-src="5"
                        data-trans3d="tr6,tr17,tr22,tr23,tr26,tr27,tr29,tr32,tr34,tr35,tr53,tr54,tr62,tr63,tr4,tr13"
                        data-trans2d="tr3,tr8,tr12,tr19,tr22,tr25,tr27,tr29,tr31,tr34,tr35,tr38,tr39,tr41"><img
                            src="/blog/banner/bg/blank.png" data-src="/blog/banner/001/006.jpg"
                            data-thumb="/blog/banner/001/006a.png"><a data-type="link" href="##" target="_blank"></a>

                    </li>
                </ul>
            </c:if>
            <c:if test="${requestScope.banners!=null}">
                <ul data-type="slides">
                    <c:forEach items="${requestScope.banners}" var="index">

                        <li data-delay="5" data-src="5"
                            data-trans3d="tr6,tr17,tr22,tr23,tr26,tr27,tr29,tr32,tr34,tr35,tr53,tr54,tr62,tr63,tr4,tr13"
                            data-trans2d="tr3,tr8,tr12,tr19,tr22,tr25,tr27,tr29,tr31,tr34,tr35,tr38,tr39,tr41"><img
                                src="/${index.bannerImageUrl}" data-src="/${index.bannerImageUrl}"
                                data-thumb="/${index.bannerImageUrl}"><a data-type="link" href="${index.bannerUrl}" target="_blank"></a>

                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <ul data-type="controls">
                <li data-type="captions"></li>
                <li data-type="link"></li>
                <li data-type="video"></li>
                <li data-type="slideinfo"></li>
                <li data-type="circletimer"></li>
                <li data-type="previous"></li>
                <li data-type="next"></li>
                <li data-type="bartimer"></li>
                <li data-type="slidecontrol" data-thumb="true" data-thumbalign="up"></li>
            </ul>
        </div>
        <div class="cute-shadow"><img src="/blog/banner/bg/shadow.png" alt="shadow"></div>
    </div>
    <p>
        <script type="text/javascript">var cuteslider3 = new Cute.Slider();
        cuteslider3.setup("cuteslider_3", "cuteslider_3_wrapper", "/blog/banner/css/slider-style.css");
        cuteslider3.api.addEventListener(Cute.SliderEvent.CHANGE_START, function (event) {
        });
        cuteslider3.api.addEventListener(Cute.SliderEvent.CHANGE_END, function (event) {
        });
        cuteslider3.api.addEventListener(Cute.SliderEvent.WATING, function (event) {
        });
        cuteslider3.api.addEventListener(Cute.SliderEvent.CHANGE_NEXT_SLIDE, function (event) {
        });
        cuteslider3.api.addEventListener(Cute.SliderEvent.WATING_FOR_NEXT, function (event) {
        });</script>
</div>
</body>
</html>
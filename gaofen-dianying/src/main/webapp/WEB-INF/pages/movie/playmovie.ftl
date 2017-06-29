<script src="/resources/static/bootstrap-3.37-dist/js/bootstrap.min.js"></script>
<script src="/resources/static/js/jquery.min.js"></script>


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Video.js 5.18.4</title>
    <link href="/resources/static/css/video/video-js.css" rel="stylesheet">
    <!-- If you'd like to support IE8 -->
    <script src="/resources/static/js/video/videojs-ie8.min.js"></script>
    <script src="/resources/static/js/video/video.min.js"></script>
    <script src="/resources/static/js/video/videojs-contrib-hls.min.js"></script>

    <style>
        body{background-color: #191919}
        .m{ width: 640px; height: 264; margin-left: auto; margin-right: auto; margin-top: 100px; }
    </style>
</head>

<body>
<div class="m">
    <video id="my-video" class="video-js" controls preload="auto" width="640" height="264"
           poster="https://img3.doubanio.com/view/photo/raw/public/p2462008752.jpg" data-setup="{}">
        <source src="http://43.241.227.35/btmovie/MoviePlay.m3u8?movieid=26260853&index=0" type="application/x-mpegURL">

    <#--<source src="http://vjs.zencdn.net/v/oceans.mp4" type="video/mp4">
    <source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm">
    <source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg">-->
        <p class="vjs-no-js">
            To view this video please enable JavaScript, and consider upgrading to a web browser that
            <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
        </p>
    </video>
    <script src="http://vjs.zencdn.net/5.18.4/video.min.js"></script>
    <script type="text/javascript">
        var myPlayer = videojs('my-video');
        videojs("my-video").ready(function(){
            var myPlayer = this;
            myPlayer.play();
        });
    </script>
</div>

</body>
</html>
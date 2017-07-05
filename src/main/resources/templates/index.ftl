<!doctype html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>tools </title>
    <meta name="viewport"
          content=" height = device-height,width = device-width,initial-scale = 1.0,minimum-scale = 1.0,maximum-scale = 1.0,user-scalable = no"/>
    <link rel="icon" href="ico/ico.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="css/chinaz.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="css/ssi-uploader.css"/>
    <#--<link rel="stylesheet" href="css/hero-slider-style.css">                              <!-- Hero slider style (https://codyhouse.co/gem/hero-slider/) &ndash;&gt;-->
    <#--<link rel="stylesheet" href="css/magnific-popup.css">                                 <!-- Magnific popup style (http://dimsemenov.com/plugins/magnific-popup/) &ndash;&gt;-->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <style type="text/css">
        .show {
            position: relative;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
            min-height: 100px;
            width: 40%;

        }

        @-webkit-keyframes greenPulse {
            from {
                background-color: #59eb5f;
                -webkit-box-shadow: 0 0 9px #333;
            }
            50% {
                background-color: #91bd09;
                -webkit-box-shadow: 0 0 18px 1 DB382;
            }
            to {
                background-color: #749a02;
                -webkit-box-shadow: 0 0 9px #333;
            }
        }

        .b_button {
            -webkit-animation-name: greenPulse;
            -webkit-animation-duration: 2s;
            -webkit-animation-iteration-count: infinite;
            width: 145px;
            height: 40px;
            font-size: large;
        }
    </style>
</head>
<body>
<div class="find_nav">
    <div class="find_nav_left">
        <div class="find_nav_list">
            <ul>
                <li class="find_nav_cur"><a href="javascript:void(0)" onclick="cutover(1)">生成二维码</a></li>
                <li><a href="javascript:void(0)" onclick="cutover(2)">解析二维码</a></li>
                <li><a href="javascript:void(0)" onclick="cutover(3)"></a></li>
                <li><a href="javascript:void(0)">关于</a></li>

                <li class="sideline"></li>
            </ul>
        </div>
    </div>
    <a class="search_logo" href="">搜索</a>
</div>


<div style="text-align:center;margin:150px 0; font:normal 14px/24px 'MicroSoft YaHei';display:block" id="_div1">
    <div class="container" id="yasuo" style="display: block;margin-top: 10%">
        <div id="txt" class="show">
            <textarea id="txtValue"
                      style="width: 100%;height: 70px; border-radius: 5px;border: 1px solid #1DB382;resize: none"></textarea>
        </div>
        <div class="container" style="width: 40%;
        float: right;">
            <div class="row" style="margin-top: -50%;">
                <h3>生成二维码</h3>
                <div class="col-md-12">
                    <img src="/img/wx.png" id="imgurl" width="200px" height="200px">
                </div>
            </div>
        </div>
        <input type="button" value="生成二维码" class="b_button" onclick="generateQrcode()" style="float: left;
    margin-left: 15%;
    margin-top: 10px;">
    </div>
</div>
<div style="text-align:center;margin:150px 0; font:normal 14px/24px 'MicroSoft YaHei';display:none" id="_div2">
    <div class="container" id="jiexi">
        <div class="container">
            <div class="row">
                <div class="col-md-12" style="margin-top: -10%">
                    <h3>解析二维码（支持jpg、gif、png格式文件）</h3>
                    <input type="file" multiple id="ssi-upload" name="file"/>
                </div>
            </div>
        </div>
        <div id="showx" class="showx">
                <textarea id="showValue" style="width: 100%;height: 100px" readonly>
                </textarea>
        </div>
    </div>
</div>
<div style="text-align:center;margin:150px 0; font:normal 14px/24px 'MicroSoft YaHei';display:none" id="_div3">
    <p>常用工具</p>
</div>

</body>

<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="js/js.js"></script>
<script src="js/ssi-uploader.js"></script>
<script type="text/javascript">
    function cutover(v) {
        $('div[id^="_div"]').css('display', 'none');
        $('#_div' + v).css('display', 'block');
    }
    function generateQrcode() {
        var url = "/qrcode";
        var txt = $('#txtValue').val();
        if (txt == null||txt=="") {
            alert("请输入需要编码的内容……");
            return;
        }
        $('#imgurl').attr("src", url + "?content=" + txt);
    }
    $('#ssi-upload').ssi_uploader({
        url: '/aacode', maxFileSize: 6, allowed: ['jpg', 'gif', 'png']
    });
</script>


</html>
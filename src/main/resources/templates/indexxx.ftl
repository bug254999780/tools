<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="css/ssi-uploader.css"/>
    <style type="text/css">
        .show {
            position: relative;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
            border: 2px dashed #ccc;
            min-height: 100px;
            width: 40%;

        }
        ._tab {

            padding-right: 15px;
            padding-left: 15px;
            border: 2px dashed #ccc;
            min-height: 50px;
            width: 100%;

        }

        ._tab1 {
            min-height: 40px;
            width: 40%;

        }
    </style>
</head>
<body>

<div class="_tab">
    <p class="_tab1">
        生成二维码
    </p>
    <p class="_tab1">
        解析二维码
    </p>
</div>

<div class="container" id="yasuo" style="display: block">
    <div id="txt" class="showx">
                <textarea id="txtValue" style="width: 100%;height: 100px">
                </textarea>
    </div>

    <div class="container" style="width: 40%;
    float: right;">
        <div class="row">
            <div class="col-md-12">
                <h3>生成二维码</h3>
                <img src="/qrcode?content=https://www.baidu.com" id="imgurl">
            </div>
        </div>
    </div>
    <input type="button" value="生成二维码" onclick="generateQrcode()">
</div>


<div class="container" id="jiexi" style="display: none">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
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

<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="js/ssi-uploader.js"></script>
<script type="text/javascript">
    function generateQrcode() {
        var url = "/qrcode";
        var txt = $('#txtValue').val();
        if(txt==null){
            alert("请输入需要编码的内容……");
            return;
        }
        $('#imgurl').attr("src", url + "?content=" + txt);
    }
    $('#ssi-upload').ssi_uploader({
        url: '/aacode', maxFileSize: 6, allowed: ['jpg', 'gif', 'png']
    });
</script>

</body>
</html>
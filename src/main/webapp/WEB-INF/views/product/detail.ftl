<html xmlns="http://www.w3.org/1999/html">
<#include "common/header.ftl">
<head>
    <link href="static/css/top.css" rel="stylesheet" type="text/css">

    <script src="static/js/top.js" type="text/javascript"></script>
    <style type="text/css">
        table{
            table-layout: fixed;/*只有定义表格的算法为fixed,th才有效果*/
            border-collapse: collapse;/*边框合并模式*/
        }
        table tr th{
            overflow:hidden;/*超出的文字隐藏*/
            text-overflow:ellipsis;/*文字超出后,显示省略号*/
            white-space:nowrap;/*文字不换行*/
            word-break:keep-all;/*文字不换行*/
        }
        table tr td{
            overflow:hidden;/*超出的文字隐藏*/
            text-overflow:ellipsis;/*文字超出后,显示省略号*/
        }

        #top{
            background-color: #ff730e;
            text-align: center;
            font-family: arial;
            font-size: 16px;
            color: white;
            font-weight: bold;
            margin: 50px 50px 50px 50px;
            border-radius:50%;
            width:50px;
            height:50px;
        }
    </style>

</head>
<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "common/nav.ftl">
<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <a href="/user/product/findproduct"><button type="submit" class="btn btn-default" style="float: right">返回</button></a>
                    <div>${product.detail}</div>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jquery.gototop.min.js"></script>
<script type="text/javascript">
    var scrolltotop={
        setting:{
            startline:100, //起始行
            scrollto:0, //滚动到指定位置
            scrollduration:400, //滚动过渡时间
            fadeduration:[500,100] //淡出淡现消失
        },
        controlHTML:'<img src="/static/img/top.png" style="width:50px; height:50px; border:0;" />', //返回顶部按钮
        controlattrs:{offsetx:30,offsety:30},//返回按钮固定位置
        anchorkeyword:"#top",
        state:{
            isvisible:false,
            shouldvisible:false
        },scrollup:function(){
            if(!this.cssfixedsupport){
                this.$control.css({opacity:0});
            }
            var dest=isNaN(this.setting.scrollto)?this.setting.scrollto:parseInt(this.setting.scrollto);
            if(typeof dest=="string"&&jQuery("#"+dest).length==1){
                dest=jQuery("#"+dest).offset().top;
            }else{
                dest=0;
            }
            this.$body.animate({scrollTop:dest},this.setting.scrollduration);
        },keepfixed:function(){
            var $window=jQuery(window);
            var controlx=$window.scrollLeft()+$window.width()-this.$control.width()-this.controlattrs.offsetx;
            var controly=$window.scrollTop()+$window.height()-this.$control.height()-this.controlattrs.offsety;
            this.$control.css({left:controlx+"px",top:controly+"px"});
        },togglecontrol:function(){
            var scrolltop=jQuery(window).scrollTop();
            if(!this.cssfixedsupport){
                this.keepfixed();
            }
            this.state.shouldvisible=(scrolltop>=this.setting.startline)?true:false;
            if(this.state.shouldvisible&&!this.state.isvisible){
                this.$control.stop().animate({opacity:1},this.setting.fadeduration[0]);
                this.state.isvisible=true;
            }else{
                if(this.state.shouldvisible==false&&this.state.isvisible){
                    this.$control.stop().animate({opacity:0},this.setting.fadeduration[1]);
                    this.state.isvisible=false;
                }
            }
        },init:function(){
            jQuery(document).ready(function($){
                var mainobj=scrolltotop;
                var iebrws=document.all;
                mainobj.cssfixedsupport=!iebrws||iebrws&&document.compatMode=="CSS1Compat"&&window.XMLHttpRequest;
                mainobj.$body=(window.opera)?(document.compatMode=="CSS1Compat"?$("html"):$("body")):$("html,body");
                mainobj.$control=$('<div id="topcontrol" >'+mainobj.controlHTML+"</div>").css({position:mainobj.cssfixedsupport?"fixed":"absolute",bottom:mainobj.controlattrs.offsety,right:mainobj.controlattrs.offsetx,opacity:0,cursor:"pointer"}).attr({title:"返回顶部"}).click(function(){mainobj.scrollup();return false;}).appendTo("body");if(document.all&&!window.XMLHttpRequest&&mainobj.$control.text()!=""){mainobj.$control.css({width:mainobj.$control.width()});}mainobj.togglecontrol();
                $('a[href="'+mainobj.anchorkeyword+'"]').click(function(){mainobj.scrollup();return false;});
                $(window).bind("scroll resize",function(e){mainobj.togglecontrol();});
            });
        }
    };
    scrolltotop.init();
</script>
</body>
</html>
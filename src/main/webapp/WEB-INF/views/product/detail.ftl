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

        #bigbox{
            display: flex;
            width: 95%;
            justify-content: space-around;
            flex-wrap:wrap;
            border: 1px solid black;
            padding: 30px 70px;
            margin: 100px 50px
        }

        #imgbox{
            width: 610px;
            height: 610px;
            padding: 30px 30px
        }

        #back{color: grey}
        #back:hover{color: darkgrey}

        #new,#hot,#banner{
            width: 50px;
            float: left;
            font-size: 16px;
            margin: 0 6px;
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
                    <a id="back" href="/user/product/findproduct"><span class="glyphicon glyphicon-chevron-left" style="float: left;position: fixed;font-size: 30px;margin-top: 40px">返回</span></a>
                    <div id="bigbox">
                        <div id="imgbox">
                            <div><img height="540" width="540" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" src="http://img.cdn.imbession.top/${product.mainImage}" alt=""></div>
                        </div>
                        <div id="textbox" style="width: 800px;height: 600px;margin-top: 40px">
                        <div id="title"><h1>${product.name}<h1></div>
                        <#assign checkisHot="${product.isHot}"/>
                        <#if checkisHot==1>
                            <div id="hot"><span class="label label-danger">热门</span></div>
                        </#if>
                        <#assign checkisNew="${product.isNew}"/>
                        <#if checkisNew==1>
                            <div id="new"><span class="label label-info">新品</span></div>
                        </#if>
                        <#assign checkisBanner="${product.isBanner}"/>
                        <#if checkisBanner==1>
                            <div id="banner"><span class="label label-warning">轮播</span></div>
                        </#if><br>
                        <div id="subtitle">
                            <h4>${product.subtitle}</h4>
                        </div><br>
                            <div style="display:flex;align-items: center;">
                                <div>
                                    <span style="color: darkgrey;font-size: 14px">价格</span>
                                </div>
                                <div>
                                    <span style="color: red;font-weight: bold;font-size: 48px;position: relative;left: 30px">￥${product.price}</span>
                                </div>
                            </div>
                            <br>
                        <div style="display:flex;align-items: center;">
                            <div>
                                <span style="color: darkgrey;font-size: 14px">库存</span>
                            </div>
                            <div>
                                <span style="color: darkgrey;font-weight: bold;font-size: 14px;position: relative;left: 30px">${product.stock}件</span>
                            </div>
                        </div><br><br>
                        <#assign checkstatus="${product.status}"/>
                        <#if checkstatus==1>
                           <div id="up"><a href="/user/product/productdown/${product.id}"><button class="btn btn-danger" style="width: 100px;height: 40px;font-size: 18px">下架商品</button></a></div>
                        </#if>
                        <#if checkstatus==2>
                            <div id="down"><a href="/user/product/productup/${product.id}"><button class="btn btn-primary">上架商品</button></a></div>
                        </#if>
                        </div>
                    </div>
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
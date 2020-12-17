<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>

<div class="like"><h4>猜你喜欢</h4>
    <div class="bottom">
        <div class="hd"><span class="prev"><img src="<%= basePath%>img/temp/prev.png"></span><span class="next"><img
                src="<%= basePath%>img/temp/next.png"></span></div>
        <div class="imgCon bd">
            <div class="likeList clearfix">
                <div>
                    <a href="<%= basePath%>show/getShowByID?showId=1" class="clearfix">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID1.png"/><span class="abr"></span></dt>
                            <dd>【演唱会】吴青峰“太空备忘记”巡回演唱会</dd>
                            <dd><span>¥ 688.00</span></dd>
                        </dl>
                    </a>
                    <a href="<%= basePath%>show/getShowByID?showId=2">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID2.jpg"/><span class="abr"></span></dt>
                            <dd>【演唱会】周杰伦【嘉年华】世界巡回演唱会</dd>
                            <dd><span>¥ 888.00</span></dd>
                        </dl>
                    </a>
                    <a href="<%= basePath%>show/getShowByID?showId=4">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID4.png"/><span class="abr"></span></dt>
                            <dd>【音乐剧】《马可·波罗》</dd>
                            <dd><span>¥ 120.00</span></dd>
                        </dl>
                    </a>
                    <a href="<%= basePath%>show/getShowByID?showId=5">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID5.png"/><span class="abr"></span></dt>
                            <dd>【音乐剧】《梵高》</dd>
                            <dd><span>¥ 145.00</span></dd>
                        </dl>
                    </a>
                    <a href="<%= basePath%>show/getShowByID?showId=7">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID7.png"/><span class="abr"></span></dt>
                            <dd>【脱口秀】太·空间&无忧喜剧</dd>
                            <dd><span>¥ 133.00</span></dd>
                        </dl>
                    </a>
                </div>
                <div>
                    <a href="<%= basePath%>show/getShowByID?showId=8">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID8.png"/><span class="abr"></span></dt>
                            <dd>【脱口秀】《求婚女王》</dd>
                            <dd><span>¥ 289.00</span></dd>
                        </dl>
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="<%= basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%= basePath%>js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="<%= basePath%>js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="<%= basePath%>js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="<%= basePath%>js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="<%= basePath%>js/cart.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">jQuery(".bottom").slide({
    titCell: ".hd ul",
    mainCell: ".bd .likeList",
    autoPage: true,
    autoPlay: false,
    effect: "leftLoop",
    autoPlay: true,
    vis: 1
});</script>


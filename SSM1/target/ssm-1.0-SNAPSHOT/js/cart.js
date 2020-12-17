
$(function () {


    $(document).on('click', '.num .sub' ,function(){
        var c = parseInt($(this).siblings("span").text());
        if (c <= 1) {
            $(this).attr("disabled", "disabled")
        } else {
            c--;
            $(this).siblings("span").html(c);
            var d =$(this).parents().prev().html();
            $(this).parents(".th").find(".sAll").text("" + (c * d).toFixed(2));
            a();
            b()
        }
    });
    $(document).on('click', '.num .add' ,function(){
        var c = parseInt($(this).siblings("span").text());//数量
        if (c >= 5) {
            alert("限购5件")
        } else {
            c++;
            $(this).siblings("span").html(c);
            var d =$(this).parents().prev().html();
            $(this).parents(".th").find(".sAll").text("" + (c * d).toFixed(2));
            a();
            b()
        }
    });


    function a() {//总价格
        var c = 0;
        var d = $(".th input[type='checkbox']:checked").length;
        if (d == 0) {
            $("#all").text("" + parseFloat(0).toFixed(2))
        } else {
            $(".th input[type='checkbox']:checked").each(function () {
                var e = $(this).parents(".pro").siblings(".sAll").text();

                c += parseFloat(e);
                $("#all").text("" + c.toFixed(2))
            })
        }
    }

    function b() {//总数量
        var e = 0;
        var c = $(".th input[type='checkbox']:checked").parents(".th").find(".num span");//数量
        var d = c.length;
        if (d == 0) {
            $("#sl").text(0)
        } else {
            c.each(function () {
                e += parseInt($(this).text());
                $("#sl").text(e)
            })
        }
        if ($("#sl").text() > 0) {
            $(".count").css("background", "#c10000")
        } else {
            $(".count").css("background", "#8e8e8e")
        }
    }

    $(document).on('click', 'input[type="checkbox"]' ,function(){
        var f = $(this).is(":checked");
        var e = $(this).hasClass("checkAll");
        var array = new Array();
        if (f) {
            if (e) {
                $(".xx").each(function () {
                    this.checked = true
                    var JSONObject={
                        "showName":$(this).parent().siblings(".clearfix").find(".p1").html(),
                        "showPrice":$(this).parent().parent().siblings(".price").html(),
                        "buyNum":$(this).parent().parent().siblings(".number").find("#ss").html(),
                        "showPic": $(this).parent().siblings(".clearfix").find("img").attr("src"),
                        "showId": $(this).parent().siblings(".clearfix").find(".hide").html()
                    }

                    array.push(JSONObject);
                });
                $("#count").click(function (){
                    $(location).attr('href','/SSM1/cartToOrder.jsp?list='+JSON.stringify(array))
                })
                b();
                a()
            } else {
                $(this).checked = true;
                var c = $("input[type='checkbox']:checked").length;
                var d = $("input").length - 1;
                if (c == d) {
                    $("input[type='checkbox']").each(function () {
                        this.checked = true
                    })
                }
                b();
                a()
            }
        } else {
            if (e) {
                $("input[type='checkbox']").each(function () {
                    this.checked = false
                });
                b();
                a()
            } else {
                $(this).checked = false;
                var c = $(".th input[type='checkbox']:checked").length;
                var d = $("input").length - 1;
                if (c < d) {
                    $(".checkAll").attr("checked", false)
                }
                b();
                a()
            }
        }
    })


    $(".cancel").click(function () {
        $(".mask").hide();
        $(".tipDel").hide()
    })



    $(".btns .cart").click(function () {
        if ($(".categ p").hasClass("on")) {
            var c = parseInt($(".num span").text());
            var d = parseInt($(".goCart span").text());
            $(".goCart span").text(c + d)
        }
    });


});
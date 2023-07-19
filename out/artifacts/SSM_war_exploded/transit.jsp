<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2023/5/29
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>操作成功</title>
    <script src="./js/jQuery.js"></script>
</head>
<body>
    <h1>操作成功，<span></span>秒后返回登录页面</h1>
    <button>立即跳转</button>
</body>
<script>
    //设定倒数秒数
    var count = 3;
    //写一个方法，显示倒数秒数  数到0后跳转页面
    function countDown(){
        //将count显示在div中
        // document.getElementById("div1").innerHTML= count;
        $("span").html(count)
        //没执行一次，count减1
        count -= 1;
        //count=0时，跳转页面
        if(count==0){
            location.href="${pageContext.request.contextPath}/index.jsp";
            //window.location.href="index.html";
        }
        //每秒执行一次,showTime()
        setTimeout("countDown()",1000);
    }
    $("button").click(() => {
        location.href="${pageContext.request.contextPath}/index.jsp";
    })
    //执行countDown方法
    countDown();
</script>
</html>

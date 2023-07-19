<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生页面</title>
    <script src="./js/jQuery.js"></script>
    <%--  --------------------------bootstrap v4--------------------------  --%>
    <%-- CSS --%>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <%--  js  --%>
    <script src="./js/bootstrap.min.js"></script>
    <%--  --------------------------/bootstrap v4--------------------------  --%>

    <script src="js/index.js"></script>
</head>
<body>
<h1>欢迎您！${stu.stuName}</h1>
<h2>您的身份是：学生</h2>
<button id="baseInfo">基本信息</button>
<button id="classInfo">班级信息</button>
<button id="courseInfo">课程信息</button>
<button id="curriculumInfo">课程表</button>
<button id="getScore">成绩查询</button>
<button id="modify" data-toggle="modal" data-target="#exampleModal">修改密码</button>

<%--信息显示区域--%>
<div id="content">
    <table class="table table-striped" id="myInfo">
        <thead>

        </thead>
        <tbody>

        </tbody>
    </table>
</div>
<%--/信息显示区域--%>

<%--查询操作区域--%>
<div id="search">

</div>
<%--/查询操作区域--%>


<%--修改密码操作框--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">修改密码</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/modifyPassword?username=${stu.stuNo}" method="post">
                    <div class="form-group">
                        <label>原密码</label>
                        <input type="password" class="form-control" name="prevPassword">
                    </div>
                    <div class="form-group">
                        <label>新密码</label>
                        <input type="password" class="form-control" name="current1">
                    </div>
                    <div class="form-group">
                        <label>确认新密码</label>
                        <input type="password" class="form-control" name="current2">
                    </div>
                    <button type="submit" class="btn btn-primary">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--/修改密码操作框--%>

</body>
<script>

    let contextPath = '${pageContext.request.contextPath}'

    // 请求基本信息
    $("#baseInfo").click(() => {
        thStr = ''
        thStr += '<tr>'
        thStr += '<th scope="col">#</th>'
        thStr += '<th scope="col">学号</th>'
        thStr += '<th scope="col">姓名</th>'
        thStr += '<th scope="col">性别</th>'
        thStr += '<th scope="col">生日</th>'
        thStr += '<th scope="col">专业</th>'
        thStr += '<th scope="col">班级</th>'
        thStr += '<th scope="col">籍贯</th>'
        thStr += '<th scope="col">电话</th>'
        thStr += '<th scope="col">备注</th>'
        thStr += '</tr>'

        $('#myInfo thead').html(thStr)
        showSelfInfo(contextPath + '/selectById?stuNo=${stu.stuNo}', '#myInfo tbody', [
            'stuNo', 'stuName', 'stuGender', 'stuBirth', 'stuMajor', 'stuClass', 'stuArea', 'stuTele', 'stuPs'
        ])
    });

    // 请求班级信息
    $("#classInfo").click(() => {
        thStr = ''
        thStr += '<tr>'
        thStr += '<th scope="col">#</th>'
        thStr += '<th scope="col">班级号</th>'
        thStr += '<th scope="col">专业</th>'
        thStr += '<th scope="col">班级人数</th>'
        thStr += '<th scope="col">入学时间</th>'
        thStr += '<th scope="col">辅导员</th>'
        thStr += '</tr>'
        $('#myinfo thead').html(thStr)
        showSelfInfo(contextPath + '/getMyClass?name=${stu.stuClass}', '#myInfo tbody', [
            'name', 'major', 'number', 'start', 'counsellor'
        ])
    })

    // 请求全部课程信息
    $("#courseInfo").click(() => {
        thStr = ''
        thStr += '<tr>'
        thStr += '<th scope="col">#</th>'
        thStr += '<th scope="col">课程编号</th>'
        thStr += '<th scope="col">课程名</th>'
        thStr += '<th scope="col">学时</th>'
        thStr += '<th scope="col">学分</th>'
        thStr += '</tr>'


        $('#myinfo thead').html(thStr)

        showAllInfos(contextPath + '/getCourseInfo', '#myInfo tbody', [
            'cNo', 'cName', 'cHours', 'cScore'
        ])
    })

    // 请求课程表信息
    $("#curriculumInfo").click(() => {
        thStr = ''
        thStr += '<tr>'
        thStr += '<th scope="col">#</th>'
        thStr += '<th scope="col">排课id</th>'
        thStr += '<th scope="col">课程编号</th>'
        thStr += '<th scope="col">班级</th>'
        thStr += '<th scope="col">老师</th>'
        thStr += '<th scope="col">上课时间</th>'
        thStr += '<th scope="col">上课地点</th>'
        thStr += '</tr>'


        $('#myinfo thead').html(thStr)

        showAllInfos(contextPath + '/selectCurriByClassName?stuClass=${stu.stuClass}', '#myInfo tbody', [
            'id', 'cNo', 'className', 'teacher', 'teachTime', 'teachPlace'
        ])
    })

    // 请求自己的成绩信息
    $("#getScore").click(() => {
        thStr = ''
        thStr += '<tr>'
        thStr += '<th scope="col">#</th>'
        thStr += '<th scope="col">学号</th>'
        thStr += '<th scope="col">课程编号</th>'
        thStr += '<th scope="col">成绩</th>'
        thStr += '</tr>'

        $('#myinfo thead').html(thStr)

        showAllInfos(contextPath + "/getMyScore?stuNo=${stu.stuNo}", '#myInfo tbody', [
            'stuNo', 'cNo', 'grade'
        ])
    })
</script>
</html>

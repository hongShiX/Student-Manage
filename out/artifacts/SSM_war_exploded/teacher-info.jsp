<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师页面</title>
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
<h1>欢迎您！${teacher.name}</h1>
<h2>您的身份是：老师</h2>
<button id="baseInfo">基本信息</button>
<button id="curriculumInfo">课程表</button>
<button id="getScore">成绩查询</button>
<button id="addScore" data-toggle="modal" data-target="#addScoreModal">添加成绩</button>
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

<%--添加成绩区域--%>
<div class="modal fade" id="addScoreModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form method="post" id="submitScore">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">添加成绩</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>课程号</label>
                            <select id="chooseCNo" class="form-control" name="cNo">
                                <option selected>请选择</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label>班级</label>
                            <select id="chooseClass" class="form-control" name="className">
                                <option selected>请选择</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label>学号</label>
                            <select id="chooseSno" class="form-control" name="stuNo">
                                <option selected>请选择</option>
                            </select>
                        </div>
                        <div class="form-group col-md-2">
                            <label>分数</label>
                            <input type="number" class="form-control" id="grade">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" id="saveGrade">保存</button>
                </div>
            </div>
        </div>
    </form>
</div>
<%--/添加成绩区域--%>

<%--操作提示区域--%>
<div class="modal" tabindex="-1" id="error">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">错误</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>信息不全，请补全</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<%--/操作提示区域--%>


</body>
<script>
    let contextPath = "${pageContext.request.contextPath}"
    $("#baseInfo").click(() => {
        thStr = ''
        thStr += '<tr>'
        thStr += '<th scope="col">#</th>'
        thStr += '<th scope="col">ID</th>'
        thStr += '<th scope="col">姓名</th>'
        thStr += '<th scope="col">性别</th>'
        thStr += '<th scope="col">生日</th>'
        thStr += '<th scope="col">院系</th>'
        thStr += '<th scope="col">电话</th>'
        thStr += '</tr>'

        $('#myInfo thead').html(thStr)
        showSelfInfo(contextPath + "/teacherSelfInfo?id=${teacher.id}", '#myInfo tbody', [
            'id',
            'name',
            'gender',
            'birth',
            'dept',
            'tele',
        ])
    });

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

        showAllInfos(contextPath + '/selectCourseByTeacher?name=${teacher.name}', '#myInfo tbody', [
            'id',
            'cNo',
            'className',
            'teacher',
            'teachTime',
            'teachPlace'
        ])
    })

    $("#getScore").click(() => {
        thStr = ''
        thStr += '<tr>'
        thStr += '<th scope="col">#</th>'
        thStr += '<th scope="col">学号</th>'
        thStr += '<th scope="col">课程编号</th>'
        thStr += '<th scope="col">成绩</th>'
        thStr += '</tr>'

        $('#myinfo thead').html(thStr)
        showAllInfos(contextPath + "/getMyCScore?name=${teacher.name}", '#myInfo tbody', [
            'stuNo', 'cNo', 'grade'
        ])
    })

    $("#addScore").click(() => {
        $.ajax({
            url: contextPath + '/selectCourseByTeacher?name=${teacher.name}',
            type: "get",
            success: (res) => {
                let json = $.parseJSON(res)

                let chooseCnoStr = '<option selected>请选择</option>'
                for (let i = 0; i < json.length; i++) {
                    chooseCnoStr += '<option>' + json[i].cNo + '</option>'
                }

                $("#chooseCNo").html(chooseCnoStr)
            }
        })

    })

    $("#chooseCNo").change((e) => {
        e.stopPropagation()
        $.ajax({
            url: contextPath + '/selectCurriByClass?cNo=' + $("#chooseCNo").val(),
            type: "get",
            success: (res) => {
                console.log(res)
                let json = $.parseJSON(res)

                let chooseClassStr = '<option selected>请选择</option>'
                for (let i = 0; i < json.length; i++) {
                    chooseClassStr += '<option>' + json[i].className + '</option>'
                }

                $("#chooseClass").html(chooseClassStr)
            }
        })
    })

    $("#chooseClass").change((e) => {
        e.stopPropagation()
        $.ajax({
            url: contextPath + '/selectStuByClass?className=' + $("#chooseClass").val(),
            type: "get",
            success: (res) => {
                console.log(res)
                let json = $.parseJSON(res)

                let chooseSnoStr = ''
                for (let i = 0; i < json.length; i++) {
                    chooseSnoStr += '<option>' + json[i].stuNo + '</option>'
                }

                $("#chooseSno").html(chooseSnoStr)
            }
        })
    })

    $("#saveGrade").click((e) => {
        e.stopPropagation()
        if ($("#chooseCNo").val() === '请选择' || $("#chooseClass").val() === '请选择' || $("#chooseSno").val() === '请选择') {
            $("#error").modal('show')
            return
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/addScore",
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify({
                stuNo: $("#chooseSno").val(),
                cNo: $("#chooseCNo").val(),
                grade: $("#grade").val()
            }),
            success: (result) => {
                console.log(result)
                $("#addScoreModal").modal('hide')
                alert("添加成功")
            }
        })
    })
</script>
</html>

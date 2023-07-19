<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2023/5/28
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员页面</title>
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
<h1>欢迎您！${manager}</h1>
<h2>您的身份是：管理员</h2>
<button id="userInfo">用户信息</button>
<button id="studentInfo">学生信息</button>
<button id="classInfo">班级信息</button>
<button id="teacherInfo">教师信息</button>
<button id="courseInfo">课程信息</button>
<button id="curriculumInfo">课程表</button>
<button id="getScore">成绩查询</button>

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

<%--其他操作--%>
<div id="operation">

</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-title">添加</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="save">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script>
    let contextPath = '${pageContext.request.contextPath}'
    $("#userInfo").click(() => {
        thStr = ''
        thStr += '<tr>'
        thStr += '<th scope="col">#</th>'
        thStr += '<th scope="col">用户名</th>'
        thStr += '<th scope="col">密码</th>'
        thStr += '<th scope="col">用户类型</th>'
        thStr += '</tr>'

        ope = `
                    <button id="addUser">添加用户</button>
                    <button id="deleteUser">删除用户</button>
                    <button id="updateUser">修改用户</button>
                `

        $('#myInfo thead').html(thStr)

        $("#search").html('')
        $("#operation").html(ope)
        $("#addUser").click((e) => {
            e.stopImmediatePropagation()
            $("#modal-title").html("添加")
            $("#modal-body").html(addUserOpe)
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                let userTypeInt = $("#userType").val()
                if (userTypeInt === '学生') {
                    userTypeInt = 1
                } else if (userTypeInt === '教师') {
                    userTypeInt = 0
                } else {
                    userTypeInt = 2
                }
                operation(contextPath + '/addUser', {
                    username: $("#username").val(),
                    password: $("#password").val(),
                    userType: userTypeInt
                }, () => {
                    showAllInfos(contextPath + "/getAllUsers", '#myInfo tbody', [
                        'username', 'password', 'userType'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#deleteUser").click((e) => {
            e.stopImmediatePropagation()
            $("#modal-title").html("删除")
            $("#modal-body").html(deleteUserOpe)
            showOptions(contextPath + "/getAllUsers", '#username', ['username'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/deleteUser', {
                    username: $("#username").val()
                }, () => {
                    showAllInfos(contextPath + "/getAllUsers", '#myInfo tbody', [
                        'username', 'password', 'userType'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#updateUser").click((e) => {
            e.stopImmediatePropagation()
            $("#modal-title").html("修改")
            $("#modal-body").html(updateUserOpe)
            showOptions(contextPath + "/getAllUsers", '#username', ['username'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                let userTypeInt = $("#userType").val()
                if (userTypeInt === '学生') {
                    userTypeInt = 1
                } else if (userTypeInt === '教师') {
                    userTypeInt = 0
                } else {
                    userTypeInt = 2
                }
                operation(contextPath + '/updateUser', {
                    username: $("#username").val(),
                    password: $("#password").val(),
                    userType: userTypeInt
                }, () => {
                    showAllInfos(contextPath + "/getAllUsers", '#myInfo tbody', [
                        'username', 'password', 'userType'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        showAllInfos(contextPath + "/getAllUsers", '#myInfo tbody', [
            'username', 'password', 'userType'
        ])
    })

    $("#studentInfo").click(() => {
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
        search = `
                                <form class="form-inline" action="/conditionQuery" method="get">
                                  <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="学号" name="stuNo" id="stu-no">


                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="姓名" name="stuName" id="stu-name">


                                  <button type="button" class="btn btn-primary mb-2" id="conditionQuery">查询</button>
                                </form>
                                `

        ope = `
                    <button id="addStu">添加学生</button>
                    <button id="deleteStu">删除学生</button>
                    <button id="updateStu">修改学生</button>
                `
        $('#myInfo thead').html(thStr)

        $("#search").html(search)
        $("#conditionQuery").click((e) => {
            e.stopPropagation()
            conditionQuery($("#stu-no").val(), $("#stu-name").val())
        })
        $("#operation").html(ope)
        $("#addStu").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("添加")
            showOptions(contextPath + "/getClassInfo", "#stu-class", ['name'])
            $("#modal-body").html(addStuOpe)
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/addStu', {
                    stuNo: $("#input-stu-no").val(),
                    stuName: $("#input-stu-name").val(),
                    stuGender: $("#stu-gender").val(),
                    stuBirth: $("#stu-birth").val(),
                    stuMajor: $("#stu-major").val(),
                    stuClass: $("#stu-class").val(),
                    stuArea: $("#stu-area").val(),
                    stuTele: $("#stu-tele").val(),
                    stuPs: $("#stu-ps").val()
                }, () => {
                    showAllInfos(contextPath + "/baseInfo", '#myInfo tbody', [
                        'stuNo', 'stuName', 'stuGender', 'stuBirth', 'stuMajor', 'stuClass', 'stuArea', 'stuTele', 'stuPs'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#deleteStu").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("删除")
            $("#modal-body").html(deleteStuOpe)
            showOptions(contextPath + "/baseInfo", "#delete-input-stu-no", ['stuNo'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/deleteStu', {
                    stuNo: $("#delete-input-stu-no").val()
                }, () => {
                    showAllInfos(contextPath + "/baseInfo", '#myInfo tbody', [
                        'stuNo', 'stuName', 'stuGender', 'stuBirth', 'stuMajor', 'stuClass', 'stuArea', 'stuTele', 'stuPs'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#updateStu").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("更新")
            showOptions(contextPath + "/baseInfo", "#input-stu-no", ['stuNo'])
            showOptions(contextPath + "/getClassInfo", "#stu-class", ['name'])
            $("#modal-body").html(updateStuOpe)
            $("#exampleModal").modal('show')
            $("#save").off("click");
            $("#save").on("click", () => {
                operation(contextPath + '/updateStu', {
                    stuNo: $("#input-stu-no").val(),
                    stuName: $("#input-stu-name").val(),
                    stuGender: $("#stu-gender").val(),
                    stuBirth: $("#stu-birth").val(),
                    stuMajor: $("#stu-major").val(),
                    stuClass: $("#stu-class").val(),
                    stuArea: $("#stu-area").val(),
                    stuTele: $("#stu-tele").val(),
                    stuPs: $("#stu-ps").val()
                }, () => {
                    showAllInfos(contextPath + "/baseInfo", '#myInfo tbody', [
                        'stuNo', 'stuName', 'stuGender', 'stuBirth', 'stuMajor', 'stuClass', 'stuArea', 'stuTele', 'stuPs'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        showAllInfos(contextPath + "/baseInfo", '#myInfo tbody', [
            'stuNo', 'stuName', 'stuGender', 'stuBirth', 'stuMajor', 'stuClass', 'stuArea', 'stuTele', 'stuPs'
        ])
    })

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

        search = `
                    <form class="form-inline" action="/conditionQuery" method="post">
                                  <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="班级名" id="name">


                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="专业"  id="major">

                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="date" class="form-control mb-2 mr-sm-2"  placeholder="入学年份"  id="start">


                                  <button type="button" class="btn btn-primary mb-2" id="conditionQueryClazz">查询</button>
                    </form>
                `

        ope = `
                    <button id="add-class">添加班级</button>
                    <button id="delete-class">删除班级</button>
                    <button id="update-class">修改班级</button>
                `
        $('#myinfo thead').html(thStr)

        $('#search').html(search)
        $("#operation").html(ope)
        $('#conditionQueryClazz').click((e) => {
            e.stopImmediatePropagation()
            conditionQueryClazz($('#name').val(), $('#major').val(), $("#start").val())
        })

        $("#add-class").click((e) => {
            e.stopImmediatePropagation()
            $("#modal-title").html("添加")
            $("#modal-body").html(addClassOpe)
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/addClass', {
                    name: $("#add-input-class-name").val(),
                    major: $("#add-input-class-major").val(),
                    number: $("#add-input-class-num").val(),
                    start: $("#add-input-class-start").val(),
                    counsellor: $("#add-input-class-counsellor").val()
                }, () => {
                    showAllInfos(contextPath + '/getClassInfo', '#myInfo tbody', [
                        'name', 'major', 'number', 'start', 'counsellor'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#delete-class").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("删除")
            $("#modal-body").html(deleteClassOpe)
            showOptions(contextPath + '/getClassInfo', '#delete-input-class-name', ['name'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/deleteClass', {
                    name: $("#delete-input-class-name").val()
                }, () => {
                    showAllInfos(contextPath + '/getClassInfo', '#myInfo tbody', [
                        'name', 'major', 'number', 'start', 'counsellor'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#update-class").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("更新")
            $("#modal-body").html(updateClassOpe)
            showOptions(contextPath + '/getClassInfo', '#add-input-class-name', ['name'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/updateClass', {
                    name: $("#add-input-class-name").val(),
                    major: $("#add-input-class-major").val(),
                    number: $("#add-input-class-num").val(),
                    start: $("#add-input-class-start").val(),
                    counsellor: $("#add-input-class-counsellor").val()
                }, () => {
                    showAllInfos(contextPath + '/getClassInfo', '#myInfo tbody', [
                        'name', 'major', 'number', 'start', 'counsellor'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        showAllInfos(contextPath + '/getClassInfo', '#myInfo tbody', [
            'name', 'major', 'number', 'start', 'counsellor'
        ])
    })

    $("#teacherInfo").click(() => {
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
        search = `
                                <form class="form-inline" action="/conditionQueryTeacherInfo" method="post">
                                  <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="id"  id="id">


                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="姓名"  id="name">

                                    <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="学院"  id="dept">

                                  <button type="button" class="btn btn-primary mb-2" id="conditionQueryTeacherInfo">查询</button>
                                </form>
                                `
        $('#myInfo thead').html(thStr)

        $("#search").html(search)
        $("#conditionQueryTeacherInfo").click((e) => {
            e.stopPropagation()
            conditionQueryTeacherInfo($("#id").val(), $("#name").val(), $("#dept").val())
        })
        ope = `
                    <button id="addTeacher">添加老师</button>
                    <button id="deleteTeacher">删除老师</button>
                    <button id="updateTeacher">修改老师</button>
                `

        $("#operation").html(ope)
        $("#addTeacher").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("添加")
            $("#modal-body").html(addTeacherOpe)
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/addTeacher', {
                    id: $("#add-input-teacher-id").val(),
                    name: $("#add-input-teacher-name").val(),
                    gender: $("#add-input-teacher-gender").val(),
                    birth: $("#add-input-teacher-birth").val(),
                    dept: $("#add-input-teacher-dept").val(),
                    tele: $("#add-input-teacher-tele").val()
                }, () => {
                    showAllInfos(contextPath + "/teacherInfo", '#myInfo tbody', [
                        'id',
                        'name',
                        'gender',
                        'birth',
                        'dept',
                        'tele',
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#deleteTeacher").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("删除")
            $("#modal-body").html(deleteTeacherOpe)
            showOptions(contextPath + '/teacherInfo', '#delete-input-teacher-id', ['id'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", (e) => {
                operation(contextPath + '/deleteTeacher', {
                    id: $("#delete-input-teacher-id").val()
                }, () => {
                    showAllInfos(contextPath + "/teacherInfo", '#myInfo tbody', [
                        'id',
                        'name',
                        'gender',
                        'birth',
                        'dept',
                        'tele',
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#updateTeacher").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("更新")
            $("#modal-body").html(updateTeacherOpe)
            showOptions(contextPath + '/teacherInfo', '#add-input-teacher-id', ['id'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/updateTeacher', {
                    id: $("#add-input-teacher-id").val(),
                    name: $("#add-input-teacher-name").val(),
                    gender: $("#add-input-teacher-gender").val(),
                    birth: $("#add-input-teacher-birth").val(),
                    dept: $("#add-input-teacher-dept").val(),
                    tele: $("#add-input-teacher-tele").val()
                }, () => {
                    showAllInfos(contextPath + "/teacherInfo", '#myInfo tbody', [
                        'id',
                        'name',
                        'gender',
                        'birth',
                        'dept',
                        'tele',
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })

        showAllInfos(contextPath + "/teacherInfo", '#myInfo tbody', [
            'id',
            'name',
            'gender',
            'birth',
            'dept',
            'tele',
        ])
    });

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

        search = `
                    <form class="form-inline" action="/conditionQuery" method="post">
                                  <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="课程号" id="cNo">


                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="课程名"  id="cName">


                                  <button type="button" class="btn btn-primary mb-2" id="conditionQueryCourses">查询</button>
                    </form>
                `

        ope = `
                    <button id="addCourse">添加课程</button>
                    <button id="deleteCourse">删除课程</button>
                    <button id="updateCourse">修改课程</button>
                `
        $('#myInfo thead').html(thStr)

        $("#search").html(search)
        $("#conditionQueryCourses").click((e) => {
            e.stopImmediatePropagation()
            conditionQueryCourses($("#cNo").val(), $("#cName").val())
        })
        $("#operation").html(ope)
        $("#addCourse").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("添加")
            $("#modal-body").html(addCourseOpe)
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/addCourse', {
                    cNo: $("#add-input-course-no").val(),
                    cName: $("#add-input-course-name").val(),
                    cHours: $("#add-input-course-hours").val(),
                    cScore: $("#add-input-course-score").val(),
                }, () => {
                    showAllInfos(contextPath + '/getCourseInfo', '#myInfo tbody', [
                        'cNo', 'cName', 'cHours', 'cScore'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#deleteCourse").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("删除")
            $("#modal-body").html(deleteCourseOpe)
            showOptions(contextPath + '/getCourseInfo', '#delete-input-course-no', ['cNo'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/deleteCourse', {
                    cNo: $("#delete-input-course-no").val()
                }, () => {
                    showAllInfos(contextPath + '/getCourseInfo', '#myInfo tbody', [
                        'cNo', 'cName', 'cHours', 'cScore'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#updateCourse").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("更新")
            $("#modal-body").html(updateCourseOpe)
            showOptions(contextPath + '/getCourseInfo', '#add-input-course-no', ['cNo'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/updateCourse', {
                    cNo: $("#add-input-course-no").val(),
                    cName: $("#add-input-course-name").val(),
                    cHours: $("#add-input-course-hours").val(),
                    cScore: $("#add-input-course-score").val(),
                }, () => {
                    showAllInfos(contextPath + '/getCourseInfo', '#myInfo tbody', [
                        'cNo', 'cName', 'cHours', 'cScore'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
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

        search = `
                    <form class="form-inline" action="/conditionQuery" method="post">
                                  <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="课程号" id="cNo">


                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                 <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="课程名"  id="cName">

                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                 <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="教师"  id="teacher">

                                    <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="date" class="form-control mb-2 mr-sm-2"  placeholder="时间"  id="teachTime">

                                  <button type="button" class="btn btn-primary mb-2" id="conditionQueryCurriculum">查询</button>
                    </form>
                `

        ope = `
                    <button id="addCu">添加课程表</button>
                    <button id="deleteCu">删除课程表</button>
                    <button id="updateCu">修改课程表</button>
                `
        $("#search").html(search)
        $('#myinfo thead').html(thStr)

        $("#conditionQueryCurriculum").click((e) => {
            e.stopPropagation()
            conditionQueryCurriculum($("#cNo").val(), $("#cName").val(), $("#teacher").val(), $("#teachTime").val())
        })
        $("#operation").html(ope)

        $("#addCu").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("添加")
            $("#modal-body").html(addCuOpe)
            showOptions(contextPath + '/getCourseInfo', '#add-input-cu-cNo', ['cNo'])
            showOptions(contextPath + "/teacherInfo", "#add-input-cu-teacher", ['name'])
            showOptions(contextPath + "/getClassInfo", "#add-input-cu-class", ['name'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/addCu', {
                    id: $("#add-input-cu-id").val(),
                    cNo: $("#add-input-cu-cNo").val(),
                    className: $("#add-input-cu-class").val(),
                    teacher: $("#add-input-cu-teacher").val(),
                    teachTime: $("#add-input-cu-teach-time").val(),
                    teachPlace: $("#add-input-cu-teach-place").val(),
                }, () => {
                    showAllInfos(contextPath + '/getMyCurriculums', '#myInfo tbody', [
                        'id',
                        'cNo',
                        'className',
                        'teacher',
                        'teachTime',
                        'teachPlace'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#deleteCu").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("删除")
            $("#modal-body").html(deleteCuOpe)
            showOptions(contextPath + '/getMyCurriculums', '#delete-input-cu-id', ['id'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/deleteCu', {
                    id: $("#delete-input-cu-id").val(),
                }, () => {
                    showAllInfos(contextPath + '/getMyCurriculums', '#myInfo tbody', [
                        'id',
                        'cNo',
                        'className',
                        'teacher',
                        'teachTime',
                        'teachPlace'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#updateCu").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("更新")
            $("#modal-body").html(updateCuOpe)
            showOptions(contextPath + '/getCourseInfo', '#add-input-cu-cNo', ['cNo'])
            showOptions(contextPath + '/getMyCurriculums', '#add-input-cu-id', ['id'])
            showOptions(contextPath + "/teacherInfo", "#add-input-cu-teacher", ['name'])
            showOptions(contextPath + "/getClassInfo", "#add-input-cu-class", ['name'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/updateCu', {
                    id: $("#add-input-cu-id").val(),
                    cNo: $("#add-input-cu-cNo").val(),
                    className: $("#add-input-cu-class").val(),
                    teacher: $("#add-input-cu-teacher").val(),
                    teachTime: $("#add-input-cu-teach-time").val(),
                    teachPlace: $("#add-input-cu-teach-place").val(),
                }, () => {
                    showAllInfos(contextPath + '/getMyCurriculums', '#myInfo tbody', [
                        'id',
                        'cNo',
                        'className',
                        'teacher',
                        'teachTime',
                        'teachPlace'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        showAllInfos(contextPath + '/getMyCurriculums', '#myInfo tbody', [
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
        search = `
                     <form class="form-inline" action="/conditionQuerySheets" method="post">
                                  <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="学号" id="stuNo">


                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                 <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="课程号"  id="cNo">

                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                 <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="最低成绩"  id="minGrade">

                                    <label class="sr-only" for="inlineFormInputName2">Name</label>
                                  <input type="text" class="form-control mb-2 mr-sm-2"  placeholder="最高成绩"  id="maxGrade">

                                  <button type="button" class="btn btn-primary mb-2" id="conditionQuerySheets">查询</button>
                    </form>
                `


        $('#myinfo thead').html(thStr)

        $("#search").html(search)
        $("#conditionQuerySheets").click((e) => {
            e.stopPropagation()
            conditionQuerySheets($("#stuNo").val(), $("#cNo").val(), $("#minGrade").val(), $("#maxGrade").val())
        })
        ope = `
                    <button id="addGrade">添加成绩</button>
                    <button id="deleteGrade">删除成绩</button>
                    <button id="updateGrade">修改成绩</button>
                `
        $("#operation").html(ope)
        $("#addGrade").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("添加")
            $("#modal-body").html(addGradeOpe)
            showOptions(contextPath + '/getMyCurriculums', '#chooseCNo', [
                'cNo'
            ])
            $("#chooseCNo").change((e) => {
                e.stopPropagation()
                showOptions(contextPath + '/selectCurriByClass?cNo=' + $("#chooseCNo").val(), '#chooseClass', ['className'])
            })
            $("#chooseClass").change((e) => {
                e.stopPropagation()
                showOptions(contextPath + '/selectStuByClass?className=' + $("#chooseClass").val(), "#chooseSno", ['stuNo'])
            })
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/addScore', {
                    stuNo: $("#chooseSno").val(),
                    cNo: $("#chooseCNo").val(),
                    grade: $("#grade").val()
                }, () => {
                    showAllInfos(contextPath + "/getScore", '#myInfo tbody', [
                        'stuNo', 'cNo', 'grade'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#deleteGrade").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("删除")
            $("#modal-body").html(deleteGradeOpe)
            showOptions(contextPath + '/getScore', '#delete-input-grade-stuNo', ['stuNo'])
            showOptions(contextPath + '/getScore', '#delete-input-grade-cNo', ['cNo'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/deleteGrade', {
                    stuNo: $("#delete-input-grade-stuNo").val(),
                    cNo: $("#delete-input-grade-cNo").val()
                }, () => {
                    showAllInfos(contextPath + "/getScore", '#myInfo tbody', [
                        'stuNo', 'cNo', 'grade'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        $("#updateGrade").click((e) => {
            e.stopImmediatePropagation();
            $("#modal-title").html("更新")
            $("#modal-body").html(updateGradeOpe)
            showOptions(contextPath + '/getScore', '#add-input-grade-stuNo', ['stuNo'])
            showOptions(contextPath + '/getScore', '#add-input-grade-cNo', ['cNo'])
            $("#exampleModal").modal('show')
            $("#save").off("click")
            $("#save").on("click", () => {
                operation(contextPath + '/updateScore', {
                    stuNo: $("#add-input-grade-stuNo").val(),
                    cNo: $("#add-input-grade-cNo").val(),
                    grade: $("#add-input-grade-score").val(),
                }, () => {
                    showAllInfos(contextPath + "/getScore", '#myInfo tbody', [
                        'stuNo', 'cNo', 'grade'
                    ])
                })
                $("#exampleModal").modal('hide')
            })
        })
        showAllInfos(contextPath + "/getScore", '#myInfo tbody', [
            'stuNo', 'cNo', 'grade'
        ])
    })
</script>
</html>

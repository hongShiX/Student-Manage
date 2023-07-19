let thStr = ''
let tbStr = ''
let search = ''
let ope = ''
let addUserOpe = `
  <div class="form-group">
    <label for="formGroupExampleInput">用户名</label>
    <input type="text" class="form-control" id="username" placeholder="用户名">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">密码</label>
    <input type="text" class="form-control" id="password" placeholder="密码">
  </div>
  <div class="form-group">
      <label for="inputState">用户类型</label>
      <select id="userType" class="form-control">
        <option>学生</option>
        <option>教师</option>
        <option>管理员</option>
      </select>
    </div>
`
let deleteUserOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">用户名</label>
        <select class="form-control" id="username">
           
        </select>
    </div>
`
let updateUserOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">用户名</label>
        <select class="form-control" id="username">
           
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">密码</label>
        <input type="text" class="form-control" id="password" placeholder="用户名">
    </div>
    <div class="form-group">
      <label for="inputState">用户类型</label>
      <select id="userType" class="form-control">
        <option>学生</option>
        <option>教师</option>
        <option>管理员</option>
      </select>
    </div>
`

let addStuOpe = `
    <div class="form-group">
    <label for="formGroupExampleInput">学号</label>
    <input type="text" class="form-control" id="input-stu-no" placeholder="学号">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">姓名</label>
    <input type="text" class="form-control" id="input-stu-name" placeholder="姓名">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">性别</label>
    <input type="text" class="form-control" id="stu-gender" placeholder="性别">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">生日</label>
    <input type="date" class="form-control" id="stu-birth" placeholder="生日">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">专业</label>
    <input type="text" class="form-control" id="stu-major" placeholder="专业">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">班级</label>
    <select class="form-control" id="stu-class">
        
    </select>
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">籍贯</label>
    <input type="text" class="form-control" id="stu-area" placeholder="籍贯">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">电话</label>
    <input type="text" class="form-control" id="stu-tele" placeholder="电话">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">备注</label>
    <input type="text" class="form-control" id="stu-ps" placeholder="备注">
  </div>
`
let deleteStuOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">学号</label>
        <select id="delete-input-stu-no" class="form-control">
            
        </select>    
    </div>
`
let updateStuOpe =  `
    <div class="form-group">
    <label for="formGroupExampleInput">学号</label>
    <select id="input-stu-no" class="form-control">
        
    </select>
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">姓名</label>
    <input type="text" class="form-control" id="input-stu-name" placeholder="姓名">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">性别</label>
    <input type="text" class="form-control" id="stu-gender" placeholder="性别">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">生日</label>
    <input type="date" class="form-control" id="stu-birth" placeholder="生日">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">专业</label>
    <input type="text" class="form-control" id="stu-major" placeholder="专业">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">班级</label>
    <select class="form-control" id="stu-class">
        
    </select>
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">籍贯</label>
    <input type="text" class="form-control" id="stu-area" placeholder="籍贯">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">电话</label>
    <input type="text" class="form-control" id="stu-tele" placeholder="电话">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">备注</label>
    <input type="text" class="form-control" id="stu-ps" placeholder="备注">
  </div>
`

let addClassOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">班级名</label>
        <input type="text" class="form-control" id="add-input-class-name">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">专业</label>
        <input type="text" class="form-control" id="add-input-class-major">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">班级人数</label>
        <input type="text" class="form-control" id="add-input-class-num">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">入学年份</label>
        <input type="date" class="form-control" id="add-input-class-start">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">辅导员</label>
        <input type="text" class="form-control" id="add-input-class-counsellor">
    </div>
`
let deleteClassOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">班级名</label>
        <select class="form-control" id="delete-input-class-name">
            
        </select>
    </div>
`
let updateClassOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">班级名</label>
        <select class="form-control" id="add-input-class-name">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">专业</label>
        <input type="text" class="form-control" id="add-input-class-major">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">班级人数</label>
        <input type="text" class="form-control" id="add-input-class-num">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">入学年份</label>
        <input type="date" class="form-control" id="add-input-class-start">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">辅导员</label>
        <input type="text" class="form-control" id="add-input-class-counsellor">
    </div>
`

let addTeacherOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">id</label>
        <input type="text" class="form-control" id="add-input-teacher-id">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">姓名</label>
        <input type="text" class="form-control" id="add-input-teacher-name">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">性别</label>
        <input type="text" class="form-control" id="add-input-teacher-gender">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">生日</label>
        <input type="date" class="form-control" id="add-input-teacher-birth">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">学院</label>
        <input type="text" class="form-control" id="add-input-teacher-dept">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">电话</label>
        <input type="text" class="form-control" id="add-input-teacher-tele">
    </div>
`
let deleteTeacherOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">id</label>
        <select class="form-control" id="delete-input-teacher-id">
            
        </select>
    </div>
`
let updateTeacherOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">id</label>
        <select class="form-control" id="add-input-teacher-id">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">姓名</label>
        <input type="text" class="form-control" id="add-input-teacher-name">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">性别</label>
        <input type="text" class="form-control" id="add-input-teacher-gender">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">生日</label>
        <input type="date" class="form-control" id="add-input-teacher-birth">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">学院</label>
        <input type="text" class="form-control" id="add-input-teacher-dept">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">电话</label>
        <input type="text" class="form-control" id="add-input-teacher-tele">
    </div>
`

let addCourseOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">课程号</label>
        <input type="text" class="form-control" id="add-input-course-no">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">课程名</label>
        <input type="text" class="form-control" id="add-input-course-name">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">学时</label>
        <input type="number" class="form-control" id="add-input-course-hours">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">学分</label>
        <input type="number" class="form-control" id="add-input-course-score">
    </div>
`
let deleteCourseOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">课程号</label>
        <select class="form-control" id="delete-input-course-no"></select>
    </div>
`
let updateCourseOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">课程号</label>
        <select class="form-control" id="add-input-course-no">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">课程名</label>
        <input type="text" class="form-control" id="add-input-course-name">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">学时</label>
        <input type="number" class="form-control" id="add-input-course-hours">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">学分</label>
        <input type="number" class="form-control" id="add-input-course-score">
    </div>
`

let addGradeOpe = `
<!--    <div class="form-group">-->
<!--        <label for="formGroupExampleInput">学号</label>-->
<!--        <input type="text" class="form-control" id="add-input-grade-stuNo">-->
<!--    </div>-->
<!--    <div class="form-group">-->
<!--        <label for="formGroupExampleInput">课程号</label>-->
<!--        <input type="text" class="form-control" id="add-input-grade-cNo">-->
<!--    </div>-->
<!--    <div class="form-group">-->
<!--        <label for="formGroupExampleInput">分数</label>-->
<!--        <input type="number" class="form-control" id="add-input-grade-score">-->
<!--    </div>-->
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
`
let deleteGradeOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">学号</label>
        <select class="form-control" id="delete-input-grade-stuNo">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">课程号</label>
        <select class="form-control" id="delete-input-grade-cNo">
            
        </select>
    </div>
`
let updateGradeOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">学号</label>
        <select class="form-control" id="add-input-grade-stuNo">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">课程号</label>
        <select class="form-control" id="add-input-grade-cNo">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">分数</label>
        <input type="number" class="form-control" id="add-input-grade-score">
    </div>
`

let addCuOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">id</label>
        <input type="text" class="form-control" id="add-input-cu-id">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">课程号</label>
        <select class="form-control" id="add-input-cu-cNo">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">班级名称</label>
        <select class="form-control" id="add-input-cu-class">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">老师</label>
        <select class="form-control" id="add-input-cu-teacher">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">上课时间</label>
        <input type="date" class="form-control" id="add-input-cu-teach-time">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">上课地点</label>
        <input type="text" class="form-control" id="add-input-cu-teach-place">
    </div>
`
let deleteCuOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">id</label>
        <select class="form-control" id="delete-input-cu-id">
            
        </select>
    </div>
`
let updateCuOpe = `
    <div class="form-group">
        <label for="formGroupExampleInput">id</label>
        <select class="form-control" id="add-input-cu-id">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">课程号</label>
        <select class="form-control" id="add-input-cu-cNo">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">班级名称</label>
        <select class="form-control" id="add-input-cu-class">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">老师</label>
        <select class="form-control" id="add-input-cu-teacher">
            
        </select>
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">上课时间</label>
        <input type="date" class="form-control" id="add-input-cu-teach-time">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">上课地点</label>
        <input type="text" class="form-control" id="add-input-cu-teach-place">
    </div>
`

// 按条件（课程号、课程名，教师，时间）查询课程表信息
function conditionQueryCurriculum(cNo, cName, teacher, teachTime) {
    $.ajax({
        url: contextPath + "/conditionQueryCurriculum",
        type: 'post',
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify({
            cNo: parseInt(cNo),
            cName: cName,
            teacher: teacher,
            teachTime: teachTime
        }),
        success: (result) => {
            console.log(result)
            let json = $.parseJSON(result)

            tbStr = ''
            for (let i = 0; i < json.length; i++) {
                tbStr += '<tr>'
                tbStr += '<td>' + (i + 1) + '</td>'
                tbStr += '<td>' + json[i]['id'] + '</td>'
                tbStr += '<td>' + json[i]['cNo'] + '</td>'
                tbStr += '<td>' + json[i]['className'] + '</td>'
                tbStr += '<td>' + json[i]['teacher'] + '</td>'
                tbStr += '<td>' + json[i]['teachTime'] + '</td>'
                tbStr += '<td>' + json[i]['teachPlace'] + '</td>'
                tbStr += '</tr>'
            }

            $('#myInfo tbody').html(tbStr)
        }
    })
}

// 按条件（学号，课程号, 成绩区间）查询成绩信息
function conditionQuerySheets(stuNo, cNo, minGrade, maxGrade) {
    $.ajax({
        url: contextPath + "/conditionQuerySheets",
        type: 'post',
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify({
            stuNo: parseInt(stuNo),
            cNo: parseInt(cNo),
            minGrade: parseFloat(minGrade),
            maxGrade: parseFloat(maxGrade)
        }),
        success: (result) => {
            console.log(result)
            let json = $.parseJSON(result)

            tbStr = ''
            for (let i = 0; i < json.length; i++) {
                tbStr += '<tr>'
                tbStr += '<td>' + (i + 1) + '</td>'
                tbStr += '<td>' + json[i]['stuNo'] + '</td>'
                tbStr += '<td>' + json[i]['cNo'] + '</td>'
                tbStr += '<td>' + json[i]['grade'] + '</td>'
                tbStr += '</tr>'
            }

            $('#myInfo tbody').html(tbStr)
        }
    })
}

// 按条件（学号，姓名）查询基本信息
function conditionQuery(no, name) {
    $.ajax({
        url: contextPath + "/conditionQuery?stuNo=" + no + "&stuName=" + name,
        method: 'get',
        success: (result) => {
            let json = $.parseJSON(result)

            tbStr = ''
            for (let i = 0; i < json.length; i++) {
                tbStr += '<tr>'
                tbStr += '<td>' + (i + 1) + '</td>'
                tbStr += '<td>' + json[i]['stuNo'] + '</td>'
                tbStr += '<td>' + json[i]['stuName'] + '</td>'
                tbStr += '<td>' + json[i]['stuGender'] + '</td>'
                tbStr += '<td>' + json[i]['stuBirth'] + '</td>'
                tbStr += '<td>' + json[i]['stuMajor'] + '</td>'
                tbStr += '<td>' + json[i]['stuClass'] + '</td>'
                tbStr += '<td>' + json[i]['stuArea'] + '</td>'
                tbStr += '<td>' + json[i]['stuTele'] + '</td>'
                tbStr += '<td>' + json[i]['stuPs'] + '</td>'
                tbStr += '</tr>'
            }

            $('#myInfo tbody').html(tbStr)
        }
    });
}

// 按条件（班级名，专业, 入学年份）查询班级信息
function conditionQueryClazz(name, major, start) {
    $.ajax({
        url: contextPath + "/conditionQueryClazz",
        type: 'post',
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify({
            name: name,
            major: major,
            start: start
        }),
        success: (result) => {
            console.log(result)
            let json = $.parseJSON(result)

            tbStr = ''
            for (let i = 0; i < json.length; i++) {
                tbStr += '<tr>'
                tbStr += '<td>' + (i + 1) + '</td>'
                tbStr += '<td>' + json[i]['name'] + '</td>'
                tbStr += '<td>' + json[i]['major'] + '</td>'
                tbStr += '<td>' + json[i]['number'] + '</td>'
                tbStr += '<td>' + json[i]['start'] + '</td>'
                tbStr += '<td>' + json[i]['counsellor'] + '</td>'
                tbStr += '</tr>'
            }

            $('#myInfo tbody').html(tbStr)
        }
    })
}

function conditionQueryTeacherInfo(id, name, dept) {
    $.ajax({
        url: contextPath + "/conditionQueryTeacherInfo",
        type: 'post',
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify({
            id: id,
            name: name,
            dept: dept
        }),
        success: (result) => {
            console.log(result)
            let json = $.parseJSON(result)

            tbStr = ''
            for (let i = 0; i < json.length; i++) {
                tbStr += '<tr>'
                tbStr += '<td>' + (i + 1) + '</td>'
                tbStr += '<td>' + json[i]['id'] + '</td>'
                tbStr += '<td>' + json[i]['name'] + '</td>'
                tbStr += '<td>' + json[i]['gender'] + '</td>'
                tbStr += '<td>' + json[i]['birth'] + '</td>'
                tbStr += '<td>' + json[i]['dept'] + '</td>'
                tbStr += '<td>' + json[i]['tele'] + '</td>'
                tbStr += '</tr>'
            }

            $('#myInfo tbody').html(tbStr)
        }
    })
}

// 按条件(课程号，课程名)查询课程信息
function conditionQueryCourses(cNo, cName) {
    $.ajax({
        url: contextPath + "/conditionQueryCourses",
        type: 'post',
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify({
            cNo: cNo,
            cName: cName
        }),
        success: (result) => {
            console.log(result)
            let json = $.parseJSON(result)

            tbStr = ''
            for (let i = 0; i < json.length; i++) {
                tbStr += '<tr>'
                tbStr += '<td>' + (i + 1) + '</td>'
                tbStr += '<td>' + json[i]['cNo'] + '</td>'
                tbStr += '<td>' + json[i]['cName'] + '</td>'
                tbStr += '<td>' + json[i]['cHours'] + '</td>'
                tbStr += '<td>' + json[i]['cScore'] + '</td>'
                tbStr += '</tr>'
            }

            $('#myInfo tbody').html(tbStr)
        }
    })
}

// 增删改查
function operation(url, obj, callback) {
    $.ajax({
        url: url,
        type: 'post',
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify(obj),
        success(result) {
            if (result !== '0') {
                alert("操作成功")
                if (typeof callback === "function") {
                    callback()
                }
            } else {
                alert("操作失败")
            }
        },
        error() {
            alert("操作失败")
        }
    })
}

// 显示信息在表格中（显示多个json的信息）
function showAllInfos(url, selector, fields) {
    $.ajax({
        url: url,
        method: "get",
        success: (res) => {
            let json = $.parseJSON(res)
            let tbStr = ''
            $.each(json, function (index, value) {
                tbStr += '<tr>'
                tbStr += '<td>' + (index + 1) + '</td>'
                let i = 0
                $.each(value, function () {
                    tbStr += '<td>' + value[fields[i++]] + '</td>'
                })
                tbStr += '</tr>'
            })
            $(selector).html(tbStr)
        }
    });
}

// 显示单个json的信息在表格中
function showSelfInfo(url, selector, fields) {
    $.ajax({
        url: url,
        method: 'get',
        success: (res) => {
            let json = $.parseJSON(res)
            let tbStr = ''
            tbStr += '<tr>'
            tbStr += '<td>1</td>'
            let i = 0
            $.each(json, function () {
                tbStr += '<td>' + json[fields[i++]] + '</td>'
            })
            tbStr += '</tr>'
            $(selector).html(tbStr)
        },

        error(res) {
            console.log(res)
        }
    })
}

// 显示多个json的选项
function showOptions(url, selector, fields) {
    $.ajax({
        url: url,
        method: "get",
        success: (res) => {
            let json = $.parseJSON(res)
            let option = ''
            $.each(json, function (index, value) {
                for (let i = 0; i < fields.length; i++) {
                    option += '<option>' + value[fields[i]] + '</option>'
                }
            })
            $(selector).html(option)
        }
    });
}


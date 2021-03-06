<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>北京市公安局法医鉴定案件受理系统</title>
    <%@ include file="../linkCss.jsp" %>
    <style>
        .manual {
            width: 25px;
            height: 25px;
            display: inline-block;
            line-height: 25px;
            text-align: center;
            background: #ff5a56;
            color: #fff;
            border-radius: 50%;
            font-weight: 600;
        }

        .automatic {
            width: 25px;
            height: 25px;
            display: inline-block;
            line-height: 25px;
            text-align: center;
            background: #fda228;
            color: #fff;
            border-radius: 50%;
            font-weight: 600;
            float: left;
        }

        .tested {
            width: 25px;
            height: 25px;
            display: inline-block;
            line-height: 25px;
            text-align: center;
            background: #50c987;
            color: #fff;
            border-radius: 50%;
            font-weight: 600;
            float: left;
        }

        .test {
            width: 25px;
            height: 25px;
            display: block;
            line-height: 18px;
            text-align: center;
            background: #e4e4e4;
            color: #fff;
            border-radius: 50%;
            font-weight: 600;
        }

        td:nth-last-child(1) a {
            display: inline-block;
            width: 70px;
            color: #ff6561;
        }

        td a:hover::before {
            content: "进入实验";
        }

        td .fa-check-circle {
            color: #50c987;
            width: 30px;
            height: 25px;
            line-height: 25px;
            text-align: center;
            font-size: 25px;
            margin-left: 10px;
        }

        td .fa-check-circle::before {
            display: inline-block;
            width: 30px;
            height: 25px;
            line-height: 25px;
            text-align: center;
            font-size: 29px;
        }

        td .fa-check-circle:hover::before {
            content: "查看";
            font-size: 14px;
        }

        .first {
            display: inline-block;
            background: #0c81f5;
            color: #fff;
            width: 20px;
            text-align: center;
            height: 20px;
            line-height: 20px;
        }

        .again {
            display: inline-block;
            background: #fda228;
            color: #fff;
            width: 20px;
            text-align: center;
            height: 20px;
            line-height: 20px;
        }
        #myModal .modal-body{
            text-align: center;
            padding: 50px 30px;
        }
        #myModal .modal-body a+a{
            margin-left: 20px;
        }
    </style>
</head>

<body>
<div class="row Modular">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading blue">
                <div>查询条件</div>
            </div>
            <div class="panel-body">
                <form id="consignationForm" action="<%=path%>/supplies/consumeName" class="form-horizontal tasi-form" method="post">
                    <div class="row">
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>编号</label>
                                <input type="text" name="suppliesNo" value="${query.suppliesNo}"
                                       class="form-control" placeholder="请输入条码号">
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>名称</label>
                                <input type="text" class="form-control" placeholder="请输入出库名称" name="suppliesName"
                                       value="${query.suppliesName}">
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>型号</label>
                                <input type="text" class="form-control" placeholder="请输入出库名称" name="suppliesModel"
                                       value="${query.suppliesModel}">
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>实验阶段</label>
                                <select class="form-control " name="experimentalStage">
                                    <option value="">请选择</option>
                                    <c:forEach items="${sampleTypeList}" var="list">
                                        <option value="${list.dictCode}"
                                                <c:if test="${list.dictCode eq query.experimentalStage}">selected</c:if>>
                                                ${list.dictName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group seachButtonBox">
                                <button class="btn btn-blue" name="queryBtn" type="submit" id="addInformant">查询</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row Modular ">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading yellow">
                <div>耗材列表</div>
                <button class="btn btn-yellow pull-right" style="font-weight: 600;margin-top: -7px; margin-right: 15px;"
                        data-toggle="modal" data-target="#myModal">添加
                </button>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-bordered bigTable">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>编号</th>
                        <th>名称</th>
                        <th>实验阶段</th>
                        <th>品牌</th>
                        <th>型号</th>
                        <th>价格</th>
                        <th>厂商</th>
                        <th>所属单位</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${suppliesInfoList}" var="infolist" varStatus="s">
                        <tr>
                            <td>${s.index+1}</td>
                            <td>${infolist.suppliesNo}
                                <input type="hidden" name="suppliesNo"
                                       value="${infolist.suppliesNo}"></td>
                            <td>${infolist.suppliesName}
                                <input type="hidden" name="suppliesName"
                                       value="${infolist.suppliesName}"></td>
                            <td>
                                <c:forEach items="${sampleTypeList}" var="list">
                                    <c:if test="${infolist.experimentalStage eq list.dictCode}">${list.dictName}
                                        <input type="hidden" name="experimentalStage" value="${list.dictCode}">
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>${infolist.suppliesBrand}
                                <input type="hidden" name="suppliesBrand"
                                       value="${infolist.suppliesBrand}"></td>
                            <td>${infolist.suppliesModel}
                                <input type="hidden" name="suppliesModel"
                                       value="${infolist.suppliesModel}"></td>
                            <td>${infolist.suppliesPrice}
                                <input type="hidden" name="suppliesPrice"
                                       value="${infolist.suppliesPrice}"></td>
                            <td>${infolist.suppliesFirm}
                                <input type="hidden" name="suppliesFirm"
                                       value="${infolist.suppliesFirm}"></td>
                            <td>
                                <c:forEach items="${orgInfo}" var="list">
                                    <c:if test="${list.orgId eq infolist.orgId}">${list.orgName}</c:if>
                                </c:forEach>
                                <input type="hidden" name="orgId"
                                       value="${infolist.orgId}"></td>
                            <td>
                                <input type="hidden" name="infoid" id="infoid" value="${infolist.id}"/>
                                <button type="button" name="editBtn" data-toggle="modal" data-target="#myModal"
                                        class="btn-icon btn-icon-blue btn-icon-bianji-blue">编辑</button>
                            </td>
                            <input type="hidden" name="remark" value="${infolist.remark}">
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row" style="padding: 0px">
                    <div class="col-md-12">
                        <div id="kkpager"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade popBox" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">耗材信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>实验阶段</label>
                            <select class="form-control " id="experimentalStage" name="experimentalStage">
                                <option>请选择</option>
                                <c:forEach items="${sampleTypeList}" var="list">
                                    <option value="${list.dictCode}">${list.dictName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>名称</label>
                            <input type="text" class="form-control" placeholder="请输入名称" id="suppliesName" name="suppliesName">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>编号</label>
                            <input type="text" class="form-control" placeholder="请输入编号" id="suppliesNo" name="suppliesNo">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>品牌</label>
                            <input type="text" class="form-control" placeholder="请输入品牌" id="suppliesBrand" name="suppliesBrand" >
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>型号</label>
                            <input type="text" class="form-control" placeholder="请输入型号" id="suppliesModel" name="suppliesModel" >
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>价格</label>
                            <input type="text" class="form-control" placeholder="请输入价格" id="suppliesPrice" name="suppliesPrice">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>厂商</label>
                            <input type="text" class="form-control" placeholder="请输入厂商" id="suppliesFirm" name="suppliesFirm">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>描述</label>
                            <input type="text" class="form-control" placeholder="请输入描述" id="remark" name="remark">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-blue btn-lang" id="saveBtn">保存</button>
                    <button class="btn btn-blue-border btn-lang" type="button" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../linkJs.jsp" %>
<script>
    $(function () {

        $("#addInformant").on("click", function () {
            $("#page").val(1);
            $('#consignationForm').submit();
        });

        $('.form_datetime').datetimepicker({
            format: 'yyyy-mm-dd',
            language: 'zh',
            weekStart: 1,
            todayBtn: 1,
            minView: "month",
            autoclose: true,
            todayHighlight: true,
            forceParse: 0,
            showMeridian: 1
        }).on('changeDate', function (ev) {
            $(this).datetimepicker('hide');
        });


        //添加修改
        $('#saveBtn').on("click", function (){
            saveForm();

        })

        function saveForm(){
            $.ajax({
                url: "<%=path%>/supplies/addconsume",
                type: "post",
                data: JSON.stringify(param()),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.success || data.success == true || data.success == "true") {
                        location.href = "<%=path%>/supplies/consumeName";
                    } else {
                        alert("保存失败！");
                    }
                },
                error: function (e) {
                    alert("操作失败！");
                    <%--location.href = "<%=path%>/center/refreshReagentName";--%>
                }
            })
        }
        //定义一个对象
        var reagent = {};
        //赋值
        function param() {
            reagent.experimentalStage = $("#experimentalStage").val();
            reagent.suppliesName = $("#suppliesName").val();
            reagent.suppliesNo = $("#suppliesNo").val();
            reagent.suppliesModel = $("#suppliesModel").val();
            reagent.suppliesPrice = $("#suppliesPrice").val();
            reagent.suppliesFirm = $("#suppliesFirm").val();
            reagent.remark = $("#remark").val();
            reagent.suppliesBrand = $("#suppliesBrand").val();
            return reagent;
        }
        //模态框关闭清空
        $('#myModal').on('hidden.bs.modal', function (e) {
            $(this).find("input[type='text']").val("");
            $("#experimentalStage").val("请选择");
            reagent.id = null;
            $('input[type=radio][name="reagentType"]:checked').prop("checked", false);
        })

        //编辑回显
        $("button[name='editBtn']").click(function(){
            //获取id
            reagent.id = $(this).parents("tr").find("input[name='infoid']").val();
            $('#myModal').find("input[name='suppliesNo']").val($(this).parents("tr").find("input[name='suppliesNo']").val());
            $('#myModal').find("input[name='suppliesName']").val($(this).parents("tr").find("input[name='suppliesName']").val());
            $('#myModal').find("input[name='suppliesModel']").val($(this).parents("tr").find("input[name='suppliesModel']").val());
            $('#myModal').find("input[name='suppliesPrice']").val($(this).parents("tr").find("input[name='suppliesPrice']").val());
            $('#myModal').find("input[name='suppliesFirm']").val($(this).parents("tr").find("input[name='suppliesFirm']").val());
            $('#myModal').find("input[name='remark']").val($(this).parents("tr").find("input[name='remark']").val());
            $('#myModal').find("input[name='suppliesBrand']").val($(this).parents("tr").find("input[name='suppliesBrand']").val());
            //下拉框回显
            $("#experimentalStage").val($(this).parents('tr').find("input[name='experimentalStage']").val());
        })

    })
</script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include.jsp" %>
<%
    String path = request.getContextPath();
%>
<%--
Created by IntelliJ IDEA.
User: Dell
Date: 2018/12/19
Time: 18:32
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>入国家库监控</title>
    <%@ include file="../linkCss.jsp" %>
    <style>
        .table .successBox {
            color: #38bca8;
            font: normal normal normal 14px FontAwesome;
            font-size: inherit;
            text-rendering: auto;
            -webkit-font-smoothing: antialiased;
        }

        .table .successBox::before {
            content: "\f058";
            color: #50c987;
            float: left;
            margin-right: 5px;
            font-size: 20px;
        }

        .table .errorBox {
            color: #fe7371;
            font: normal normal normal 14px FontAwesome;
            font-size: inherit;
            text-rendering: auto;
            -webkit-font-smoothing: antialiased;
            cursor: pointer;
        }

        .table .errorBox::before {
            content: "\f057";
            color: #ff5a56;
            float: left;
            margin-right: 5px;
            font-size: 20px;
        }

        .popover {
            top: 420px !important;
            left: 860px !important;
        }

        .popover-title {
            background: #fff;
            border: none;
            padding-top: 20px;
            padding-left: 40px;
            padding-right: 40px;

        }

        .popover-title::before {
            content: "";
            width: 12px;
            height: 12px;
            background: #3d9af7;
            float: left;
            border-radius: 50%;
            margin-left: -20px;
        }

        .popover-content {
            padding: 0 40px;
            padding-bottom: 20px;
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
                <form id="stateStorageForm" action="<%=path%>/statistics/caseStatistics" class="form-horizontal tasi-form"
                      method="post">
                    <div class="row">
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>受理人</label>
                                <div class="select">
                                    <select id="acceptorId" name="acceptorId" value="${query.acceptorId}"
                                            class="form-control">
                                        <option value="" selected>全部</option>
                                        <c:forEach items="${amPersonalInfoVoList}" var="list" varStatus="cs">
                                            <option value="${list.entity.personalId}"
                                                    <c:if test="${list.entity.personalId eq query.acceptorId}">selected</c:if>>${list.entity.fullName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>受理时间</label>
                                <div class="row">
                                    <div class="col-md-5 nopadding">
                                        <input type="text" id="acceptStartDatetime" name="acceptStartDatetime"
                                               class="form-control form_datetime"
                                               value="<fmt:formatDate value='${query.acceptStartDatetime}' pattern='yyyy-MM-dd'/>"
                                               placeholder="请选择受理时间"
                                               readonly="readonly">
                                    </div>
                                    <div class="col-md-2" style="margin-top: 7px;">至</div>
                                    <div class="col-md-5 nopadding">
                                        <input type="text" id="acceptEndDatetime" name="acceptEndDatetime"
                                               class="form-control form_datetime"
                                               value="<fmt:formatDate value='${query.acceptEndDatetime}' pattern='yyyy-MM-dd'/>"
                                               placeholder="请选择受理时间"
                                               readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>案件性质</label>
                                <div class="select">
                                    <select  name="entity.caseProperty" value="${query.entity.caseProperty}"
                                            class="form-control">
                                        <option value="" selected>全部</option>
                                        <c:forEach items="${dictItemList}" var="caseProperty" varStatus="cs">
                                            <option value="${caseProperty.dictCode}"
                                                    <c:if test="${caseProperty.dictCode eq query.entity.caseProperty}">selected</c:if>>${caseProperty.dictName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 seachInputBox">
                            <div class="form-group seachButtonBox">
                                <button class="btn btn-blue" type="submit" id="addStsteStorage">统计</button>
                                <a href="<%=path%>/statistics/caseStatistics" class="btn btn-blue-border reset" target="ifm" style="margin-left: 15px;">重置</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row Modular">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading yellow">
                <div>样本列表</div>
            </div>
            <div class="panel-body nopadding">
                <table class="table table-hover table-bordered bigTable">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>受理人</th>
                        <th>首检案件受理数</th>
                        <th>补送案件受理数</th>
                        <th>已入库案件数</th>
                        <th>有比中案件数</th>
                        <th>受理检材数</th>
                        <th>检出检材数</th>
                        <th>已入库检材数</th>
                        <th>有比中检材数</th>
                    </tr>
                    </thead>
                    <tbody id="caseInfoListTbody">

                    <c:forEach items="${CaseStatisticsList}" var="list" varStatus="s">
                        <tr>
                            <td>${s.index+1}</td>
                            <td>${list.name}</td>
                            <td>${list.caseCount}</td>
                            <td>${list.complement}</td>
                            <td>${list.instoredCase}</td>
                            <td>${list.mathCount}</td>
                            <td>${list.acceptCount}</td>
                            <td>${list.auditCount}</td>
                            <td>${list.instoredSampl}</td>
                            <td>${list.sampleCount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="../linkJs.jsp" %>
<script>
    $(function () {
        var td2=0;
        var td3=0;
        var td4=0;
        var td5=0;
        var td6=0;
        var td7=0;
        var td8=0;
        var td9=0;
        var allhtml="";
        $("#caseInfoListTbody tr").each(function(){
            td2 +=  parseInt($(this).find("td:eq(2)").html());
            td3 +=  parseInt($(this).find("td:eq(3)").html());
            td4 +=  parseInt($(this).find("td:eq(4)").html());
            td5 +=  parseInt($(this).find("td:eq(5)").html());
            td6 +=  parseInt($(this).find("td:eq(6)").html());
            td7 +=  parseInt($(this).find("td:eq(7)").html());
            td8 +=  parseInt($(this).find("td:eq(8)").html());
            td9 +=  parseInt($(this).find("td:eq(9)").html());
        })
        allhtml="<tr><td>合计<td><td>"+td2+"</td><td>"+td3+"</td><td>"+td4+"</td><td>"+td5+"</td><td>"+td6+"</td><td>"+td7+"</td><td>"+td8+"</td><td>"+td9+"</td></tr>";
        $("#caseInfoListTbody").append(allhtml);


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

        $("#addStsteStorage").on("click", function () {
            $("#page").val(1);
            $('#stateStorageForm').submit();
        });




        $('.errorBox').popover({
            trigger: "hover",
            placement: 'bottom'
        })
        //全选
        $("input[name='checkAll']").change(function () {
            if ($(this).is(":checked")) {
                $("tbody").find("input[type='checkbox']").prop("checked", true)
            } else {
                $("tbody").find("input[type='checkbox']").prop("checked", false)
            }
        })
        $("tbody").find("input[type='checkbox']").change(function () {
            if ($("tbody").find("input[type='checkbox']").length == $("tbody").find("input[type='checkbox']:checked").length) {
                $("input[name='checkAll']").prop("checked", true)
            } else {
                $("input[name='checkAll']").prop("checked", false)
            }
        })
    })
</script>
</body>

</html>
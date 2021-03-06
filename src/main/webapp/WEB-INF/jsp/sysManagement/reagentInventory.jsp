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
                <form id="consignationForm" action="<%=path%>/center/querytInventoryName" class="form-horizontal tasi-form" method="post">
                    <div class="row">
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>编号</label>
                                <input type="text" name="reagentNo" value="${query.reagentNo}"
                                       class="form-control" placeholder="请输入编号">
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>名称</label>
                                <input type="text" class="form-control" placeholder="请输入名称" name="reagentName"
                                       value="${query.reagentName}">
                            </div>
                        </div>
                        <%--<div class="col-md-4 seachInputBox">--%>
                            <%--<div class="form-group">--%>
                                <%--<label></label>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="checkbox-inline">--%>
                                        <%--<input id="reagentFlag" name="reagentType" type="radio" value="1" <c:if test="${query.reagentType eq '1'}">checked</c:if>/>试剂--%>
                                    <%--</label>--%>
                                    <%--<label class="checkbox-inline">--%>
                                        <%--<input id="exclusiveFlag" name="reagentType" type="radio" value="2" <c:if test="${query.reagentType eq '2'}">checked</c:if> />耗材--%>
                                    <%--</label>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>型号</label>
                                <input type="text" class="form-control" placeholder="请输入型号" name="reagentModel"
                                       value="${query.reagentModel}">
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
                                <%--<input type="hidden" name="page" id="page" value="${pageInfo.page}"/>--%>
                                <button class="btn btn-blue" id="queryBtn" type="submit" id="addInformant">查询</button>
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
                <div>试剂列表</div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-bordered bigTable">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>编号</th>
                        <%--<th>类型</th>--%>
                        <th>名称</th>
                        <th>实验阶段</th>
                        <th>品牌</th>
                        <th>型号</th>
                        <th>价格</th>
                        <th>厂商</th>
                        <th>库存</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${reagentInfoList}" var="infolist" varStatus="s">
                        <tr>
                            <td>${s.index+1}</td>
                            <td>${infolist.reagentNo}
                                <input type="hidden" name="reagentNo"
                                       value="${infolist.reagentNo}"></td>
                            <%--<td>--%>
                                <%--<c:if test="${infolist.reagentType eq '1'}">试剂</c:if>--%>
                                <%--<c:if test="${infolist.reagentType eq '2'}">耗材</c:if>--%>
                                <%--<input type="hidden" name="reagentType"--%>
                                       <%--value="${infolist.reagentType}"></td>--%>
                            <td>${infolist.reagentName}
                                <input type="hidden" name="reagentName"
                                       value="${infolist.reagentName}"></td>
                            <td><c:forEach items="${sampleTypeList}" var="list">
                                <c:if test="${infolist.experimentalStage eq list.dictCode}">${list.dictName}
                                    <input type="hidden" name="experimentalStage" value="${list.dictCode}">
                                </c:if>
                            </c:forEach>
                            </td>
                            <td>${infolist.reagentBrand}
                                <input type="hidden" name="reagentBrand"
                                       value="${infolist.reagentBrand}"></td>
                            <td>${infolist.reagentModel}
                                <input type="hidden" name="reagentModel"
                                       value="${infolist.reagentModel}"></td>
                            <td>${infolist.reagentPrice}
                                <input type="hidden" name="reagentPrice"
                                       value="${infolist.reagentPrice}"></td>
                            <td>${infolist.reagentFirm}
                                <input type="hidden" name="reagentFirm"
                                       value="${infolist.reagentFirm}"></td>
                            <td>${infolist.storageNum}
                                <input type="hidden" name="storageNum"
                                       value="${infolist.storageNum}"></td>
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

<%@ include file="../linkJs.jsp" %>
<script>
    $(function () {

        $("#addInformant").on("click", function () {
            $("#page").val(1);
            $('#consignationForm').submit();
        });

        /*kkpager.generPageHtml({
            pno: ${pageInfo.page},
            //总页码
            total: ${pageInfo.pageCount},
            //总数据条数
            totalRecords: ${pageInfo.allRecordCount},
            //链接前部
            hrefFormer: '<%=path%>/center/testProcess',
            //链接尾部
            //hrefLatter: '.html',
            getLink: function (page) {
                return this.hrefFormer + this.hrefLatter + "?" + "page=" + page + "&" + $("#consignationForm").serialize();
            }
            , lang: {
                firstPageText: '首页',
                firstPageTipText: '首页',
                lastPageText: '尾页',
                lastPageTipText: '尾页',
                prePageText: '上一页',
                prePageTipText: '上一页',
                nextPageText: '下一页',
                nextPageTipText: '下一页',
                totalPageBeforeText: '共',
                totalPageAfterText: '页',
                currPageBeforeText: '当前第',
                currPageAfterText: '页',
                totalInfoSplitStr: '/',
                totalRecordsBeforeText: '共',
                totalRecordsAfterText: '条数据',
                gopageBeforeText: '&nbsp;转到',
                gopageButtonOkText: '确定',
                gopageAfterText: '页',
                buttonTipBeforeText: '第',
                buttonTipAfterText: '页'
            }
        });*/


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

    })
</script>
</body>
</html>

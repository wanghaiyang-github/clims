<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>北京市公安局法医鉴定案件受理系统</title>
    <%@ include file="../linkCss.jsp" %>
    <style>
        .btn-red:hover {
            width: 100%;
        }

        #videoBox a {
            padding-top: 10px;
            padding-bottom: 10px
        }

        #videoBox button {
            padding: 10px 26px;
        }

        .bu {
            background: #fddddb;
            color: #fc5a56;
            padding: 5px;
            border-radius: 50%;
            font-size: 10px;
            font-weight: 600;
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
                <form id="consignationForm" action="<%=path %>/center/caseOffManage" class="form-horizontal tasi-form"
                      method="post">
                    <div class="row">
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>案件名称</label>
                                <input type="text" id="caseName" name="entity.caseName" value="${query.entity.caseName}"
                                       class="form-control"
                                       placeholder="请输入案件名称">
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>案件性质</label>
                                <div class="select">
                                    <select id="caseProperty" name="entity.caseProperty"
                                            value="${query.entity.caseProperty}" class="form-control">
                                        <option value="">全部</option>
                                        <c:forEach items="${casePropertyList}" var="list" varStatus="cs">
                                            <option value="${list.dictCode}"
                                                    <c:if test="${list.dictCode eq query.entity.caseProperty}">selected</c:if>>${list.dictName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>案件状态</label>
                                <div class="select">
                                    <select id="status" name="status" value="${query.status}"
                                            class="form-control">
                                        <option value="" selected>全部</option>
                                        <c:forEach items="${caseStatusList}" var="list" varStatus="cs">
                                            <option value="${list.dictCode}"
                                                    <c:if test="${list.dictCode eq query.status}">selected</c:if>>${list.dictName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>委托单位</label>
                                <div class="select">
                                    <select id="delegateOrgCode" name="delegateOrgCode" value="${query.delegateOrgCode}"
                                            class="form-control">
                                        <option value="">全部</option>
                                        <c:forEach items="${orgInfoList}" var="list" varStatus="cs">
                                            <option value="${list.orgCode}"
                                                    <c:if test="${list.orgCode eq query.delegateOrgCode}">selected</c:if>>${list.orgName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>委托时间</label>
                                <div class="row">
                                    <div class="col-md-5 nopadding">
                                        <input type="text" id="delegateStartDatetime" name="delegateStartDatetime"
                                               class="form-control form_datetime"
                                               value="<fmt:formatDate value='${query.delegateStartDatetime}' pattern='yyyy-MM-dd'/>"
                                               placeholder="请选择委托时间"
                                               readonly="readonly">
                                    </div>
                                    <div class="col-md-2" style="margin-top: 7px;">至</div>
                                    <div class="col-md-5 nopadding">
                                        <input type="text" id="delegateEndDatetime" name="delegateEndDatetime"
                                               class="form-control form_datetime"
                                               value="<fmt:formatDate value='${query.delegateEndDatetime}' pattern='yyyy-MM-dd'/>"
                                               placeholder="请选择委托时间"
                                               readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group">
                                <label>委托人</label>
                                <input type="text" id="delegator1Name" name="delegator1Name"
                                       value="${query.delegator1Name}" class="form-control" placeholder="请输入委托人">
                            </div>
                        </div>
                        <div class="col-md-4 seachInputBox">
                            <div class="form-group seachButtonBox">
                                <input type="hidden" name="page" id="page" value="${pageInfo.page}"/>
                                <button class="btn btn-blue" type="submit" id="addInformant">查询</button>
                                <a href="<%=path%>/center/caseOffManage" class="btn btn-blue-border reset" target="ifm" style="margin-left: 15px;">重置</a>
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
                <div>案件列表</div>
                <a href="<%=path%>/center/nonDnaReg" target="ifm" class="btn btn-blue" style="font-weight: 600">新增非现场案件委托</a>
                <span class="pull-right" style="margin-top: 20px;margin-right: 30px;color: red;">点击编辑进入案件详情页可添加检材信息</span>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-bordered bigTable">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>案件编号</th>
                        <th>案件名称</th>
                        <th>案件性质</th>
                        <th>案发时间</th>
                        <th>委托单位</th>
                        <th>委托人</th>
                        <th>委托时间</th>
                        <th>编辑</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${caseInfoList}" var="list" varStatus="s">
                        <tr>
                            <td>${s.index+1}</td>
                            <td>
                                ${list.entity.caseNo}
                                <c:if test="${list.appendFlag == '1'}">
                                    <i class="fa bu">补</i>
                                </c:if>
                            </td>
                            <td>${list.entity.caseName}</td>
                            <td>${list.casePropertyName}</td>
                            <td><fmt:formatDate value="${list.entity.caseDatetime}" pattern="yyyy-MM-dd"/></td>
                            <td>${list.delegateOrgName}</td>
                            <td>${list.delegator1Name}、${list.delegator2Name}</td>
                            <td><fmt:formatDate value="${list.delegateDatetime}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <input type="hidden" id="caseId" name="caseId" value="${list.entity.caseId}">
                                <input type="hidden" id="consignmentId" name="consignmentId"
                                       value="${list.consignmentId}">
                                <a href="<%=path%>/center/offCaseReg?caseId=${list.entity.caseId}&consignmentId=${list.consignmentId}"
                                   target="ifm"  class="btn-icon btn-icon-blue  btn-icon-bianji-blue">编辑</a>
                            </td>
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

        $("#addInformant").on("click", function(){
            $("#page").val(1);
            $('#consignationForm').submit();
        });

        kkpager.generPageHtml({
            pno: ${pageInfo.page},
            //总页码
            total: ${pageInfo.pageCount},
            //总数据条数
            totalRecords: ${pageInfo.allRecordCount},
            //链接前部
            hrefFormer: '<%=path%>/center/caseOffManage',
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
    })
</script>
</body>

</html>
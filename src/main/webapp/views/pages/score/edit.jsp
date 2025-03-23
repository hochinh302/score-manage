<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<jsp:include page="../../layout/menu.jsp"></jsp:include>
<div class="page-wrapper" style="min-height: 360px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title">Score</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/IndexClass">Score </a></li>
                        <li class="active"> / Update Score</li>
                    </ul>
                </div>
            </div>
        </div>
        <form action="update-score" method="POST">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title"><span>Score Information</span></h5>
                                </div>
                                <div class="col-12 col-sm-2">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Class</label>
                                        <select class="form-control form-select" name="class">
                                            <option value="" selected> Select Class </option>
                                            <c:forEach items="${ listClass }" var="item">
                                                <c:if test="${ item.status == 1 }">
                                                    <option value="${item.id }" ${ oldClass == item.id ? "selected" : "" }>${ item.name }</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Session</label>
                                        <select class="form-control form-select" name="sem">
                                            <option value="" selected> Select Sem </option>
                                            <c:forEach items="${ listSem }" var="item">
                                                <option value="${ item }" ${ oldSem == item ? "selected" : "" }>${ item }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Subject</label>
                                        <select class="form-control form-select" name="subId" ${ oldSem == null ? "disabled" : "" }>
                                            <option value="" selected> Select Subject </option>
                                            <c:forEach items="${ listSub }" var="item" >
                                                <option value="${ item.id }" ${ oldSub == item.id ? "selected" : "" }>${ item.name } </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-2" >
                                    <label>Type</label>
                                    <div class="form-group" data-select2-id="11" >
                                        <select class="form-control form-select text-center" name="type" ${ oldSem == null ? "disabled" : "" }>
                                            <option value="1" selected>LT - THEORY</option>
                                            <option value="2">TH - PRACTICE</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group btn-submit" style="padding: 32px 0 0 30px;">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table">
                        <div class="row"><div class="col-12">
                            <div class="card-body" style="padding-top: 80px;height: 400px;overflow-y: auto;">
                                <table class="table table-nowrap mb-0 text-center">
                                    <thead>
                                    <tr>
                                        <th>No #</th>
                                        <th>Name</th>
                                        <th>Exams</th>
                                        <th>Point</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${ listStu == null }">
                                        <tr>
                                            <td colspan="12"><p class="text-center" style="font-family: cursive;color: olive;">
                                                No student information yet !!!
                                            </p></td>
                                        </tr>
                                    </c:if>

                                    <c:forEach items="${ listStu }" var="item">
                                        <tr>
                                            <td>${ item.studentId }
                                                <input type="hidden" class="form-control" name="stuId[]" value="${ item.studentId }">
                                            </td>
                                            <td>${ item.name }</td>
                                            <td style="width: 150px">
                                                <div class="form-group" style="width: 120px;">
                                                    <input type="number" class="form-control" name="exams[]" value="${ item.exam }" style="height: 30px; text-align: center;" min="1">
                                                </div>
                                            </td>
                                            <td style="width: 150px">
                                                <div class="form-group" style="width: 120px;">
                                                    <input type="number" class="form-control" placeholder="Point" name="points[]" style="height: 30px; text-align: center;" min="0" value="${ item.score }">
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        function getSem(){
            var sem = document.getElementById("sem").value;
        }
    </script>
<jsp:include page="../../layout/footer.jsp"></jsp:include>
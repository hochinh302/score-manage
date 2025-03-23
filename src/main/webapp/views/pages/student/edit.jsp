<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<jsp:include page="../../layout/menu.jsp"></jsp:include>
<div class="page-wrapper" style="min-height: 360px;">
    <div class="content container-fluid" data-select2-id="11">
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title">Add Students</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="students.html">Students</a></li>
                        <li class="active"> / Add Students</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card" data-select2-id="10">
                    <div class="card-body" data-select2-id="9">
                        <form data-select2-id="8" action="update-student" method="post">
                            <div class="row" data-select2-id="7">
                                <div class="col-12">
                                    <h5 class="form-title"><span>Student Information</span></h5>
                                </div>
                                <div class="col-12 col-sm-3">
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input type="text" class="form-control" placeholder="Student id" value="${ite.id}" disabled>
                                        <input type="hidden" class="form-control" name="ids" placeholder="Student id" value="${ite.id}">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input type="text" class="form-control" name="name" placeholder="Student name" value="${ite.name}">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-3">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Gender</label>
                                        <select class="form-control form-select" name="sex">
                                            <option value="0" ${ite.sex == 0? "selected" : ""}>Male</option>
                                            <option value="1" ${ite.sex == 1? "selected" : ""}>Fe Male</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group">
                                        <label>Date of Birth</label>
                                        <div>
                                            <input type="date" name="birthday" class="form-control" value="${ite.birthday}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-5">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Class</label>
                                        <select class="form-control form-select" name="classId">
                                            <c:forEach items="${listClass}" var="item">
                                                <option value="${item.id}" ${ite.classId == item.id? "selected" : ""}>${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-13 col-sm-3">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Status</label>
                                        <select class="form-control form-select" name="status">
                                            <option value="1" ${ite.status == 1? "selected" : ""}>Active</option>
                                            <option value="0" ${ite.status == 0? "selected" : ""}>No Active</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../layout/footer.jsp"></jsp:include>

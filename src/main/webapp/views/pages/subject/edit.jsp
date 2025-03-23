<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<jsp:include page="../../layout/menu.jsp"></jsp:include>
<div class="page-wrapper" style="min-height: 360px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title">Add Subject</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/IndexClass">Subject </a></li>
                        <li class="active"> / Add Subject</li>
                    </ul>
                </div>
                <div class="col-auto text-end float-end ms-auto">
                    <a href="#" class="btn btn-outline-primary me-2"><i class="fas fa-download"></i> Download</a>
                    <a href="add-subject.html" class="btn btn-primary"><i class="fas fa-plus"></i></a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <form action="update-subject" method="post">
                            <input type="hidden" name="id" value="${ sub.id }">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title"><span>Subject Information</span></h5>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group">
                                        <label>Subject Name</label>
                                        <input type="text" class="form-control" value="${ sub.name }" name="name" placeholder="Subject name">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group">
                                        <label>Max Score</label>
                                        <input type="text" class="form-control" value="${ sub.maxScore }" name="maxScore" placeholder="Max score">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Session</label>
                                        <select class="form-control form-select" name="session">
                                            <c:forEach items="${listSem}" var="item">
                                                <option value="${ item }" ${ sub.session == item ? "checked" : "" } >${ item }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-2">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Status</label>
                                        <select class="form-control form-select" name="status">
                                            <option value="1" ${ sub.status == 1 ? "checked" : "" }>Active</option>
                                            <option value="0" ${ sub.status == 0 ? "checked" : "" }>No Active</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group btn-submit" style="padding: 30px 0 0 35px;">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>

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

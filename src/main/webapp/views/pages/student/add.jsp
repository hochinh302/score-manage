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
                        <form data-select2-id="8" action="index-student" method="post">
                            <div class="row" data-select2-id="7">
                                <div class="col-12">
                                    <h5 class="form-title"><span>Student Information</span></h5>
                                </div>
                                <div class="col-12 col-sm-3">
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input type="text" class="form-control" name="id" placeholder="Student id">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input type="text" class="form-control" name="name" placeholder="Student name">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-3">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Gender</label>
                                        <select class="form-control form-select" name="sex">
                                            <option value="0" checked>Male</option>
                                            <option value="1">Fe Male</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group">
                                        <label>Date of Birth</label>
                                        <div>
                                            <input type="date" name="birthday" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-5">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Class</label>
                                        <select class="form-control form-select" name="classId">
                                            <c:forEach items="${listClass}" var="item">
                                            <option value="${item.id}" >${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-13 col-sm-3">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Status</label>
                                        <select class="form-control form-select" name="status">
                                            <option value="1" checked>Active</option>
                                            <option value="0">No Active</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                    <div class="col-6">
                                        <p>Them Moi Thanh Cong</p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card card-table">
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer "><div class="row"><div class="col-sm-12 col-md-6"><div class="dataTables_length" id="DataTables_Table_0_length"><label>Show <select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="custom-select custom-select-sm form-control form-control-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div></div><div class="col-sm-12 col-md-6"></div></div><div class="row"><div class="col-sm-12"><table class="table table-hover table-center mb-0 datatable dataTable no-footer" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                <thead>
                                <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="ID: activate to sort column descending" style="width: 49.3375px;">ID</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" style="width: 182.425px;">Name</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Class: activate to sort column ascending" style="width: 45.025px;">Gender</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="DOB: activate to sort column ascending" style="width: 81.0125px;">Birthday</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Parent Name: activate to sort column ascending" style="width: 110.213px;">Class</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Parent Name: activate to sort column ascending" style="width: 110.213px;">Status</th>
                                    <th class="text-end sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Action: activate to sort column ascending" style="width: 74.4125px;">Action</th></tr>

                                </thead>
                                <tbody>
                                <c:forEach items="${listStu}" var="item">
                                <tr role="row" class="even">
                                    <td class="sorting_1">${item.id}</td>
                                    <td>
                                        <h2 class="table-avatar">
                                            <a href="">${item.name}</a>
                                        </h2>
                                    </td>
                                    <td>${item.sex == 0? "Male" : "Female"}</td>
                                    <td>${item.birthday}</td>
                                    <td>${item.className}</td>
                                    <td>${item.status == 1? "Active" : "No Active"}</td>
                                    <td class="text-end">
                                        <div class="actions">
                                            <a href="update-student?id=${item.id}" class="btn btn-sm bg-success-light me-2">
                                                <i class="fas fa-pen"></i>
                                            </a>
                                            <a href="delete-student?id=${item.id}" class="btn btn-sm bg-danger-light">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 to 10 of 11 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item next" id="DataTables_Table_0_next"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
<jsp:include page="../../layout/footer.jsp"></jsp:include>

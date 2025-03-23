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
                        <form action="index-subject" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title"><span>Subject Information</span></h5>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group">
                                        <label>Subject Name</label>
                                        <input type="text" class="form-control" name="name" placeholder="Subject name">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group">
                                        <label>Max Score</label>
                                        <input type="text" class="form-control" value="20" name="maxScore" placeholder="Max score">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Session</label>
                                        <select class="form-control form-select" name="session">
                                            <c:forEach items="${listSem}" var="item">
                                            <option value="${ item }">${ item }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-2">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Status</label>
                                        <select class="form-control form-select" name="status">
                                            <option value="1" checked>Active</option>
                                            <option value="0">No Active</option>
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
    <div class="content container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card card-table">
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer"><div class="row"><div class="col-sm-12 col-md-6"><div class="dataTables_length" id="DataTables_Table_0_length"><label>Show <select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="custom-select custom-select-sm form-control form-control-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div></div><div class="col-sm-12 col-md-6"></div></div><div class="row"><div class="col-sm-12"><table class="table table-hover table-center mb-0 datatable dataTable no-footer" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                <thead>
                                <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="ID: activate to sort column descending" style="width: 205.775px;">NO #</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" style="width: 287.663px;">Name</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Class: activate to sort column ascending" style="width: 177.05px;">Session</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Class: activate to sort column ascending" style="width: 177.05px;">Max Score</th>
                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Class: activate to sort column ascending" style="width: 177.05px;">Status</th>
                                    <th class="text-end sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Action: activate to sort column ascending" style="width: 242.712px;">Action</th>
                                </tr>

                                </thead>
                                <tbody>
                                <c:forEach items="${listSub}" var="item" varStatus="loop">
                                <tr role="row" class="${ loop.index % 2 == 0 ? "odd" : "even" }">
                                    <td class="sorting_1">Subject-0${ loop.index + 1 }</td>
                                    <td class="sorting_1">
                                            ${ item.name }
                                    </td>
                                    <td>${ item.session }</td>
                                    <td>${ item.maxScore }</td>
                                    <td>${ item.status == 1? "Active" : "No Active" }</td>
                                    <td class="text-end">
                                        <div class="actions">
                                            <a href="update-subject?id=${ item.id }" class="btn btn-sm bg-success-light me-2">
                                                <i class="fas fa-pen"></i>
                                            </a>
                                            <a href="delete-subject?id=${ item.id }" class="btn btn-sm bg-danger-light">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>

                                </tbody>
                            </table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 to 6 of 6 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item next disabled" id="DataTables_Table_0_next"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../layout/footer.jsp"></jsp:include>

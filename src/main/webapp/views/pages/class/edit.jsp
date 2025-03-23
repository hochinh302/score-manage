<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<jsp:include page="../../layout/menu.jsp"></jsp:include>
<div class="page-wrapper" style="min-height: 360px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title">Add Class</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/IndexClass">Class </a></li>
                        <li class="active"> / Add Class</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <form action="update-class" method="post">
                            <input type="hidden" class="form-control" name="id" placeholder="Class name" value="${item.id}">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title"><span>Class Information</span></h5>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Class Name</label>
                                        <input type="text" class="form-control" name="name" placeholder="Class name" value="${item.name}">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Status</label>
                                        <select class="form-control form-select" name="status">
                                            <option value="1" ${ item.status == 1? "checked" : "" }>Active</option>
                                            <option value="0" ${ item.status == 0? "checked" : "" }>No Active</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group btn-submit" style="padding: 30px 0 0 75px;">
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
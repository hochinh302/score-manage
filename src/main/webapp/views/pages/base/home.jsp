<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .tb-search td {
        color: white !important;
    }
</style>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="./assets/img/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <title>Tra Cứu Điểm PTIT</title>
    <script nonce="9b5dc87f-d3d9-41cd-bde2-72ea837d0e6f">(function(w,d){!function(a,e,t,r,z){a.zarazData=a.zarazData||{},a.zarazData.executed=[],a.zarazData.tracks=[],a.zaraz={deferred:[]};var s=e.getElementsByTagName("title")[0];s&&(a.zarazData.t=e.getElementsByTagName("title")[0].text),a.zarazData.w=a.screen.width,a.zarazData.h=a.screen.height,a.zarazData.j=a.innerHeight,a.zarazData.e=a.innerWidth,a.zarazData.l=a.location.href,a.zarazData.r=e.referrer,a.zarazData.k=a.screen.colorDepth,a.zarazData.n=e.characterSet,a.zarazData.o=(new Date).getTimezoneOffset(),a.dataLayer=a.dataLayer||[],a.zaraz.track=(e,t)=>{for(key in a.zarazData.tracks.push(e),t)a.zarazData["z_"+key]=t[key]},a.zaraz._preSet=[],a.zaraz.set=(e,t,r)=>{a.zarazData["z_"+e]=t,a.zaraz._preSet.push([e,t,r])},a.dataLayer.push({"zaraz.start":(new Date).getTime()}),a.addEventListener("DOMContentLoaded",(()=>{var t=e.getElementsByTagName(r)[0],z=e.createElement(r);z.defer=!0,z.src="../../../cdn-cgi/zaraz/sd0d9.js?z="+btoa(encodeURIComponent(JSON.stringify(a.zarazData))),t.parentNode.insertBefore(z,t)}))}(w,d,0,"script");})(window,document);</script></head>

</head>
<body style="background: currentColor;">
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body" style="font-family: monospace;font-size: inherit;">
                        <form action="tra-cuu-diem-sinh-vien" method="POST">
                            <div class="row">
                                <div class="col-12 col-sm-4">
                                    <div class="form-group">
                                        <label>Mã Sinh Viên</label>
                                        <input type="text" class="form-control" name="stuId" placeholder="Mã Sinh Viên" value="${ oldStuId }">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group" data-select2-id="11">
                                        <label>Lọc Điểm</label>
                                        <select class="form-control form-select text-center" name="condition">
                                            <option value="TC" ${ oldCon == "TC" ? "selected" : "" }>-- Tất Cả --</option>
                                            <option value="D" ${ oldCon == "D" ? "selected" : "" }>Đạt</option>
                                            <option value="KD" ${ oldCon == "KD" ? "selected" : "" }>Không Đạt</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group btn-submit" style="padding: 32px 0 0 80px;">
                                        <button type="submit" class="btn btn-primary">Tra Cứu Điểm</button>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group btn-submit" style="padding: 32px 0 0 35px;">
                                        <button type="submit" class="btn btn-primary">Xuất Dạng File Excel</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <c:if test="${ notifi == true}" >
                        <p style="color: black;     font-family: monospace;
    font-size: inherit;
    text-align: center;
}" y>Không Tồn Tại Thông Tin Sinh Viên Có Mã : <strong style="    color: #FFBC53;
    font-weight: bold;
    font-size: x-large;">${ oldStuId }</strong></p>
                    </c:if>
                    <c:if test="${ stuInfo != null}" >
                        <div class="card-body" style="font-family: monospace;font-size: inherit;">
                            <label style="font-family: cursive;
                                   font-size: 40px;
                                   font-weight: bold;
                                   width: 100%;
                                   text-align: center;
                                   margin-top: -50px;"
                            > Thông Tin Sinh Viên </label>
                            <div class="row pt-3" >
                                <div class="col-12 col-sm-3">
                                    <div class="form-group ">
                                        <label class="text-center" style="width: 100%;display: flex;justify-content: center;">Mã Sinh Viên : <p style="color: #FFBC53;padding-left: 20px;">${ stuInfo.id }</p></label>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label class="text-center" style="width: 100%;display: flex;justify-content: center;">Họ Tên Sinh Viên : <p style="color: #FFBC53;padding-left: 20px;">${ stuInfo.name }</p></label>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-3">
                                    <div class="form-group">
                                        <label class="text-center" style="width: 100%;display: flex;justify-content: center;">Lớp Học : <p style="color: #FFBC53;padding-left: 20px;">${ stuInfo.className }</p></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>

        </div>

        <c:if test="${ result == true}" >
            <div class="table-responsive">
                <table class="table table-striped custom-table text-center">
                    <thead>
                    <tr>
                        <th scope="col">Môn Thi</th>
                        <th scope="col">Điểm</th>
                        <th scope="col">Loại Điểm</th>
                        <th scope="col">Điểm Tối Đa</th>
                        <th scope="col">Lượt Thi</th>
                        <th scope="col">Nhận Xét</th>
                    </tr>
                    </thead>
                    <tbody style="font-family: monospace;font-size: unset;color: white;">

                    <c:forEach items="${ listData }" var="item">
                        <tr scope="row" class="tb-search">
                            <td>
                                    ${ item.name }
                            </td>
                            <td>${ item.score }</td>
                            <td>
                                ${ item.type == 1 ? "Lý Thuyết" : "Thực Hành" }
                            </td>
                            <td>${ item.maxScore }</td>
                            <td>${ item.exam }</td>
                            <td>${ item.score >= ( item.maxScore * 0.4 ) ? "Đạt" : "Không Đạt" }</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </c:if>
    </div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js%2bbootstrap.min.js%2bmain.js.pagespeed.jc.5O7Q3ljqqN.js">
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" data-cf-beacon='{"rayId":"6e1ef66ba8dfc6b8","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2021.12.0","si":100}' crossorigin="anonymous"></script>
</body>
</html>

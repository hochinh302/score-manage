<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Main Menu</span>
                </li>
                <li class="${ menu == null ? "active" : (menu == "Dashboard" ? "active" : "") }">
                    <a href="admin"><i class="fas fa-code"></i> <span> Dashboard</span></a>
                </li>
                <li class="${ menu == "Class" ? "active" : "" }">
                    <a href="index-class"><i class="fas fa-vector-square"></i> <span>Class</span></a>
                </li>
                <li class="${ menu == "Student" ? "active" : "" }">
                    <a href="index-student"><i class="fas fa-user-graduate"></i> <span>Student</span></a>
                </li>
                <li class="${ menu == "Subject" ? "active" : "" }">
                    <a href="index-subject"><i class="fas fa-book-reader"></i> <span>Subject</span></a>
                </li>
                <li class="${ menu == "Point" ? "active" : "" }">
                    <a href="index-score"><i class="fas fa-vector-square"></i> <span>Point</span></a>
                </li>
            </ul>
        </div>
    </div>
</div>

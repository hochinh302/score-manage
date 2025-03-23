package ptit.controller.backend.student;

import ptit.dao.ClassDao;
import ptit.dao.StudentDao;
import ptit.entity.Class;
import ptit.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "update-student", value = "/update-student")
public class UpdateStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("menu", "Student");

        List<Class> list = ClassDao.getInstance().getAll().stream().filter(aClass ->
                aClass.getStatus() == 1
        ).collect(Collectors.toList());

        request.setAttribute("ite", StudentDao.getInstance().findById(request.getParameter("id")));
        request.setAttribute("listClass", list);
        System.out.println("Data: "+ request.getAttribute("ite"));
        request.getRequestDispatcher("views/pages/student/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        ResultSet resultSet = null;
        StudentDao studentDao = StudentDao.getInstance();
        Student stu = new Student();

        stu.setId(request.getParameter("ids"));
        stu.setName(request.getParameter("name"));
        stu.setSex(Integer.parseInt(request.getParameter("sex")));
        stu.setBirthday(request.getParameter("birthday"));
        stu.setClassId(Integer.parseInt(request.getParameter("classId")));
        stu.setStatus(Integer.parseInt(request.getParameter("status")));
        if (studentDao.update(stu)) {
            System.out.println("Thanh Cong");
        }
        else {
            System.out.println("That Bai");
        }

        response.sendRedirect("index-student");
    }
}

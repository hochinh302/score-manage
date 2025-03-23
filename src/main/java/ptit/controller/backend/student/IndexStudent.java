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
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "index-student", value = "/index-student")
public class IndexStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        StudentDao studentDao = StudentDao.getInstance();
        ClassDao classDao = ClassDao.getInstance();

        List<Class> list = classDao.getAll().stream().filter(aClass ->
                aClass.getStatus() == 1
                ).collect(Collectors.toList());
        List<Student> listStu = studentDao.getAll();
        request.setAttribute("listClass", list);
        request.setAttribute("listStu", listStu);

        request.setAttribute("menu", "Student");

        request.getRequestDispatcher("views/pages/student/add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("menu", "Student");

        StudentDao studentDao = StudentDao.getInstance();
        ClassDao classDao = ClassDao.getInstance();
        Student stu = new Student();

        System.out.println("Name : "+ request.getParameter("name"));
        stu.setId(request.getParameter("id"));
        stu.setName(request.getParameter("name"));
        stu.setSex(Integer.parseInt(request.getParameter("sex")));
        stu.setBirthday(request.getParameter("birthday"));
        stu.setClassId(Integer.parseInt(request.getParameter("classId")));
        stu.setStatus(Integer.parseInt(request.getParameter("status")));

        if (studentDao.add(stu)) {
            System.out.println("Thanh Cong");
        }
        else {
            System.out.println("That Bai");
        }

        response.sendRedirect("index-student");
    }
}

package ptit.controller.backend.classs;

import ptit.dao.ClassDao;
import ptit.entity.Class;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "addClass", value = "/index-class")
public class IndexClass extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        ClassDao classDao = ClassDao.getInstance();

        request.setAttribute("listClass", classDao.getAll());

        request.setAttribute("menu", "Class");

        request.getRequestDispatcher("views/pages/class/add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("menu", "Class");

        ClassDao classDao = ClassDao.getInstance();
        Class aClass = new Class();

        aClass.setName(request.getParameter("nameClass"));
        aClass.setStatus(Integer.parseInt(request.getParameter("status")));
        if (classDao.add(aClass)) {
            System.out.println("Thanh Cong");
        }
        else {
            System.out.println("That Bai");
        }
        response.sendRedirect("index-class");
    }
}

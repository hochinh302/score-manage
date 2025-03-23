package ptit.controller.backend.student;

import ptit.dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "delete-student", value = "/delete-student")
public class DeleteStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (StudentDao.getInstance().remote(request.getParameter("id"))) {
            System.out.println("Thanh Cong");
        }
        else {
            System.out.println("That Bai");
        }
        response.sendRedirect("index-student");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

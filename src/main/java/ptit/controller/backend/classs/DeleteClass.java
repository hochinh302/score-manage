package ptit.controller.backend.classs;

import ptit.dao.ClassDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "delete-class", value = "/delete-class")
public class DeleteClass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (ClassDao.getInstance().remote(Integer.parseInt(request.getParameter("id")))) {
            System.out.println("Thanh Cong");
        }
        else {
            System.out.println("That Bai");
        }

        response.sendRedirect("index-class");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

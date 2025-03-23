package ptit.controller.backend.subject;

import ptit.dao.SubjectDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "delete-subject", value = "/delete-subject")
public class DeleteSubject extends HttpServlet {
    public SubjectDao subjectDao = SubjectDao.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (subjectDao.remote(Integer.parseInt(request.getParameter("id")))) {
            System.out.println("Thanh cong");
            response.sendRedirect("index-subject");
        }
        else {
            System.out.println("That bai");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

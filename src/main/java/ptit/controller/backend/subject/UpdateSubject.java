package ptit.controller.backend.subject;

import ptit.common.Constant;
import ptit.dao.SubjectDao;
import ptit.entity.Subject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "update-subject", value = "/update-subject")
public class UpdateSubject extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("menu", "Subject");

        SubjectDao subjectDao = SubjectDao.getInstance();

        request.setAttribute("sub", subjectDao.findById(Integer.parseInt(request.getParameter("id"))));
        request.setAttribute("listSem", Constant.listSem);
        request.getRequestDispatcher("views/pages/subject/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("menu", "Subject");

        SubjectDao subjectDao = SubjectDao.getInstance();

        Subject subject = new Subject(
          Integer.parseInt(request.getParameter("id")),
          request.getParameter("name"),
          request.getParameter("session"),
          Integer.parseInt(request.getParameter("status")),
          Integer.parseInt(request.getParameter("maxScore"))
        );

        if (subjectDao.update(subject)) {
            System.out.println("Thanh cong");
            response.sendRedirect("index-subject");
        }
        else {
            System.out.println("That bai");
        }
    }
}

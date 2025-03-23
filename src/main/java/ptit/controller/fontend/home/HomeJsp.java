package ptit.controller.fontend.home;

import ptit.dao.StudentDao;
import ptit.dao.SubScoreDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet(name = "tra-cuu-diem-sinh-vien", value = "/tra-cuu-diem-sinh-vien")
public class HomeJsp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect("tra-cuu-diem-sinh-vien");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String stuId = request.getParameter("stuId");

        request.setAttribute("oldCon", request.getParameter("condition"));
        request.setAttribute("oldStuId", stuId);

        StudentDao studentDao = StudentDao.getInstance();

        if (studentDao.findById(stuId) != null) {
            request.setAttribute("stuInfo", studentDao.findById(stuId));

            SubScoreDao subScoreDao = SubScoreDao.getInstance();

            if (subScoreDao.searchScore(stuId) != null) {

                switch (request.getParameter("condition")) {
                    case "D" :
                        request.setAttribute("listData",
                                subScoreDao.searchScore(stuId).stream().filter(
                                        x -> x.getScore() >= x.getMaxScore() * 0.4
                                ).collect(Collectors.toList())
                        );
                        break;
                    case "KD" :
                        request.setAttribute("listData",
                                subScoreDao.searchScore(stuId).stream().filter(
                                        x -> x.getScore() < x.getMaxScore() * 0.4
                                ).collect(Collectors.toList())
                        );
                        break;
                    default:
                        request.setAttribute("listData", subScoreDao.searchScore(stuId));
                        break;
                }

                request.setAttribute("result", true);
            }


        }
        else {
            request.setAttribute("notifi", true);
        }

        request.getRequestDispatcher("views/pages/base/home.jsp").forward(request, response);

    }
}

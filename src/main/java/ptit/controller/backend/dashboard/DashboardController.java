package ptit.controller.backend.dashboard;

import ptit.dao.AccountDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "admin", value = "/admin")
public class DashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("menu", "Dashboard");

        HttpSession session = request.getSession();

        if (session.getAttribute("access_token") == null) {
            response.sendRedirect("login");
            return;
        }

        AccountDao accountDao = AccountDao.getInstance();
        String access_token = (String) session.getAttribute("access_token");
        request.setAttribute("uName", accountDao.findByToken(access_token).getName());
        request.getRequestDispatcher("views/pages/base/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

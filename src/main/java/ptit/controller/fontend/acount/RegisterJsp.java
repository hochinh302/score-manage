package ptit.controller.fontend.acount;

import ptit.dao.AccountDao;
import ptit.entity.Admin;
import ptit.utils.DataEncodeUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "register", value = "/register")
public class RegisterJsp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher("views/pages/acount/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        AccountDao accountDao = AccountDao.getInstance();



        Admin admin = new Admin(
                0,
                request.getParameter("user"),
                request.getParameter("email"),
                DataEncodeUtil.getMd5(request.getParameter("password")),
                ""
        );

        if(accountDao.add(admin)) {
            session.setAttribute("infoUser", admin);
        }
        response.sendRedirect("login");
    }
}

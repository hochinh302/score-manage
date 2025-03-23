package ptit.controller.fontend.acount;

import ptit.dao.AccountDao;
import ptit.dao.StudentDao;
import ptit.entity.Admin;
import ptit.utils.DataEncodeUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "login", value = "/login")
public class LoginJsp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        StudentDao studentDao = StudentDao.getInstance();

        System.out.println("studentDao.getAll() = " + studentDao.getAll());
        HttpSession session = request.getSession();
        request.setAttribute("info", session.getAttribute("infoUser"));
        request.getRequestDispatcher("views/pages/acount/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String uEmail = request.getParameter("email");
        String uPass = DataEncodeUtil.getMd5(request.getParameter("password"));

        AccountDao accountDao = AccountDao.getInstance();
        Admin uAdmin = accountDao.findByInfo(uEmail, uPass);
        if (uAdmin != null) {
            HttpSession session = request.getSession();
            String uuid = UUID.randomUUID().toString();
            Admin admin = new Admin();
            admin.setId(uAdmin.getId());
            admin.setToken(DataEncodeUtil.getBase64(uuid));

            if (accountDao.update(admin)) {
                session.setAttribute("access_token", admin.getToken());
            }
        }
        else {
            response.sendRedirect("login");
            return;
        }
        response.sendRedirect("admin");
    }
}

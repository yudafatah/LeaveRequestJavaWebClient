/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import root.helper.sendMailNotif;
import root.services.EmployeeService;
import root.services.LoginStatusService;

/**
 *
 * @author yudafatah
 */
@WebServlet(name = "ValidationLoginn", urlPatterns = {"/validationLoginn"})
public class ValidationLoginn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        HttpSession session = request.getSession();
        String id = "";
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            session.removeAttribute("message");
            
            if (new LoginStatusService().getLoginStatus(email, password).contains("success")) {
                EmployeeService es = new EmployeeService();
                ArrayList<HashMap<String, String>> isact = es.getEmployeeByEmail(email);
                String act = "2";
                String name = "";
                for (int i = 0; i < isact.size(); i++) {
                    act = isact.get(i).get("isActive");
                    id = isact.get(i).get("employeeId");
                    name = isact.get(i).get("employeeName");
                    System.out.println(id);
                }
                if (Integer.parseInt(act)==0) {
                    int x = (int) ((Math.random() * ((10000 - 99999) + 1)) + 10000);
                    session.setAttribute("code", x);
                    session.setAttribute("Id", id);
                    session.setAttribute("message", "Please check your email!");
                    sendMailNotif mailNotif = new sendMailNotif();
                    String subject = "Leave Request - Email Verification";
                    String text = "Dear "+ name +", <br/>"
                    + "<p> To activate your account please verify your account using the code below <br/>"
                            + x + " <br/>"
                            + "copy and paste your code into the verification form. <br>"
                            + "Thanks for using Leave Request Aplication <br/> <br/> "
                            + "PT. Mitra Integrasi Informatika – member of METRODATA <br/>"
                            + "APL Tower 37th Fl. Suite 1-8, Jl. Letjend. S. Parman kav. 28, Jakarta 11470 <br/>"
                            + "Phone (62-21) 29345 777  | Fax (62-21) 29345 700 | Website www.mii.co.id <br/>"
                            + "\"World Class Business Technology Partner\"<br/><br/>"
                            + "For Support, Inquiries, Customer Care:   Call MII (62-21) 29345678 | Email contact@mii.co.id <br/>"
                            + "Become a fan of <a href=http://www.facebook.com/pages/MII-Cloud/203907023038191>MII Cloud Facebook<a/> | Follow <a href=https://twitter.com/MII_cloud >@MII_cloud on Twitter<a/> | Join with <a href=https://www.facebook.com/people/Insite-Metrodata/100003780287885>Insite Metrodata Facebook<a/> </p>";
                    mailNotif.Send("yudafatah@gmail.com", subject, text);
//                    System.out.println("");
                    response.sendRedirect("views/Verification.jsp");
                } else if (es.getEmployeeRelationByEmail(email).get(0).get("role").contains("Staff")) {
                    session.setAttribute("Id", id);
                    session.setAttribute("role", "Staff");
                    session.setAttribute("email", email);
                    response.sendRedirect("getAlls");
                } else if (es.getEmployeeRelationByEmail(email).get(0).get("role").contains("Manager")) {
                    session.setAttribute("Id", id);
                    session.setAttribute("role", "Manager");
                    session.setAttribute("email", email);
                    response.sendRedirect("getAlls");
                }
            } else {
                session.setAttribute("message", new LoginStatusService().getLoginStatus(email, password));
                response.sendRedirect("views/Login.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

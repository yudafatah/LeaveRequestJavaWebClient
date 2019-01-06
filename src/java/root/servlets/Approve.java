/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import root.helper.sendMailNotif;
import root.services.LeaveRequestServices;

/**
 *
 * @author yudafatah
 */
@WebServlet(name = "Approve", urlPatterns = {"/approve"})
public class Approve extends HttpServlet {

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
        String lrid = request.getParameter("lrid");
        HttpSession session = request.getSession();
        String id = session.getAttribute("Id").toString();
        Object obj = session.getAttribute("datas");
        String message = "";
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            LeaveRequestServices lrs = new LeaveRequestServices();
            ArrayList<HashMap<String, String>> lrdata = lrs.getLRById(lrid);
            message = lrs.updateLRApprove(lrid);
            sendMailNotif mailNotif = new sendMailNotif();
            String subject = "Leave Request Approved";
            String text = "Congrats your leave request from "+lrdata.get(0).get("startDate")+" until "+lrdata.get(0).get("endDate")+" has been approved. "
                    + "with note request : " +lrdata.get(0).get("noteRequest");
            mailNotif.Send("yudafatah@gmail.com",subject, text);
            session.setAttribute("message", message);
            session.setAttribute("Id", id);
            session.setAttribute("datas", obj);
            response.sendRedirect("views/ManagerPage.jsp");
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

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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import root.services.EmployeeService;
import root.services.LeaveRequestServices;
import root.services.LeaveRequestTypeService;

/**
 *
 * @author yudafatah
 */
@WebServlet(name = "GetAlls", urlPatterns = {"/getAlls"})
public class GetAlls extends HttpServlet {

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
        HttpSession session = request.getSession();
        String id = session.getAttribute("Id").toString();
        String role = session.getAttribute("role").toString();
        String email = session.getAttribute("email").toString();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ArrayList<HashMap<String, String>> lrList = new ArrayList<>();
            ArrayList<String> lrrList = new ArrayList<>();
            ArrayList<HashMap<String, String>> lrtList = new ArrayList<>();
            ArrayList<HashMap<String, String>> empList = new ArrayList<>();
            //session.removeAttribute("lrList");
            lrtList.removeAll(lrtList);
            lrList.removeAll(lrList);
            empList.removeAll(empList);
            lrrList.removeAll(lrrList);

            LeaveRequestServices lrs = new LeaveRequestServices();
            LeaveRequestTypeService lrts = new LeaveRequestTypeService();
            EmployeeService es = new EmployeeService();
            ArrayList<HashMap<String, String>> emp = es.getEmployeeByEmail(email);
            ArrayList<HashMap<String, String>> emp1 = es.getEmployeeRelationByEmail(email);
            for (int i = 0; i < emp.size(); i++) {
                HashMap<String, String> semp = new HashMap<String, String>();
                semp.put("employeeId", emp.get(i).get("employeeId"));
                semp.put("employeeName", emp.get(i).get("employeeName"));
                semp.put("gender", emp.get(i).get("gender"));
                semp.put("address", emp.get(i).get("address"));
                semp.put("joinDate", emp.get(i).get("joinDate"));
                semp.put("email", emp.get(i).get("email"));
                semp.put("username", emp.get(i).get("username"));
                semp.put("quotaThisyear", emp.get(i).get("quotaThisyear"));
                semp.put("phone", emp.get(i).get("phone"));
                semp.put("quotaLastyear", emp.get(i).get("quotaLastyear"));
                semp.put("site", emp1.get(i).get("site"));
                empList.add(semp);
            }
            ArrayList<HashMap<String, String>> getAllLRTList = lrts.getAllLRT();
            for (int i = 0; i < getAllLRTList.size(); i++) {
                HashMap<String, String> lrt = new HashMap<String, String>();
                lrt.put("typeLrId", getAllLRTList.get(i).get("typeLrId"));
                lrt.put("typeName", getAllLRTList.get(i).get("typeName"));
                lrt.put("durationLimit", getAllLRTList.get(i).get("durationLimit"));
                lrtList.add(lrt);
            }
            if (role.contains("Staff")) {
                ArrayList<HashMap<String, String>> getalllist = lrs.getAllLR(role, id);
                lrList = getalllist;
                session.setAttribute("lrList", lrList);
                session.setAttribute("lrtList", lrtList);
                if (request.getParameter("param") != null) {
                    String param = request.getParameter("param");
                    if (param.contains("histories")) {
                        response.sendRedirect("views/StaffHistories.jsp");
                    }
                    if (param.contains("profile")) {
                        session.setAttribute("empList", empList);
                        session.setAttribute("Id", id);
                        response.sendRedirect("views/Profile.jsp");
                    }
                } else {
                    response.sendRedirect("views/StaffPage.jsp");
                }
            } else {
                ArrayList<HashMap<String, String>> getalllist1 = lrs.getAllLRASManager(id);
                ArrayList<String> getalllist2 = lrs.getLRListRelation(id);
//                HashMap<String, String> lr = new HashMap<String, String>();
                lrList = getalllist1;
                lrrList = getalllist2;
                session.setAttribute("lrList", lrList);
                session.setAttribute("lrrList", lrrList);
                session.setAttribute("Id", id);
                if (request.getParameter("param") == null) {
                    response.sendRedirect("views/ManagerPage.jsp");
                } else {
                    response.sendRedirect("views/ManagerHistories.jsp");
                }
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

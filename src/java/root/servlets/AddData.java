/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import root.helper.countDate;
import root.helper.extractFileName;
import root.services.EmployeeService;
import root.services.LeaveRequestServices;

/**
 *
 * @author yudafatah
 */
@WebServlet(name = "AddData", urlPatterns = {"/addData"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
        )
public class AddData extends HttpServlet {

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
        HttpSession session = request.getSession();
        String empid = session.getAttribute("Id").toString();
        String typelr = request.getParameter("typelr");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String notereq = request.getParameter("notereq");
        Part image = request.getPart("image");
        String email = session.getAttribute("email").toString();
        String fileName = extractFileName.extract(image);
        String savePath = "//Users//ustore//Yuda//bc21//SpringBoot//LeaveRequest//LeaveRequestJavaWebClient//web//images" + File.separator + fileName;
        String message ="";
        File fileSave = new File(savePath);
        boolean validation = true;
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Date calendar = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            String cdate = format.format(calendar.getTime());
            EmployeeService es = new EmployeeService();
            ArrayList<HashMap<String, String>> emp = es.getEmployeeByEmail(email);
            image.write(savePath + File.separator);
            Date a = null;
            Date b = null;
            String startDate = "";
            String endDate = "";
            try {
                a = format.parse(startdate);
                startDate = format.format(a);
            } catch (Exception d) {
                d.printStackTrace();
            }
            try {
                b = format.parse(enddate);
                endDate = format.format(b);
            } catch (Exception d) {
                d.printStackTrace();
            }
            int lrduration=0;
            int thisyear = (Integer.parseInt(emp.get(0).get("quotaThisyear"))) -lrduration;
            try {
                lrduration = countDate.countDays(startDate, endDate);
            } catch (Exception d) {
                d.printStackTrace();
            }
            try {
                if(countDate.countDays(cdate, startDate)<=3){
                    message = "Minimum start date is must be 3 days before leave!";
                    if(validation==true){
                        validation = false;
                    }
                }
                else if (countDate.countDays(startDate, endDate)<=0){
                    message = "End date can not be lower than start date!";
                    if(validation==true){
                        validation = false;
                    }
                }
                else if((Integer.parseInt(emp.get(0).get("quotaThisyear")))<= lrduration){
                    message = "The leave duration is out of your leave quota limit";
                    if(validation==true){
                        validation = false;
                    }
                }
                else if (typelr.equals(null)){
                    message = "You must fill the leave request type!";
                    if(validation==true){
                        validation = false;
                    }
                }
                else if(startdate.equals(null)){
                    message = "You must fill the start date!";
                    if(validation==true){
                        validation = false;
                    }
                }
                else if(enddate.equals(null)){
                    message = "You must fill the end date!";
                    if(validation==true){
                        validation = false;
                    }
                }
//                for (Object object : lri.getAlls(new LeaveRequest(), "", e.getEmployeeId())) {
//                    LeaveRequest lr = (LeaveRequest) object;
//                    if((a.compareTo(lr.getStartDate())>=0 && a.compareTo(lr.getEndDate())<=0) && 
//                            (b.compareTo(lr.getStartDate())>=0 && b.compareTo(lr.getEndDate())<=0)){
//                        message = "You already have departure on that day";
//                        if(validation==true){
//                            validation = false;
//                        }
//                    }
//                }
                if(typelr.contains("Menikah")){
                    if(lrduration > 3){
                        message = "Maximum leave request for marriage is 3 days!";
                        if(validation==true){
                            validation = false;
                        }
                    }
                }
                else if (typelr.contains("Melahirkan")){
                    if(lrduration>90){
                        message = "Maximum leave request for childbirth is 90 days!";
                        if(validation==true){
                            validation = false;
                        }
                    }
                }
            } catch (Exception d) {
                d.printStackTrace();
            }
            if (typelr.contains("Days") && validation==true){
                if(lrduration>5 && lrduration>(Integer.parseInt(emp.get(0).get("quotaThisyear")))){
                    //image.write(savePath + File.separator);
                    LeaveRequestServices lrs = new LeaveRequestServices();
                    message = lrs.createLR(empid, typelr, startDate, endDate, notereq, savePath);
                    if(message.contains("Data has been edited")){
                        session.setAttribute("message", message);
                    response.sendRedirect("views/StaffPage.jsp");
                    session.setAttribute("status", "success");
                    }
                    else{
                        System.out.println("fail");
                    }
                    
                }
            }
            else if(!typelr.contains("Days") && validation==true){
                //image.write(savePath + File.separator);
                LeaveRequestServices lrs = new LeaveRequestServices();
                message = lrs.createLR(empid, typelr, startDate, endDate, notereq, savePath);
                session.setAttribute("message", message);
                response.sendRedirect("views/StaffPage.jsp");
                session.setAttribute("status", "success");
            }else{
                session.setAttribute("message", message);
                response.sendRedirect("views/StaffPage.jsp");
                session.setAttribute("status", "fail");
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

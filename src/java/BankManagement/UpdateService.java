/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BankManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ganusha_m
 */
public class UpdateService extends HttpServlet {

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
        try {
            String serviceid = request.getParameter("serviceid");
            String servicename = request.getParameter("servicename");
            String description = request.getParameter("description");
            String contactno = request.getParameter("contactno");
            String email = request.getParameter("email");

            DBConnection db = new DBConnection();
            PrintWriter pw = response.getWriter();
            Connection conn = db.getConnection();
            Log log = new Log();
//
//            String sql1 = "select * from services WHERE SERVICE_ID ='" + serviceid + "'";
//            Statement st = conn.createStatement();
//            ResultSet res = st.executeQuery(sql1);

//            while (res.next()) {
//
//                if (!(res.getString("SERVICE_NAME").equals(servicename))) {
//                    System.out.println(res.getString("SERVICE_NAME") + " change to " + servicename);
//                    log.writeLog(res.getString("SERVICE_NAME") + " change to " + servicename);
//                }
//                if (!(res.getString("DESCRIPTION").equals(description))) {
//                    System.out.println(res.getString("DESCRIPTION") + " change to " + description);
//                    log.writeLog(res.getString("DESCRIPTION") + " change to " + description);
//                }
//                if (!(res.getString("CONTACT_NO").equals(contactno))) {
//                    System.out.println(res.getString("CONTACT_NO") + " change to " + contactno);
//                    log.writeLog(res.getString("CONTACT_NO") + " change to " + contactno);
//                }
//                if (!(res.getString("EMAIL").equals(email))) {
//                    System.out.println(res.getString("EMAIL") + " change to " + email);
//                    log.writeLog(res.getString("EMAIL") + " change to " + email);
//                }
//
//            }
            String date = new SimpleDateFormat("yyyy:MM:dd _ HH:mm:ss").format(Calendar.getInstance().getTime());
            //String sql = "select * from bankdetails WHERE NAME ='" + bank + "'";
            String sql = "update  services set SERVICE_NAME=?,DESCRIPTION=?,CONTACT_NO=?,EMAIL=? where SERVICE_ID=? ";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, servicename);
            ps.setString(2, description);
            ps.setString(3, contactno);
            ps.setString(4, email);
            ps.setString(5, serviceid);

            int rs = ps.executeUpdate();

            if (rs > 0) {

                log.writeLog("Updated by " + request.getSession().getAttribute("user"));

                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Successfully Updated');");
                pw.println("location='LoadServices';");
                pw.println("</script>");
                //response.sendRedirect("otherbanks.jsp");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Not Updated');");
                pw.println("</script>");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateBankDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBankDetails.class.getName()).log(Level.SEVERE, null, ex);
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

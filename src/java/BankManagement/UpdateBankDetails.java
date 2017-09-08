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
public class UpdateBankDetails extends HttpServlet {

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
            String branch = request.getParameter("fbranch");
            String branchid = request.getParameter("fbranchid");
            String branchfincontact = request.getParameter("fbranchfincontact");
            String branchfinemail = request.getParameter("fbranchfinemail");
            String branchmancontact = request.getParameter("fbranchmancontact");
            String branchmanemail = request.getParameter("fbranchmanemail");
            String branchaddress = request.getParameter("fbranchaddress");

            DBConnection db = new DBConnection();
            PrintWriter pw = response.getWriter();
            Connection conn = db.getConnection();
            //String sql = "select * from bankdetails WHERE NAME ='" + bank + "'";
            String sql = "update  branch set BRANCH_NAME=?,CONTACT_NO_FINANCE=?,EMAIL_FINANCE=?,CONTACT_NO_BRANCH_MANAGER=?,EMAIL_BRANCH_MANAGER=?,ADDRESS=? where BRANCH_ID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, branch);
            ps.setString(2, branchfincontact);
            ps.setString(3, branchfinemail);
            ps.setString(4, branchmancontact);
            ps.setString(5, branchmanemail);
            ps.setString(6, branchaddress);
            ps.setString(7, branchid);
            int rs = ps.executeUpdate();

            if (rs > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Successfully Updated');");
                pw.println("location='otherbanks.jsp';");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BankManagement;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import com.sun.tools.ws.wsdl.framework.DuplicateEntityException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ganusha
 */
public class AddService extends HttpServlet {

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
        PrintWriter pw = response.getWriter();
        String serviceid = request.getParameter("serviceid");
        String servicename = request.getParameter("servicename");
        String description = request.getParameter("description");
        String contactno = request.getParameter("contactno");
        String email = request.getParameter("email");
        try {

            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();
            String query = "insert into services values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, serviceid);
            ps.setString(2, servicename);
            ps.setString(3, description);
            ps.setString(4, contactno);
            ps.setString(5, email);

            if (ps.executeUpdate() > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Service Added Successfully');");
                pw.println("location='LoadServices';");
                pw.println("</script>");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLIntegrityConstraintViolationException ex) {
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Service ID is inused. Try with Another Service ID');");
            pw.println("location='LoadServices';");
            pw.println("</script>");
            Logger.getLogger(AddService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddService.class.getName()).log(Level.SEVERE, null, ex);

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

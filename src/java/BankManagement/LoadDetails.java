/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BankManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//add comment here
/**
 *
 * @author ganusha_m
 */
public class LoadDetails extends HttpServlet {

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
        List lst=new ArrayList();
         try {
            
            DBConnection db=new DBConnection();
            Connection conn=db.getConnection();
            Statement stm =conn.createStatement();
            String query="select * from bankdetails where NAME='sampath bank'";
            ResultSet rs=stm.executeQuery(query);
            
            while (rs.next()) {                
                lst.add(rs.getString("REG_NO"));
                lst.add(rs.getString("NAME"));
                lst.add(rs.getString("CONTACT_NO_FINANCE"));
                lst.add(rs.getString("EMAIL_FINANCE"));
                lst.add(rs.getString("CONTACT_NO_ATM"));
                lst.add(rs.getString("EMAIL_ATM"));
                lst.add(rs.getString("HEAD_OFFICE_ADDRESS"));
                lst.add(rs.getString("WEBSITE"));
            }
            rs.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoadServices.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoadServices.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
         request.setAttribute("bankdetails", lst);
         RequestDispatcher rd=request.getRequestDispatcher("./bankdetails.jsp");
         rd.forward(request, response);
         
         lst.clear();
         
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

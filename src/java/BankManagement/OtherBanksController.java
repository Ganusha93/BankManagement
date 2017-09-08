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
 * @author Ganusha
 */
public class OtherBanksController extends HttpServlet {

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

        String bank = request.getParameter("bank");
        String branch=request.getParameter("branch");
        String bankname=request.getParameter("bankname");
        DBConnection db = new DBConnection();
        PrintWriter pw = response.getWriter();
        //System.out.println("bankname"+bankname);
        try {
            Connection conn = db.getConnection();
            String sql1 = "select NAME from bankdetails WHERE NAME like '%" + bank + "%'";
            String sql3="select BRANCH_NAME from branch where REG_NO = (select REG_NO from bankdetails where BRANCH_NAME like '%"+branch+"%' ";
            String sql2="select BRANCH_NAME from branch where REG_NO = (select REG_NO from bankdetails where Name = '"+bankname+"')&& BRANCH_NAME like '%"+branch+"%'";
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql1);
            while (rs.next()) {
                //System.out.println("pass datas");
                pw.println("<li>" + rs.getString("NAME") + "</li>");
            }
            
            ResultSet rs1=stm.executeQuery(sql2);
            while (rs1.next()) {
                //System.out.println("pass datas");
                pw.println("<li>" + rs1.getString("BRANCH_NAME") + "</li>");
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OtherBanksController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OtherBanksController.class.getName()).log(Level.SEVERE, null, ex);
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

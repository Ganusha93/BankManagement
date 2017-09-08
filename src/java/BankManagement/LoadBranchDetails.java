package BankManagement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BankManagement.DBConnection;
import BankManagement.LoadBankDetail;
import BankManagement.OtherBanksController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author ganusha_m
 */
public class LoadBranchDetails extends HttpServlet {

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
       String branch = request.getParameter("branch"); 
        String bankname = request.getParameter("bankname"); 
        DBConnection db = new DBConnection();
        PrintWriter pw = response.getWriter();
        JSONObject jsono = new JSONObject();
       // System.out.println(bank);

        try {
            Connection conn = db.getConnection();
           
            String sql="select * from branch where BRANCH_NAME='"+branch+"'";
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {

                jsono.append("regno", rs.getString("BRANCH_ID"));
                jsono.append("name", rs.getString("BRANCH_NAME"));
                jsono.append("contactfinance", rs.getString("CONTACT_NO_FINANCE"));
                jsono.append("emailfinance", rs.getString("EMAIL_FINANCE"));
                jsono.append("contactmanager", rs.getString("CONTACT_NO_BRANCH_MANAGER"));
                jsono.append("emailmanager", rs.getString("EMAIL_BRANCH_MANAGER"));
                jsono.append("address", rs.getString("ADDRESS"));
              
            }
            response.setContentType("json");
            pw.print(jsono);
            System.out.println(jsono);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OtherBanksController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OtherBanksController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(LoadBankDetail.class.getName()).log(Level.SEVERE, null, ex);
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

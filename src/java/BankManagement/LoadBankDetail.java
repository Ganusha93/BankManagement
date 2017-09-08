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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.JsonObject;
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
public class LoadBankDetail extends HttpServlet {

  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    String username = (String) request.getSession().getAttribute("user");
    String password = (String) request.getSession().getAttribute("pass");
    if (username == null || password == null) {
        response.sendRedirect("./login.jsp");
    }else{
        
        String bank = request.getParameter("bank");
        DBConnection db = new DBConnection();
        PrintWriter pw = response.getWriter();
        JSONObject jsono = new JSONObject();
        System.out.println(bank);

        try {
            Connection conn = db.getConnection();
            String sql = "select * from bankdetails WHERE NAME ='" + bank + "'";
            //String sql="select BRANCH_NAME from branch where REG_NO = (select REG_NO from bankdetails where BRANCH_NAME like '%"+bank+"%' )";
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {

                jsono.append("regno", rs.getString("REG_NO"));
                jsono.append("name", rs.getString("NAME"));
                jsono.append("contactfinance", rs.getString("CONTACT_NO_FINANCE"));
                jsono.append("emailfinance", rs.getString("EMAIL_FINANCE"));
                jsono.append("contactatm", rs.getString("CONTACT_NO_ATM"));
                jsono.append("emailatm", rs.getString("EMAIL_ATM"));
                jsono.append("address", rs.getString("HEAD_OFFICE_ADDRESS"));
                jsono.append("web", rs.getString("WEBSITE"));
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

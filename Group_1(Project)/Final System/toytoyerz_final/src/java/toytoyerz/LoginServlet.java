/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package toytoyerz;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RD
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String adminExists = "";
        String adminID = "";
        String staffID = "";
        String staffLastLogin = "";
        String adminLastLogin = "";
        String staffFailedLog = "";
        String adminFailedLog = "";
        String staffExists = "";
        boolean staff = false;
        boolean admin = false;

        //getting the username parameter from the request object
        String username = request.getParameter("username");
        //getting the password parameter from the request object
        String password = request.getParameter("password");
        ResultSet adminResults;
        ResultSet staffResults;
        mysqlconnect dbconnect = new mysqlconnect();
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        try (PreparedStatement adminStatement = dbconnect.getConnection().prepareStatement("SELECT * FROM admin WHERE adminID = ? AND adminPassword = ?")) {
            adminStatement.setString(1, username);
            //setting the first placeholder to the password recieved from the client
            adminStatement.setString(2, password);
            
            //executing the prepared statement and storing the results in the ResultSet
            adminResults = adminStatement.executeQuery();

            //checking that the result set hold values
            while (adminResults.next()) {
                //getting the username value in the field returned
                adminExists = adminResults.getString("adminName");
                adminID = adminResults.getString("adminID");
            }
            //closing the result set
            adminResults.close();
        }
        
        try (PreparedStatement adminStatement = dbconnect.getConnection().prepareStatement("SELECT * FROM log WHERE adminID = ?")) {
            adminStatement.setString(1, username);
            
            //executing the prepared statement and storing the results in the ResultSet
            adminResults = adminStatement.executeQuery();

            //checking that the result set hold values
            while (adminResults.next()) {
                //getting the username value in the field returned
                adminLastLogin = adminResults.getString("TimeDate");
                adminFailedLog = adminResults.getString("failedLogins");
            }
            //closing the result set
            adminResults.close();
        }
        
        try (PreparedStatement staffStatement = dbconnect.getConnection().prepareStatement("SELECT * FROM staff WHERE staffID = ? AND staffPassword = ?")) {
            staffStatement.setString(1, username);
            //setting the first placeholder to the password recieved from the client
            staffStatement.setString(2, password);
            
            //executing the prepared statement and storing the results in the ResultSet
            staffResults = staffStatement.executeQuery();

            //checking that the result set hold values
            while (staffResults.next()) {
                //getting the username value in the field returned
                staffExists = staffResults.getString("staffName");
                staffID = staffResults.getString("staffID");
            }
            //closing the result set
            staffResults.close();
        }
        
        try (PreparedStatement staffStatement = dbconnect.getConnection().prepareStatement("SELECT * FROM log WHERE staffID = ?")) {
            staffStatement.setString(1, username);
            
            //executing the prepared statement and storing the results in the ResultSet
            staffResults = staffStatement.executeQuery();

            //checking that the result set hold values
            while (staffResults.next()) {
                //getting the username value in the field returned
                staffLastLogin = staffResults.getString("TimeDate");
                staffFailedLog = staffResults.getString("failedLogins");
            }
            //closing the result set
            staffResults.close();
        }
        
        if (staffExists.length() >= 1) {
            staff = true;
        }
        
        if (adminExists.length() >= 1){
            admin = true;
        }
        
        //checking if the login returned true
        if(admin){
            //creating a new session object
            HttpSession session = request.getSession();
            //creating a new attribute to hold that a user is logged in
            session.setAttribute("user", adminExists);
            session.setAttribute("failedLog", adminFailedLog);
            session.setAttribute("userID", adminID);
            session.setAttribute("lastLog", adminLastLogin);
            session.setAttribute("numSales", "59");
            session.setAttribute("totalSales", "R 20000");
            session.setAttribute("clearance", "1");
            //redirecting the page to the login homepage
            response.sendRedirect("index.jsp?user=" + adminExists);
        } else if (staff) {
            //creating a new session object
            HttpSession session = request.getSession();
            //creating a new attribute to hold that a user is logged in
            session.setAttribute("user", staffExists);
            session.setAttribute("failedLog", staffFailedLog);
            session.setAttribute("userID", staffID);
            session.setAttribute("lastLog", staffLastLogin);
            session.setAttribute("numSales", "59");
            session.setAttribute("totalSales", "R 4000000");
            session.setAttribute("clearance", "2");
            //redirecting the page to the login homepage
            response.sendRedirect("index.jsp?user=" + staffExists);
        } else {
            //if the login was false, redirecting to the index page
            response.sendRedirect("login.jsp#error");
        }
        
        out.close();
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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

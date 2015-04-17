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
 * @author tej
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String exists = "";
        boolean correct = false;

        //getting the username parameter from the request object
        String username = request.getParameter("username");
        //getting the password parameter from the request object
        String password = request.getParameter("password");
        ResultSet results;
        mysqlconnect dbconnect = new mysqlconnect();
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        try (
                PreparedStatement loginStatement = dbconnect.getConnection().prepareStatement("SELECT contactName, email, password FROM company WHERE email = ? AND password = ?")) {
            loginStatement.setString(1, username);
            //setting the first placeholder to the password recieved from the client
            loginStatement.setString(2, password);
            //executing the prepared statement and storing the results in the ResultSet
            results = loginStatement.executeQuery();

            //checking that the result set hold values
            while (results.next()) {
                //getting the username value in the field returned
                exists = results.getString("contactName");
            }
            //closing the result set
            results.close();
        }
        if (exists.length() >= 1) {
            correct = true;
        }
        //checking if the login returned true
        if (correct) {
            //creating a new session object
            HttpSession session = request.getSession();
            //creating a new attribute to hold that a user is logged in
            session.setAttribute("user", exists);
            //redirecting the page to the login homepage
            response.sendRedirect("loggedin.jsp?user=" + exists);
        } else {
            //if the login was false, redirecting to the index page
            response.sendRedirect("index.jsp#error");
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

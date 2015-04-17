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
public class ViewEmployees extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        //getting the username parameter from the request object
        String getEmployees = "<table class=\"tablecontents\" style='top:120px;position:absolute;width:900px;'><thead><tr><th><h1>Staff Name</h1></th><th><h1>Staff Surname</h1></th><th style=\"width:50px;\"><h1>Email</h1></th><th><h1>Work Attendance</h1></th></tr></thead><tbody>";

        String staffEmail;
        String staffName;
        String staffSurname;
        String attendance;
        int check = 0;

        ResultSet stockResults;

        mysqlconnect dbconnect = new mysqlconnect();
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        try (PreparedStatement compStatement = dbconnect.getConnection().prepareStatement("SELECT * FROM staff")) {

            //executing the prepared statement and storing the results in the ResultSet
            stockResults = compStatement.executeQuery();

            //checking that the result set hold values
            while (stockResults.next()) {
                check++;
                staffName = stockResults.getString("staffName");
                staffSurname = stockResults.getString("staffSurname");
                staffEmail = stockResults.getString("staffID");
                attendance = stockResults.getString("attendance");
                getEmployees = getEmployees + "<tr>" + "<td style=\"width: 90px;\">" + staffName + "</td>" + "<td style=\"width: 130px;\">" + staffSurname + "</td>" + "<td>" + staffEmail + "</td>" + "<td style=\"width: 180px;\">" + attendance + "</td>" + "</tr>";
            }
            getEmployees = getEmployees + "</tbody></table>";
            //closing the result set
            stockResults.close();
        }

        if (check > 0) {
            //creating a new session object
            HttpSession session = request.getSession();
            //creating a new attribute to hold that a user is logged in
            session.setAttribute("viewEmployees", getEmployees);
            //redirecting the page to the login homepage
            response.sendRedirect("view-employees.jsp");
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

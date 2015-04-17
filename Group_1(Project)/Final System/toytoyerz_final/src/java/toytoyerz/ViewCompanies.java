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
public class ViewCompanies extends HttpServlet {

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
        String getStock = "<table class=\"tablecontents\" style='top:120px;position:absolute;width:900px;'><thead><tr><th><h1>Company</h1></th><th><h1>Contact Person</h1></th><th><h1>Company Address</h1></th><th><h1>Telephone</h1></th><th><h1>Email</h1></th></tr></thead><tbody>";

        String companyName;
        String contactPer;
        String companyAdd;
        String telephone;
        String email;
        String fax;
        int check = 0;

        ResultSet stockResults;

        mysqlconnect dbconnect = new mysqlconnect();
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        try (PreparedStatement compStatement = dbconnect.getConnection().prepareStatement("SELECT * FROM company")) {

            //executing the prepared statement and storing the results in the ResultSet
            stockResults = compStatement.executeQuery();

            //checking that the result set hold values
            while (stockResults.next()) {
                check++;
                companyName = stockResults.getString("companyName");
                contactPer = stockResults.getString("contactName");
                companyAdd = stockResults.getString("companyAddress");
                telephone = stockResults.getString("telno");
                email = stockResults.getString("email");
                fax = stockResults.getString("fax");
                getStock = getStock + "<tr>" + "<td style=\"width: 180px;\">" + companyName + "</td>" + "<td style=\"width: 150px;\">" + contactPer + "</td>" + "<td>" + companyAdd + "</td>" + "<td style=\"width: 160px;\">" + telephone + "</td>" + "<td>" + email + "</td>" + "</tr>";
            }
            getStock = getStock + "</tbody></table>";
            //closing the result set
            stockResults.close();
        }

        if (check > 0) {
            //creating a new session object
            HttpSession session = request.getSession();
            //creating a new attribute to hold that a user is logged in
            session.setAttribute("viewCompanies", getStock);
            //redirecting the page to the login homepage
            response.sendRedirect("view-companies.jsp");
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

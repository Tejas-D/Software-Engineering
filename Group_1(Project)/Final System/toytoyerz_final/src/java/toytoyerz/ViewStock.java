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
public class ViewStock extends HttpServlet {

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
        String getStock = "<table class=\"tablecontents\" style='top:120px;position:absolute;width:950px;'><thead><tr><th><h1>Product Name</h1></th><th><h1>Product Description</h1></th><th><h1>Price</h1></th><th><h1>Barcode</h1></th><th><h1>VAT</h1></th><th><h1>Quantity</h1></th></tr></thead><tbody>";

        String productID;
        String productName;
        String productDes;
        double price;
        int barcode;
        String vat;
        double costPrice;
        double markup;
        String image;
        int quantity;
        String categoryID;
        int check = 0;

        ResultSet stockResults;

        mysqlconnect dbconnect = new mysqlconnect();
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        try (PreparedStatement stockStatement = dbconnect.getConnection().prepareStatement("SELECT * FROM products")) {

            //executing the prepared statement and storing the results in the ResultSet
            stockResults = stockStatement.executeQuery();

            //checking that the result set hold values
            while (stockResults.next()) {
                check++;
                productName = stockResults.getString("productName");
                productDes = stockResults.getString("productDescription");
                price = stockResults.getDouble("price");
                barcode = stockResults.getInt("barcode");
                vat = stockResults.getString("vat");
                quantity = stockResults.getInt("quantity");
                categoryID = stockResults.getString("categoryID");
                getStock = getStock + "<tr>" + "<td>" + productName + "</td>" + "<td>" + productDes + "</td>" + "<td style=\"width: 100px;\">" + price + "</td>" + "<td style=\"width: 150px;\">" + barcode + "</td>" + "<td style=\"width: 100px;\">" + vat + "</td>" + "<td style=\"width: 150px;\">" + quantity + "</td>" + "</tr>";
            }
            getStock = getStock + "</tbody></table>";
            //closing the result set
            stockResults.close();
        }

        if (check > 0) {
            //creating a new session object
            HttpSession session = request.getSession();
            //creating a new attribute to hold that a user is logged in
            session.setAttribute("viewStock", getStock);
            //redirecting the page to the login homepage
            response.sendRedirect("view-stock.jsp");
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

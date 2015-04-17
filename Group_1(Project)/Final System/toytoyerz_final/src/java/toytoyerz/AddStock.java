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
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RD
 */
public class AddStock extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        boolean added = false;

        mysqlconnect dbconnect = new mysqlconnect();
        PrintWriter out = response.getWriter();
        //getting the parameters required for registration and checking if they are empty or not
        String productID = request.getParameter("prodID").trim();
        String productName = request.getParameter("prodName").trim();
        String prodDesc = request.getParameter("prodDesc").trim();
        String price = request.getParameter("price").trim();
        String barcode = request.getParameter("barcode").trim();
        String vat = request.getParameter("vat").trim();
        String costPrice = request.getParameter("costPrice").trim();
        String markup = request.getParameter("markup").trim();
        String image = "unspecified";
        String quantity = request.getParameter("quantity").trim();
        String categoryID = request.getParameter("cat").trim();
        
        try {
            int addRows;
            String emailExist = "";
            //creating a prepared statement to select email address that may be the same as the variable recieved from the client
            PreparedStatement prepState;

            /*
             *checking if the string variable emailExists contains anything
             */
            if (emailExist.equals("")) {
                //creating another prepared statement to add the user details to the database
                prepState = dbconnect.getConnection().prepareStatement("INSERT INTO products(productID, productName, productDescription, price, barcode, vat, costPrice, markup, image, quantity, categoryID) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
                prepState.setString(1, productID);
                prepState.setString(2, productName);
                prepState.setString(3, prodDesc);
                prepState.setInt(4, Integer.valueOf(price));
                prepState.setInt(5, Integer.valueOf(barcode));
                prepState.setString(6, vat);
                prepState.setInt(7, Integer.valueOf(costPrice));
                prepState.setInt(8, Integer.valueOf(markup));
                prepState.setString(9, image);
                prepState.setInt(10, Integer.valueOf(quantity));
                prepState.setString(11, categoryID);
                //executing the preparedStatement
                addRows = prepState.executeUpdate();
                //returning true
                added = true;
            } else {
                added = false;
            }
            if (added) {
                response.sendRedirect("add-stock.jsp#added");
            }
            //catching any SQL Execptions that might occur
        } catch (SQLException sql) {
            System.out.println("WebServiceError -> SQL Exception - on adding user : CAT ID = " + categoryID);
            response.sendRedirect("add-stock.jsp#errorAdd");
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

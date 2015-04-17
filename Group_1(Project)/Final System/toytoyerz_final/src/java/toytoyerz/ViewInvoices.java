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
public class ViewInvoices extends HttpServlet {

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
        String getStock = "<table class=\"tablecontents\" style='top:120px;position:absolute;width:950px;'><thead><tr><th><h1>Invoice ID</h1></th><th><h1>Invoice Date</h1></th><th><h1>Sale Amount</h1></th><th><h1>Company ID</h1></th></tr></thead><tbody>";

        String invoiceID;
        String invoiceDate;
        double salesAmount;
        String companyID;
        int check = 0;
        String invoicePopups = "";
        String companyPopups = "";
        ResultSet stockResults;

        mysqlconnect dbconnect = new mysqlconnect();
        /* TODO output your page here. You may use following sample code. */
        try (PreparedStatement stockStatement = dbconnect.getConnection().prepareStatement("SELECT * FROM invoice")) {

            //executing the prepared statement and storing the results in the ResultSet
            stockResults = stockStatement.executeQuery();

            //checking that the result set hold values
            while (stockResults.next()) {
                check++;
                invoiceID = stockResults.getString("invoiceID");
                invoiceDate = String.valueOf(stockResults.getDate("invoiceDate"));
                salesAmount = stockResults.getDouble("salesAmount");
                companyID = stockResults.getString("companyID");
                companyPopups = companyPopups + getCompanyDetails(companyID);
                invoicePopups = invoicePopups + getProductDetails(invoiceID);
                getStock = getStock + "<tr>" + "<td><a href=\"view-invoices.jsp#" + invoiceID + "\">" + invoiceID + "</td>" + "<td>" + invoiceDate + "</td>" + "<td>" + salesAmount + "</td>" + "<td> <a href=\"view-invoices.jsp#" + companyID + "\">" + companyID + "</td>" + "</tr>";
            }
            
            getStock = getStock + "</tbody></table>";
            //closing the result set
            stockResults.close();
        }
        

        if (check > 0) {
            //creating a new session object
            HttpSession session = request.getSession();
            //creating a new attribute to hold that a user is logged in
            session.setAttribute("viewInvoices", getStock);
            session.setAttribute("invoiceDetails", invoicePopups);
            session.setAttribute("companyDetails", companyPopups);
            //redirecting the page to the login homepage
            response.sendRedirect("view-invoices.jsp");
        }
    }
    
    protected String getCompanyDetails(String compID){
        
        //getting the username parameter from the request object
        String details;

        String companyName;
        String contactPer;
        String companyAdd;
        String telephone;
        String email;
        String fax;
        String popup = "";
        int check = 0;

        ResultSet stockResults;

        mysqlconnect dbconnect = new mysqlconnect();
        /* TODO output your page here. You may use following sample code. */
        try (PreparedStatement compStatement = dbconnect.getConnection().prepareStatement("SELECT * FROM company WHERE companyID = '" + compID + "'")) {

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
                popup = popup + "<a href=\"#x\" class=\"overlay\" id=\"" + compID + "\"></a><div class=\"popup\"><div>" + "<h2>Company Name: </h2>" + companyName + "<br/>" + "<h2>Company Person: </h2>" + contactPer + "<br/>" + "<h2>Company Address: </h2>"  + companyAdd + "<br/>" + "<h2>Company Tele: </h2>"  + telephone + "<br/>" + "<h2>Company Email: </h2>"  +  email + "<br/><br/>" + "<a href=\"#close\"><input type=\"button\" value=\"Close\"/></a></div></div>" ;
            }
            //closing the result set
            stockResults.close();
        }catch(SQLException sqle){
            
        }

        if (check > 0) {
            return popup;
        }
        
        return "";
    }
    
    protected String getProductDetails(String invID){
        
        //getting the username parameter from the request object
        String details;

        String productID;
        String productName;
        String productDesc;
        String quantity;
        String price;

        String popup = "<a href=\"#x\" class=\"overlay\" id=\"" + invID + "\"></a><div class=\"popup\"><div><table><thead><tr><h1><th>Product ID</th><th>Product Name</th><th>Product Desc</th><th>Price</th><th>Quantity</th></h1></tr><tbody>" ;
        int check = 0;

        ResultSet stockResults;

        mysqlconnect dbconnect = new mysqlconnect();
        /* TODO output your page here. You may use following sample code. */
        try (PreparedStatement compStatement = dbconnect.getConnection().prepareStatement("SELECT invoicelist.productID, productName, price, productDescription, invoicelist.quantity FROM invoicelist INNER JOIN products ON invoicelist.productID = products.productID WHERE invoicelist.invoiceID = \"" + invID + "\"")) 
        {

            //executing the prepared statement and storing the results in the ResultSet
            stockResults = compStatement.executeQuery();

            //checking that the result set hold values
            while (stockResults.next()) {
                check++;
                productID = stockResults.getString("invoicelist.productID");
                productName = stockResults.getString("productName");
                price = stockResults.getString("price");
                productDesc = stockResults.getString("productDescription");
                quantity = stockResults.getString("invoicelist.quantity");
                popup = popup + "<tr><th>" + productID + "</th><th>" + productName + "</th><th>" + productDesc + "</th><th>" + price + "</th><th>" +  quantity + "</th></tr>" ;
            }
            popup = popup + "</tbody></table><a href=\"#close\"><input type=\"button\" value=\"Close\"/></a></div></div>";
            //closing the result set
            stockResults.close();
        }catch(SQLException sqle){
            
        }

        if (check > 0) {
            return popup;
        }
        
        return "";
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

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
 * @author tej
 */
public class RegisterServlet extends HttpServlet {

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
        String companyName = request.getParameter("companyname").trim();
        String companyAddress = request.getParameter("companyaddress").trim();
        String name = request.getParameter("contactname").trim();
        String surname = request.getParameter("contactsurname").trim();
        String tele = request.getParameter("telenumber").trim();
        String accNo = request.getParameter("accountnumber").trim();
        String swiftCode = request.getParameter("swiftcode").trim();
        String vat = request.getParameter("vat").trim();
        String fax = request.getParameter("faxnumber").trim();
        String tax = request.getParameter("taxno").trim();
        String email = request.getParameter("email").trim();
        String pass = request.getParameter("pass").trim();
        String passconf = request.getParameter("conpass").trim();

        boolean allContents = true;

        //creating an array of all the variables
        String[] allArray = {name, surname,
            tele, email, accNo, swiftCode, vat, fax, pass, passconf, tax,};
        //creating an array of the months of the year
        //sotring default values to represent the data
        String[] values = {"Company Name", "Contact Name", "Contact Surnam", "Company Address",
            "Telephone Number", "Email", "Account Number", "Swift Code",
            "VAT No.", "Security Answer", "Fax No", "Password", "Confirm Password", "Tax No"};

        String errors = "";

        boolean contents = false;
        /*
         * For loop to check each value
         * for illegal characters
         */
        for (int x = 0; x < allArray.length; x++) {
            //Regex to check for illegal matches
            if (!Pattern.matches("[.+?@.+?\\.{1}.+?\\w]+", allArray[x])) {
                //adding the number to errors found
                errors = errors + "0";
                //setting the boolean variable to false, because of an error
                allContents = false;
                break;
            }
        }

        /*
         *If statement to check that the length of the password
         *is good
         */
        if (fax.length() < 9) {
            //adding the number to errors found
            errors = errors + "6";
            //setting the boolean variable to false, because of an error
            allContents = false;
        }

        /*
         *If statement to check that the length of the password
         *is good
         */
        if (pass.length() < 8 || pass.length() > 28) {
            //adding the number to errors found
            errors = errors + "7";
            //setting the boolean variable to false, because of an error
            allContents = false;
        }

        /*
         *If Statement to check that the name only contains letters
        
        if (!Pattern.matches("[A-Za-z]+", companyName)) {
            //adding the number to errors found
            errors = errors + "1";
            //setting the boolean variable to false, because of an error
            allContents = false;
        }*/

        /*
         *If Statement to check that the surname only contains letters
         */
        if (!Pattern.matches("[A-Za-z]+", name)) {
            //adding the number to errors found
            errors = errors + "2";
            //setting the boolean variable to false, because of an error
            allContents = false;
        }

        /*
         *If Statement to check that the surname only contains letters
         */
        if (!Pattern.matches("[A-Za-z]+", surname)) {
            //adding the number to errors found
            errors = errors + "3";
            //setting the boolean variable to false, because of an error
            allContents = false;
        }

        /*
         *If statement to check that the length of the password
         *is good
         */
        if (tele.length() < 10 || pass.length() > 10) {
            //adding the number to errors found
            errors = errors + "4";
            //setting the boolean variable to false, because of an error
            allContents = false;
        }

        /*
         *If Statement to check that the email address contains "@" and "."
         */
        if (!Pattern.matches(".+?@.+?\\.{1}.+?", email)) {
            //adding the number to errors found
            errors = errors + "5";
            //setting the boolean variable to false, because of an error
            allContents = false;
        }

        /*
         *If statement to check if the passwords match eachother
         */
        if (!pass.equals(passconf)) {
            //adding the number to errors found
            errors = errors + "8";
            //setting the boolean variable to false, because of an error
            allContents = false;
        }
        if (allContents) {
            try {
                int addRows;
                String emailExist = "";
                //creating a prepared statement to select email address that may be the same as the variable recieved from the client
                PreparedStatement prepState = dbconnect.getConnection().prepareStatement("SELECT email FROM company WHERE email = ?");
                //setting the first placeholder to the email variable recieved from the client
                prepState.setString(1, email);
                //storing the returned results from the statement in a resultset
                ResultSet rs = prepState.executeQuery();

            //checking if there are any values in the result set
                //to check for matches
                while (rs.next()) {
                    emailExist = rs.getString("email");
                }

                //closing the resultset
                rs.close();
                //closing the prepared statement
                prepState.close();
                /*
                 *checking if the string variable emailExists contains anything
                 */
                if (emailExist.equals("")) {
                    //creating another prepared statement to add the user details to the database
                    prepState = dbconnect.getConnection().prepareStatement("INSERT INTO company(companyName, contactName, contactSurname, companyAddress, telNo, email, accNumber, swiftCode, vatNum, fax, password, taxno) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
                    prepState.setString(1, companyName);
                    prepState.setString(2, name);
                    prepState.setString(3, surname);
                    prepState.setString(4, companyAddress);
                    prepState.setString(5, tele);
                    prepState.setString(6, email);
                    prepState.setInt(7, Integer.valueOf(accNo));
                    prepState.setInt(8, Integer.valueOf(swiftCode));
                    prepState.setString(9, vat);
                    prepState.setString(10, fax);
                    prepState.setString(11, pass);
                    prepState.setInt(12, Integer.valueOf(tax));
                    //executing the preparedStatement
                    addRows = prepState.executeUpdate();
                    //returning true
                    added = true;
                } else {
                    added = false;
                }
                if (added) {
                    //creating a new session object
                    HttpSession session = request.getSession();
                    //creating a new attribute to hold that a user is logged in
                    session.setAttribute("user", name);
                    //redirecting to the new user page
                    response.sendRedirect("loggedin.jsp?user=" + name);
                } else {
                    //redirecting back to the register page
                    response.sendRedirect("index.jsp?exist=1#register");
                }
                //catching any SQL Execptions that might occur
            } catch (SQLException sql) {
                System.out.println("WebServiceError -> SQL Exception - on adding user : " + sql.toString());
            }
        } else {
            //redirecting to the register page with errors
            response.sendRedirect("index.jsp?errors=" + errors + "#register");
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

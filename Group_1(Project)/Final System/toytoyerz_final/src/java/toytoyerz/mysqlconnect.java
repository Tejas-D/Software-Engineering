/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package toytoyerz;

/**
 *
 * @author tej
 */
//importing the relevant libraries
import java.io.Serializable;
import java.sql.*;

/*
 * 	Creating the bean class and implementing the serializable
 *	class
 */
public final class mysqlconnect implements Serializable {
    private Connection connection;
    private static final String dbURL = "jdbc:mysql://localhost:3306/toytoyerz";
    private static final String driver = "com.mysql.jdbc.Driver";
    static final String user = "root";
    static final String pass = "admin";
    
        /*
         *	Creating the constructor for the bean
         */
    public mysqlconnect() {
        makeConnection();
    }
    
        /*
         *	Creating the method to check if a connection is on
         *	@param null
         *	@return Connection type object
         */
    public Connection getConnection() {
        //checking if the connection variable has been created or not
        if(connection == null) {
            makeConnection();
        }
        return connection;
    }
    
        /*
         *	Creating the method to stop the connection
         *	@param Boolean variable of state of connection
         *	@return Null
         */
    public void setCloseConnection(boolean close) {
        //if the connection is true
        if(close) {
            try {
                //close the connection
                connection.close();
            } catch(SQLException e) {
                connection = null;
            }
        }
    }
    
        /*
         *	Creating the method to create a connection
         *	@param null
         *	@return null
         */
    public void makeConnection() {
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(dbURL, user, pass);
            System.out.println("Successful");
        } catch(SQLException sqle) {
            System.out.println("Web Service Error -> SQL Exception on making db connection : " + sqle);
        } catch(ClassNotFoundException cnfe) {
            System.out.println("Web Service Error -> ClassNotFound Exception on making db connection : " + cnfe);
        }
    }
}/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
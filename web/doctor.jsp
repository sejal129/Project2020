<%-- 
    Document   : doctor
    Created on : 27 Feb, 2020, 10:10:54 PM
    Author     : Admin
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
         <link rel="stylesheet" type="text/css" href="newcss5.css">
        <title>JSP Page</title>
        


    </head>
    <body>
         <header style="background-color:#2c4999">
         <h1>Academic Hub</h1>
          
	  <div id="container">
              <ul>
                   
                  <li>
                     <a href="aboutusdoc.jsp">About Us</a>
                      
                  </li>
                  <li>FAQ</li>
                 
              </ul>
          </div>
           
	      
           
   </header>
       
        <div class="register">
<h2>WELCOME  DOCTOR!</h2>
        <form method="post" id="register" action="">
	    <label>Exam RollNo</label><br>
            <input type="text" name="txtrollno" id="rollno" placeholder="Enter your rollno"><br><br>  	
            <label>Give Recommendation</label><br>                  
            <textarea name="recom" rows="6" cols="20" placeholder="Give Recommendation">
</textarea><br><br>
              <input type="submit" name="btnview" value="View" id="butt">
            <input type="submit" name="btninsert" value="Insert" id="butt1">
    </body>
</html>
<%
   try
   {
        if(request.getParameter("btnview")!=null)
        {
             Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/Pro","pro","pro");
        Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("Select * from medical_details");
            %>
         
            <table border = "1" cellpadding="5" margin-left="500px">
                <thead>
                <th>Exam Roll Number</th>
                <th>Student Name</th>
                <th>Height</th>
                <th>Weight</th>
                <th>Date Of Birth</th>
                <th>Medical History</th>
                </thead>
                <%
                    while(rs.next())
                    {
                        %>
                        <tr>
                            <td>
                                <%
                                    out.println(rs.getInt(1));
                                    %>
                            </td>
                           
                             <td>
                                <%
                                    out.println(rs.getString(3));
                                    %>
                                    
                            </td>
                            <td>
                                <%
                                    out.println(rs.getInt(4));
                                    %>
                                    
                            </td>
                            <td>
                                <%
                                    out.println(rs.getInt(5));
                                    %>
                                    
                            </td>
                            <td>
                                <%
                                    out.println(rs.getString(6));
                                    %>
                                    
                            </td>
                            <td>
                                <%
                                    out.println(rs.getString(7));
                                    %>
                                    
                            </td>
                        
                        </tr>
                        <%
                    }
                 %>
            </table>
            <%
        }
        if(request.getParameter("btninsert")!=null)
        {
             Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/Pro","pro","pro");
        Statement stmt=conn.createStatement();
            int roll;
          roll=Integer.parseInt(request.getParameter("txtrollno"));
          String r=request.getParameter("recom");

         int x=stmt.executeUpdate("update medical_details set recomm = '"+r+"' where examrollno = "+roll+"");
        if(x>0)
           {
               out.println("Record Inserted Successfully");
            }
        else
            {
               out.println("Error");
            }
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
    %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%
try 
{


   
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "");
    Statement st = con.createStatement();
    st.executeUpdate("insert into students values ('"+name+"','"+password+"','"+email+"')");
    String query ="select * from students";
    ResultSet rs = st.executeQuery(query);
    while(rs.next())
    {
        String namev =rs.getString(1);
        String passwordv =rs.getString(2);
        String emailv = rs.getString(3);
        out.println(namev);
        out.println("<br>");
        out.println(passwordv);
        out.println("<br>");
        out.println(emailv);
    }
   



} catch(Exception e)
    {
        out.println(e);
    }
%>
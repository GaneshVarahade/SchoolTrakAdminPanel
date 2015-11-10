<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
 
            String sn=request.getParameter("ver");
 
                      Class.forName("com.mysql.jdbc.Driver"); 
     java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fidelit",
"root","root");
                   
                   Statement st=con.createStatement();
                   
                   
                   //String hql = "FROM employee E WHERE E.userName = '"+sn+"'";
                   //Query query = session.createQuery(hql);
                   //List rs = query.list();
                   
            
                    //ResultSet rs = st.executeQuery("select * from emp where empno="+sn);
                    ResultSet rs = st.executeQuery("select * from emp where empname='"+sn+"'");  // this is for name
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("Name already taken");
                        out.println("</font>");
 
                    }else {
 
                        out.println("<font color=green>");
                        out.println("Available");
                        out.println("</font>");
 
                    }
 
rs.close();
st.close();
con.close();
 
%>
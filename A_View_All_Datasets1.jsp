<style type="text/css">
<!--
.style1 {color: #FFFF00}
.style5 {font-weight: bold}
.style6 {font-weight: bold}
.style7 {font-weight: bold}
-->
</style>
			<table width="2000" height="110" border="3" align="left"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse;  margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
        <tr>			  

 <th height="35" bgcolor="#FF0000"><span class="style1 style5 style6 style10"><strong>Tid</strong></span></th>	
 <th height="35" bgcolor="#FF0000"><span class="style1 style5 style6 style10"><strong>Symbol</strong></span></th>	
 <th height="35" bgcolor="#FF0000"><span class="style1 style5 style6 style10"><strong>Name</strong></span></th>	
 <th height="35" bgcolor="#FF0000"><span class="style1 style5 style6 style10"><strong>TransPrice </strong></span></th>	
 <th height="35" bgcolor="#FF0000"><span class="style1 style5 style6 style10"><strong>Transdate</strong></span></th>	
 <th height="35" bgcolor="#FF0000"><span class="style1 style5 style6 style10"><strong>CirculatingSupply</strong></span></th>	
 <th height="35" bgcolor="#FF0000"><span class="style1 style5 style6 style10"><strong>Tpstatus</strong></span></th>	
 <th height="35" bgcolor="#FF0000"><span class="style1 style5 style6 style10"><strong>Transstatus</strong></span></th>
 <th height="35" bgcolor="#FF0000"><span class="style1 style5 style6 style10"><strong>TransTypeHashcode</strong></span></th>
        </tr>
            <%@ include file="connect.jsp" %>
            <%
String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12;
int i=0,rank=0;
try 
{
	String query="select * from datasets"; 
	Statement st=connection.createStatement();
	ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	{
		i=rs.getInt(1);
		s1=rs.getString(2);
		s2=rs.getString(3);
		s3=rs.getString(4);
		s4=rs.getString(5);
		s5=rs.getString(6);
		s6=rs.getString(7);
		s7=rs.getString(8);
		s8=rs.getString(9);
		s9=rs.getString(10);
		
			%>
            <tr>
			 
              <td  width="87" height="31" align="center" valign="middle" ><span class="style7">
                <%out.println(s1);%>
              </span></td>
              <td  width="89" height="31" align="center" valign="middle"><span class="style7">
                <%out.println(s2);%>
              </span></td>
              <td  width="85" height="31" align="center" valign="middle"><span class="style7">
                <%out.println(s3);%>
              
              </span></td>
              <td  width="85" height="31" align="center" valign="middle"><span class="style7">
                <%out.println(s4);%>
              
              </span></td>
              <td  width="108" height="31" align="center" valign="middle"><span class="style7">
                <%out.println(s5);%>
              </span></td>
              <td  width="71" height="31" align="center" valign="middle"><span class="style7">
                <%out.println(s6);%>
              </span></td>
			   <td  width="87" height="31" align="center" valign="middle"><span class="style7">
                <%out.println(s7);%>
              </span></td>
			   <td  width="64" height="31" align="center" valign="middle"><span class="style7">
                <%out.println(s8);%>
              </span></td>
			   <td  width="89" height="31" align="center" valign="middle"><span class="style7">
                <%out.println(s9);%>
              </span></td>
			  
            </tr>
            <%
						}
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
      </table>
				</p>
          
        
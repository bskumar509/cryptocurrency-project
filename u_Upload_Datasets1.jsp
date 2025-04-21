<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>U_Upload_Datasets</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium600w.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style6 {
	font-size: 22px;
	color: #FF0000;
}
.style9 {color: #FFFF00; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
         <h1 class="style5"><a href="index.html" class="style6 style10">UCoin An Efficient Privacy Preserving Scheme for Cryptocurrencies
</a></h1>
      </div>
      <div class="searchform"></div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="314" alt="" /></a> <a href="#"><img src="images/slide2.jpg"  width="960" height="314" alt="" /></a> <a href="#"><img src="images/slide3.jpg"  width="960" height="314" alt="" /></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
      <div class="rss"></div>
      <div class="menu_nav">
        <ul>
          <li><span><a href="index.html">Home</a></span></li>
          <li><span><a href="Admin.jsp">Admin</a></span></li>
          <li class="active"><span><a href="User.html">User</a></span></li>
          <li><span><a href="Register.html">Register</a></span></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Upload Datasets !!! </span></h2>
          <div class="clr"></div>
          <p>&nbsp;</p>
          <p> 
		  
		 <%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
 
 
    <%@ page import ="java.io.FileNotFoundException" %>  
    <%@ page import ="java.io.IOException" %>  
    <%@ page import ="java.util.Iterator" %>  
    <%@ page import ="java.util.ArrayList" %> 
    <%@ page import="org.apache.poi.xssf.usermodel.*" %>
    <%@ page import ="org.apache.poi.hssf.usermodel.HSSFCell" %>  
    <%@ page import ="org.apache.poi.hssf.usermodel.HSSFRow" %>  
    <%@ page import ="org.apache.poi.hssf.usermodel.HSSFSheet" %>  
    <%@ page import ="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>  
    <%@ page import ="org.apache.poi.poifs.filesystem.POIFSFileSystem" %>
    <%@ page import="org.apache.poi.ss.usermodel.Cell" %>
    <%@ page import ="org.apache.poi.ss.usermodel.Row"%>
    <%@ page import="org.apache.poi.ss.usermodel.Sheet" %>
    <%@ page import="org.apache.poi.ss.usermodel.Workbook" %>
    <%@ page import ="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>

	
	
 
	
    <%
    try{
        
		String fname=request.getParameter("fname");
		
		String sql="delete from datasets";
		Statement stmt = connection.createStatement();
		stmt.executeUpdate(sql);
		
	   String Tid,Symbol,Name,TransPrice,Transdate,CirculatingSupply,Tpstatus,Transstatus;
		
       connection.setAutoCommit(false);
       PreparedStatement pstm = null ;
       FileInputStream input = new FileInputStream(getServletContext().getRealPath("/")+"//"+fname);
	  
	  
       POIFSFileSystem fs = new POIFSFileSystem(input); //creating a new poi reference to the given excel file
       HSSFWorkbook wb = new HSSFWorkbook(fs);
       HSSFSheet sheet = wb.getSheetAt(0);
       Row row;
       Statement st=connection.createStatement();
       for(int i=1; i<=sheet.getLastRowNum(); i++){  //points to the starting of excel i.e excel first row
           row = (Row) sheet.getRow(i);  //sheet number
		   
		   
	   		      if( row.getCell(0)==null) { Tid = "0";}  //suppose excel cell is empty then its set to 0 the variable
                  else Tid = row.getCell(0).toString();   //else copies cell data to name variable
 
                  if( row.getCell(1)==null) { Symbol = "0";}  //suppose excel cell is empty then its set to 0 the variable
                  else Symbol = row.getCell(1).toString();   //else copies cell data to name variable
				  
				  if( row.getCell(2)==null) { Name = "0";}
				  else Name = row.getCell(2).toString();
				  
				  if( row.getCell(3)==null) { TransPrice = "0";}
				  else TransPrice = row.getCell(3).toString();
				  
				  if( row.getCell(4)==null) { Transdate = "0";}
				  else Transdate = row.getCell(4).toString();
				  
				  if( row.getCell(5)==null) { CirculatingSupply= "0";}
				  else CirculatingSupply = row.getCell(5).toString();
				  
				  if( row.getCell(6)==null) { Tpstatus = "0";}
				  else Tpstatus= row.getCell(6).toString();
				  
				  if( row.getCell(7)==null) { Transstatus= "0";}
				  else Transstatus = row.getCell(7).toString();
				  
				 
					String filename="filename.txt";
      				PrintStream p = new PrintStream(new FileOutputStream(filename));
					p.print(new String(Transstatus));
			
					MessageDigest md = MessageDigest.getInstance("SHA1");
					FileInputStream fis11 = new FileInputStream(filename);
					DigestInputStream dis1 = new DigestInputStream(fis11, md);
					BufferedInputStream bis1 = new BufferedInputStream(dis1);
					//Read the bis so SHA1 is auto calculated at dis
					while (true) {
						int b1 = bis1.read();
						if (b1 == -1)
							break;
					}
 
					BigInteger bi1 = new BigInteger(md.digest());
					String spl1 = bi1.toString();
					String h1= bi1.toString(16);
					
					
				String keys = "ef50a0ef2c3e3a5f";
			    byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue,"AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE,key);
				String keyy = String.valueOf(keyValue);
				
      	        String Symbol1 = new String(Base64.encode(Symbol.getBytes()));
				String Name1 = new String(Base64.encode(Name.getBytes()));
				String TransPrice1 = new String(Base64.encode(TransPrice.getBytes()));
					
					
					
String sq="INSERT INTO datasets(Tid,Symbol,Name,TransPrice,Transdate,CirculatingSupply,Tpstatus,Transstatus,hcode)VALUES('"+Tid+"','"+Symbol1+"','"+Name1+"','"+TransPrice1+"', '"+Transdate+"','"+CirculatingSupply+"','"+Tpstatus+"','"+Transstatus+"','"+h1+"')";                   
 
           pstm = (PreparedStatement) connection.prepareStatement(sq);
           pstm.execute();
           
       }
       connection.commit();
       pstm.close();
       connection.close();
       input.close();
 
   }catch(Exception e){
       out.println(e);
   }
 
 
%>
		  <h2>Datasets Imported Successfully !!!</h2>
		  
		  
				</p>
                <p align="right"><a href="usermain.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li></li>
            <li><a href="index.html">Log Out</a><br />
            </li>
            <li></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
   
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>

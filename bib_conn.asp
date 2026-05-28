<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="bib_conn_example.asp"-->
<%
Dim conn, strDIASEMANA, strDIA, strMES, strANO, rsDataDIASEMANA, rsDataDIA, rsDataMES, rsDataANO

strDIASEMANA= "SELECT DATENAME(WEEKDAY, GETDATE()) AS DIASEMANA"
strDIA    	= "SELECT CONVERT (CHAR (2), day (GetDate ())) AS DIA"
strMES    	= "SELECT CASE DATEPART(MONTH, GetDate()) WHEN 1 THEN 'Janeiro' WHEN 2 THEN 'Fevereiro' WHEN 3 THEN 'Março' WHEN 4 THEN 'Abril' WHEN 5 THEN 'Maio' WHEN 6 THEN 'Junho' WHEN 7 THEN 'Julho' WHEN 8 THEN 'Agosto' WHEN 9 THEN 'Setembro' WHEN 10 THEN 'Outubro' WHEN 11 THEN 'Novembro' WHEN 12 THEN 'Dezembro' END AS MES"
strANO    	= "SELECT CONVERT (CHAR (4), year (GetDate ())) AS ANO"

Call abre_conn
Set rsDataDIASEMANA	= conn.Execute(strDIASEMANA)
Set rsDataDIA	  	= conn.Execute(strDIA)
Set rsDataMES	  	= conn.Execute(strMES)
Set rsDataANO	  	= conn.Execute(strANO)
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Portal - Sistema de Gestão</title>
<link rel="shortcut icon" href="Imagens/icon.ico">
<link href="css/footer.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
	margin-top: 0px;
	background-color: #4E79AF;
}
</style>
<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css">
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>

<div class="container">

	<div class="header"><a href="index.asp"><img src="Imagens/Logo_Brasao.jpg" alt="Logotipo" width="96" height="96" id="Insert_logo" style="" /></a>
    
    <div class="headertext">
    <h2>Secretaria da Administração</h2>
    </div>
    
  	<div class="headersubtitulo">
    <strong>Centro de Gestão</strong>
    </div>
    <div class="datahora">
	<p><strong><%=rsDataDIASEMANA("DIASEMANA")%>, <%=rsDataDIA("DIA")%> de <%=rsDataMES("MES")%> de <%=rsDataANO("ANO")%></strong></p>
    </div>  

   
    <div class="header2"><a href="index.asp"><img src="Imagens/Logo_Brasao.jpg" alt="Logotipo" width="96" height="96" id="Insert_logo2" style="" /></a>
    </div>
<!-- end .header --></div>
    
  
  
  
<div class="sidebar1">
<div align="left">

	<ul id="MenuBar1" class="MenuBarVertical">
        
        <li><strong><a href="index.asp">Iniciar</a></strong></li>
        <li><strong><a onClick="javascript:history.go(-1)">Voltar</a></strong></li>
		<li><strong><a href="cadastro.asp">Cadastros</a></strong></li>
        <li><strong><a href="pesquisar.asp">Pesquisar</a></strong></li>
	    <li><strong><a href="incluir.asp">Incluir</a></strong></li>
	</ul>
 </div>
  <!-- end .sidebar1 --></div>
  
  
  
  
  
 <div class="content">
     <div class="box_inicial"><!-- Páginas aqui-->
     		<div class="box_titulo">         
       		<b>Dados Cadastrais do Sistema</b>
       		</div>
       
       
<p align="center">&nbsp;</p>
<!-- end .bloco_inicial --></div>
<!-- end .content --></div>


<div class="footer">
    	<p><strong>Centro de Gestão</strong></p>
    	<p>Endereço institucional - Cidade - Estado</p>
      	<p>CEP 00000-000 – Telefone: (00) 0000-0000</p>

<!-- end .footer --></div>
<!-- end .container --></div>


<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>

<% 
Call fecha_conn
set rsDataDIASEMANA = nothing 
set rsDataDIA 		= nothing 
set rsDataMES 		= nothing 
set rsDataANO 		= nothing 
%>

</body>
</html>

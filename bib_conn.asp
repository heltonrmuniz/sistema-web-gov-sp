<%
' ===================================================
' CONEXÃO COM BANCO DE DADOS - VIA VARIÁVEIS DE AMBIENTE
' ===================================================
' As credenciais reais são lidas das variáveis de ambiente do servidor
' Este arquivo pode ser publicado com segurança no GitHub
' ===================================================

Sub abre_conn
    Dim strConn
    
    ' Lê as variáveis de ambiente configuradas no IIS/Servidor
    Dim strServer, strDatabase, strUser, strPassword
    
    strServer   = Server.CreateObject("WScript.Shell").Environment("Process").Item("DB_SERVER")
    strDatabase = Server.CreateObject("WScript.Shell").Environment("Process").Item("DB_DATABASE")
    strUser     = Server.CreateObject("WScript.Shell").Environment("Process").Item("DB_USER")
    strPassword = Server.CreateObject("WScript.Shell").Environment("Process").Item("DB_PASSWORD")
    
    ' Se as variáveis não existirem, use valores padrão (apenas para desenvolvimento)
    If strServer = "" Then strServer = "localhost\SQLEXPRESS"
    If strDatabase = "" Then strDatabase = "NomeDoBanco"
    If strUser = "" Then strUser = "usuario"
    If strPassword = "" Then strPassword = "senha"
    
    strConn = "Provider=SQLOLEDB;Data Source=" & strServer & ";Database=" & strDatabase & ";user Id=" & strUser & ";pwd=" & strPassword
    
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open strConn
End Sub

Sub fecha_conn
    conn.Close
    Set conn = Nothing
End Sub
%>
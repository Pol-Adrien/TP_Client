<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dto.Ville"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Villes</title>
</head>
<body>
	<a href="index.jsp"> Retour </a>
	<br>
	<br>
	<a href="AfficherVilles?page=
		<%
			HttpSession sess = request.getSession();
			Integer pages = (Integer) sess.getAttribute("numPage");
			if (pages > 1) {
				pages--;
			}
		%>
		<%=pages%>">Previous</a>
	<a href="AfficherVilles?page=
		<% 
			sess = request.getSession();
			pages = (Integer) sess.getAttribute("numPage") + 1;
		%>
		<%=pages%>">Next</a>
	
	<h1>Liste des villes :</h1>
	<table>
		<tr>
			<th>Code Commune INSEE</th>
			<th>Nom Ville</th>
			<th>Code Postal</th>
			<th>Libellé Acheminement</th>
			<th>Ligne 5</th>
			<th>Latitude</th>
			<th>Longitude</th>
			<th></th>
		</tr>
		<%
			List<Ville> villes = (List<Ville>) sess.getAttribute("villesPage");
			for (Ville ville : villes) {
		%>
		<tr>
			<td><%=ville.getCodeCommune()%></td>
			<td><%=ville.getNomCommune()%></td>
			<td><%=ville.getCodePostal()%></td>
			<td><%=ville.getLibelleAcheminement()%></td>
			<td><%=ville.getLigne5()%></td>
			<td><%=ville.getLatitude()%></td>
			<td><%=ville.getLongitude()%></td>
			<td>
				<a href="ModifierVille?codeCommune=<%=ville.getCodeCommune()%>">Modifier</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<a href="AfficherVilles?page=
		<%
			sess = request.getSession();
			pages = (Integer) sess.getAttribute("numPage");
			if (pages > 1) {
				pages--;
			}
		%>
		<%=pages%>">Previous</a>
	<a href="AfficherVilles?page=
		<% 
			sess = request.getSession();
			pages = (Integer) sess.getAttribute("numPage") + 1;
		%>
		<%=pages%>">Next</a>
	<br>
	<br>
	<a href="index.jsp"> Retour </a>
</body>
</html>
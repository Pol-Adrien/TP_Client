<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ page import="org.springframework.web.client.RestTemplate"%>
<%@ page import="com.dto.Ville"%>
<head>
<meta charset="ISO-8859-1">
<title>Villes France</title>
</head>
<body>
	<div>
		<h2>Calcul de la distance entre deux villes</h2>
		<%
			RestTemplate restTemplate = new RestTemplate();
			Ville[] listeVilles= restTemplate.getForObject("http://localhost:8181/get", Ville[].class);
		 	String[] noms = new String[listeVilles.length];
		 	String[] codeCommune = new String[listeVilles.length];
		
			HttpSession sess = request.getSession();
			sess.setAttribute("listeVilles", listeVilles);
			for (int i = 0; i < listeVilles.length; i++) {
				noms[i] = listeVilles[i].getNomCommune();
				codeCommune[i] = listeVilles[i].getCodeCommune();
			}
		%>
		
		<form action="Distance" method="get">
			<select name="ville1">
				<%for(int i = 0; i<noms.length; i++){%> 
						<option value=<%out.println(codeCommune[i]);%>>
						<%out.println(noms[i]);%></option>
		  		<%}%> 
			</select>
			<select name="ville2">
				<%for(int i = 0; i<noms.length; i++){%> 
						<option value=<%out.println(codeCommune[i]);%>>
						<%out.println(noms[i]);%></option>
		  		<%}%> 
			</select>
			<button type="submit" name="valider">Valider</button>
		</form>
		
		<h2>Affichage de toutes les villes</h2>
		<a href="AfficherVilles"> Afficher les villes </a>
		<br>
	
	</div>
	
</body>
</html>
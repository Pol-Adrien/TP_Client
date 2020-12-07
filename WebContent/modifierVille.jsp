<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ page import="org.springframework.web.client.RestTemplate"%>
<%@ page import="com.dto.Ville"%>
<head>
<meta charset="ISO-8859-1">
<title>Modifier Ville</title>
</head>
<body>
	<%
		HttpSession sess = request.getSession();
		String codeCommune = (String) sess.getAttribute("codeCommune");
		RestTemplate restTemplate = new RestTemplate();
		Ville ville = restTemplate.getForObject("http://localhost:8181/get?codeCommune=" + codeCommune, Ville[].class)[0];
	%>
	<h2>Modifier Ville (Code Commune INSEE : <%=ville.getCodeCommune()%>)</h2>
	
	<form action="EnvoiModificationVille" method="get">
	
		<div class="form-group">
			Nom Commune : 
			<input class="form-control" placeholder="nomCommune"
				required name="nomCommune" type="text" value="<%=ville.getNomCommune()%>">
		</div>
		<div class="form-group">
			Code Postal : 
			<input class="form-control" placeholder="codePostal"
				required name="codePostal" type="text" value="<%=ville.getCodePostal()%>">
		</div>
		<div class="form-group">
			Libellé Acheminement : 
			<input class="form-control"
				placeholder="libelleAcheminement" 
				required name="libelleAcheminement" type="text" 
				value="<%=ville.getLibelleAcheminement()%>">
		</div>
		<div class="form-group">
			Ligne 5 : 
			<input class="form-control" placeholder="ligne5"
				required name="ligne5" type="text" 
				value="<%=ville.getLigne5()%>">
		</div>
		<div class="form-group">
			Latitude : 
			<input class="form-control" placeholder="latitude"
				required name="latitude" type="text" value="<%=ville.getLatitude()%>">
		</div>
		<div class="form-group">
			Longitude : 
			<input class="form-control" placeholder="longitude"
				required name="longitude" type="text" value="<%=ville.getLongitude()%>">
		</div>
		<br>
		<input type="submit" value="Modifier">
		
	</form>
	<br>
	<a href="AfficherVilles"> Retour </a>
</body>
</html>
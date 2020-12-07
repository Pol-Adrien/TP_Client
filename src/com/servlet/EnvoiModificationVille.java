package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;


/**
 * Servlet implementation class EnvoiModificationVille
 */
@WebServlet("/EnvoiModificationVille")
public class EnvoiModificationVille extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnvoiModificationVille() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		String codeCommune = (String) sess.getAttribute("codeCommune");
		String nomCommune = (String) request.getParameter("nomCommune");
		String codePostal = (String) request.getParameter("codePostal");
		String libelleAcheminement = (String) request.getParameter("libelleAcheminement");
		String ligne5 = (String) request.getParameter("ligne5");
		String latitude = (String) request.getParameter("latitude");
		String longitude = (String) request.getParameter("longitude");
		
		String url = "http://localhost:8181/put";
		HttpPut put = new HttpPut(url);
		
		List<NameValuePair> urlParameters = new ArrayList<>();
        urlParameters.add(new BasicNameValuePair("codeCommune", codeCommune));
        urlParameters.add(new BasicNameValuePair("nomCommune", nomCommune));
        urlParameters.add(new BasicNameValuePair("codePostal", codePostal));
        urlParameters.add(new BasicNameValuePair("libelleAcheminement", libelleAcheminement));
        urlParameters.add(new BasicNameValuePair("ligne5", ligne5));
        urlParameters.add(new BasicNameValuePair("latitude", latitude));
        urlParameters.add(new BasicNameValuePair("longitude", longitude));

        put.setEntity(new UrlEncodedFormEntity(urlParameters));
                
        try (CloseableHttpClient httpClient = HttpClients.createDefault();
             CloseableHttpResponse resp = httpClient.execute(put)) {

        	 System.out.println("\nSending 'PUT' request to URL : " + put.getURI());
        }
        
        RequestDispatcher dispat = request.getRequestDispatcher("index.jsp");
		dispat.forward(request, response);
	}

}

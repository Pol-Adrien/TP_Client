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

import com.dto.Ville;

/**
 * Servlet implementation class AfficherVilleServlet
 */
@WebServlet("/AfficherVilles")
public class AfficherVillesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfficherVillesServlet() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		String num = request.getParameter("page");
		int page = num != null ? Integer.parseInt(num) : 1;

		Ville[] listeVilles = (Ville[]) sess.getAttribute("listeVilles");
		List<Ville> villes = getPageVilles(page, 50, listeVilles);
		sess.setAttribute("villesPage", villes);
		sess.setAttribute("numPage", page);
		RequestDispatcher dispat = request.getRequestDispatcher("afficherVilles.jsp");
		dispat.forward(request, response);
	}
	
	private List<Ville> getPageVilles(int page, int size, Ville[] villes) {
		List<Ville> listeVilles = new ArrayList<>();
		for (int i = (page - 1) * size; i < page * size; i++) {
			if (i >= villes.length) {
				break;
			}
			listeVilles.add(villes[i]);
		}

		return listeVilles;
	}

}

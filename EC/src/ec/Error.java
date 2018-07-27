package ec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Error")
public class Error extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String errorMessage = session.getAttribute("errorMessage") != null ? (String) EcHelper.cutSessionAttribute(session, "errorMessage") : "不正なアクセス";

		request.setAttribute("errorMessage", errorMessage);
		request.getRequestDispatcher(EcHelper.ERROR_PAGE).forward(request, response);
	}
}

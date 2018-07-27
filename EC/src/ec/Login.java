package ec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * ログイン画面
 * @author d-yamaguchi
 *
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		//ログイン失敗時に使用するため
		String inputLoginId =session.getAttribute("loginId")!=null?(String) EcHelper.cutSessionAttribute(session,"loginId"):"";
		String loginErrorMessage = (String)EcHelper.cutSessionAttribute(session, "loginErrorMessage");

		request.setAttribute("inputLoginId", inputLoginId);
		request.setAttribute("loginErrorMessage", loginErrorMessage);

		request.getRequestDispatcher(EcHelper.LOGIN_PAGE).forward(request, response);
	}
}

package ec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserDataBeans;
import dao.UserDAO;

/**
 * ユーザー登録入力内容確認画面
 *
 * @author d-yamaguchi
 *
 */
@WebServlet("/RegistConfirm")
public class RegistConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 入力内容を確認 バリデーションエラーがある場合新規登録画面に遷移
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 文字化け対策 */
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		try {
			String inputUserName = request.getParameter("user_name");
			String inputUserAddress = request.getParameter("user_address");
			String inputLoginId = request.getParameter("login_id");
			String inputPassword = request.getParameter("password");
			String inputConfirmPassword = request.getParameter("confirm_password");

			UserDataBeans udb = new UserDataBeans();
			udb.setName(inputUserName);
			udb.setAddress(inputUserAddress);
			udb.setLoginId(inputLoginId);
			udb.setPassword(inputPassword);

			String validationMessage = "";

			// 入力されているパスワードが確認用と等しいか
			if (!inputPassword.equals(inputConfirmPassword)) {
				validationMessage += "入力されているパスワードと確認用パスワードが違います<br>";
			}

			// ログインIDの入力規則チェック 英数字 ハイフン アンダースコアのみ入力可能
			if (!EcHelper.isLoginIdValidation(udb.getLoginId())) {
				validationMessage += "半角英数とハイフン、アンダースコアのみ入力できます";
			}
			// loginIdの重複をチェック
			if (UserDAO.isOverlapLoginId(udb.getLoginId(), 0)) {
				validationMessage += "ほかのユーザーが使用中のログインIDです";
			}

			// バリデーションエラーメッセージがないなら確認画面へ
			if (validationMessage.length() == 0) {
				request.setAttribute("udb", udb);
				request.getRequestDispatcher(EcHelper.REGIST_CONFIRM_PAGE).forward(request, response);
			} else {
				session.setAttribute("udb", udb);
				session.setAttribute("validationMessage", validationMessage);
				response.sendRedirect("Regist");
			}

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}

}

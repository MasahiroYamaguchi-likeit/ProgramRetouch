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
 * ユーザー情報更新完了画面
 *
 * @author d-yamaguchi
 *
 */
@WebServlet("/UserDataUpdateResult")
public class UserDataUpdateResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 文字化け対策 */
		request.setCharacterEncoding("UTF-8");
		// セッション開始
		HttpSession session = request.getSession();
		try {

			// 入力フォームから受け取った値をUserDataBeansにセット
			UserDataBeans udb = new UserDataBeans();
			udb.setUpdateUserDataBeansInfo(request.getParameter("user_name_update"), request.getParameter("login_id_update"), request.getParameter("user_address_update"), (int) session.getAttribute("userId"));

			// 確定ボタンが押されたかを確認する変数
			String confirmed = request.getParameter("confirmButton");

			switch (confirmed) {
			// 確定ボタンが押されていなかった場合はセッションに入力内容を保持してユーザー情報画面へ
			case "cancel":
				session.setAttribute("returnUDB", udb);
				response.sendRedirect("UserData");

				break;
			// アップデート処理
			case "update":
				UserDAO.updateUser(udb);
				request.setAttribute("udb", udb);
				request.getRequestDispatcher(EcHelper.USER_DATA_UPDATA_RESULT_PAGE).forward(request, response);
				break;

			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
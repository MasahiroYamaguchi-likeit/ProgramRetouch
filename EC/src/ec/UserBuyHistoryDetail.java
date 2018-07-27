package ec;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyDataBeans;
import beans.ItemDataBeans;
import dao.UserDAO;

/**
 * 購入履歴画面
 * @author d-yamaguchi
 *
 */
@WebServlet("/UserBuyHistoryDetail")
public class UserBuyHistoryDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		try {
			String buyId = request.getParameter("Id");
			BuyDataBeans UBHDD = UserDAO.UserBuyHistoryDetailData(buyId);
			ArrayList<ItemDataBeans> IDB = UserDAO.UserBuyHistoryItemDetailData(buyId);


			// 入力された内容に誤りがあったとき等に表示するエラーメッセージを格納する
			String validationMessage = (String) EcHelper.cutSessionAttribute(session, "validationMessage");

			request.setAttribute("validationMessage", validationMessage);
			request.setAttribute("UBHDD",UBHDD);
			request.setAttribute("IDB",IDB);


			request.getRequestDispatcher(EcHelper.USER_BUY_HISTORY_DETAIL_PAGE).forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}





}

package ec;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import beans.ItemDataBeans;

/**
 * 定数保持、処理及び表示簡略化ヘルパークラス
 *
 * @author d-yamaguchi
 *
 */
public class EcHelper {
	// 検索結果
	static final String SEARCH_RESULT_PAGE = "/itemsearchresult.jsp";
	// 商品ページ
	static final String ITEM_PAGE = "/item.jsp";
	// TOPページ
	static final String TOP_PAGE = "/index.jsp";
	// エラーページ
	static final String ERROR_PAGE = "/error.jsp";
	// 買い物かごページ
	static final String CART_PAGE = "/cart.jsp";
	// 購入
	static final String BUY_PAGE = "/buy.jsp";
	// 購入確認
	static final String BUY_CONFIRM_PAGE = "/buyconfirm.jsp";
	// 購入完了
	static final String BUY_RESULT_PAGE = "/buyresult.jsp";
	// ユーザー情報
	static final String USER_DATA_PAGE = "/userdata.jsp";
	// ユーザー情報更新確認
	static final String USER_DATA_UPDATE_CONFIRM_PAGE = "/userdataupdateconfirm.jsp";
	// ユーザー情報更新完了
	static final String USER_DATA_UPDATA_RESULT_PAGE = "/userdataupdateresult.jsp";
	// ユーザー購入履歴
	static final String USER_BUY_HISTORY_DETAIL_PAGE = "/userbuyhistorydetail.jsp";
	// ログイン
	static final String LOGIN_PAGE = "/login.jsp";
	// ログアウト
	static final String LOGOUT_PAGE = "/logout.jsp";
	// 新規登録
	static final String REGIST_PAGE = "/regist.jsp";
	// 新規登録入力内容確認
	static final String REGIST_CONFIRM_PAGE = "/registconfirm.jsp";
	// 新規登録完了
	static final String REGIST_RESULT_PAGE = "/registresult.jsp";

	public static EcHelper getInstance() {
		return new EcHelper();
	}

	/**
	 * 商品の合計金額を算出する
	 *
	 * @param items
	 * @return total
	 */
	public static int getTotalItemPrice(ArrayList<ItemDataBeans> items) {
		int total = 0;
		for (ItemDataBeans item : items) {
			total += item.getPrice();
		}
		return total;
	}

	/**
	 * ハッシュ関数
	 *
	 * @param target
	 * @return
	 */
	public static String getSha256(String target) {
		MessageDigest md = null;
		StringBuffer buf = new StringBuffer();
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(target.getBytes());
			byte[] digest = md.digest();

			for (int i = 0; i < digest.length; i++) {
				buf.append(String.format("%02x", digest[i]));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return buf.toString();
	}

	/**
	 * セッションから指定データを取得（削除も一緒に行う）
	 *
	 * @param session
	 * @param str
	 * @return
	 */
	public static Object cutSessionAttribute(HttpSession session, String str) {
		Object test = session.getAttribute(str);
		session.removeAttribute(str);

		return test;
	}

	/**
	 * ログインIDのバリデーション
	 *
	 * @param inputLoginId
	 * @return
	 */
	public static boolean isLoginIdValidation(String inputLoginId) {
		// 英数字アンダースコア以外が入力されていたら
		if (inputLoginId.matches("[0-9a-zA-Z-_]+")) {
			return true;
		}

		return false;

	}


}

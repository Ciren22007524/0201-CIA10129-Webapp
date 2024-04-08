package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.ProductServiceImpl;
import com.product.model.ProductVO;

@WebServlet("/product/product.do")
public class ProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("pNo");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入員工編號");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/product/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			Integer pNo = null;
			try {
				pNo = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.add("員工編號格式不正確");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/product/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/
			ProductServiceImpl productSvc = new ProductServiceImpl();
			ProductVO productVO = productSvc.getOneProduct(pNo);
			if (productVO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/product/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("productVO", productVO); // 資料庫取出的productVO物件,存入req
			String url = "/product/listOneProduct.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProduct.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllProduct.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer pNo = Integer.valueOf(req.getParameter("pNo"));

			/*************************** 2.開始查詢資料 ****************************************/
			ProductServiceImpl productSvc = new ProductServiceImpl();
			ProductVO productVO = productSvc.getOneProduct(pNo);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("productVO", productVO); // 資料庫取出的productVO物件,存入req
			String url = "/product/update_product_input.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_product_input.jsp
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // 來自update_product_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer pNo = Integer.valueOf(req.getParameter("pNo").trim());

			Integer pCatNo = Integer.valueOf(req.getParameter("pCatNo").trim());

			String pName = req.getParameter("pName");
			String pNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (pName == null || pName.trim().length() == 0) {
				errorMsgs.add("商品名稱: 請勿空白");
			} else if (!pName.trim().matches(pNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			String pInfo = req.getParameter("pInfo").trim();
			if (pInfo == null || pInfo.trim().length() == 0) {
				errorMsgs.add("商品資訊請勿空白");
			}

			Integer pSize = Integer.valueOf(req.getParameter("pSize").trim());

			String pColor = req.getParameter("pColor").trim();
			if (pColor == null || pColor.trim().length() == 0) {
				errorMsgs.add("顏色請勿空白");
			}

			BigDecimal pPrice = null;
			try {
				String price = req.getParameter("pPrice").trim();
				pPrice = new BigDecimal(price);
			} catch (NumberFormatException e) {
				pPrice = BigDecimal.ZERO;
				errorMsgs.add("薪水請填數字.");
			}

			Byte pStat = null;
			try {
				pStat = Byte.valueOf(req.getParameter("pStat").trim());
			} catch (NumberFormatException e) {
				pStat = Byte.valueOf("0");
				errorMsgs.add("商品狀態請填數字.");
			}

			Integer pSalQty = Integer.valueOf(req.getParameter("pSalQty").trim());

			Integer pComPeople = Integer.valueOf(req.getParameter("pComPeople").trim());

			Integer pComScore = Integer.valueOf(req.getParameter("pComScore").trim());

			ProductVO productVO = new ProductVO();
			productVO.setpCatNo(pCatNo);
			productVO.setpName(pName);
			productVO.setpInfo(pInfo);
			productVO.setpSize(pSize);
			productVO.setpColor(pColor);
			productVO.setpPrice(pPrice);
			productVO.setpStat(pStat);
			productVO.setpSalQty(pSalQty);
			productVO.setpComPeople(pComPeople);
			productVO.setpComScore(pComScore);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("productVO", productVO); // 含有輸入格式錯誤的productVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/product/update_product_input.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始修改資料 *****************************************/
			ProductServiceImpl productSvc = new ProductServiceImpl();
			productVO = productSvc.updateProduct(pNo, pCatNo, pName, pInfo, pSize, pColor, pPrice, pStat, pSalQty,
					pComPeople, pComScore);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("productVO", productVO); // 資料庫update成功後,正確的的productVO物件,存入req
			String url = "/product/listOneProduct.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneProduct.jsp
			successView.forward(req, res);
		}

		if ("insert".equals(action)) { // 來自addProduct.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer pCatNo = Integer.valueOf(req.getParameter("pCatNo").trim());

			String pName = req.getParameter("pName");
			String pNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (pName == null || pName.trim().length() == 0) {
				errorMsgs.add("商品名稱: 請勿空白");
			} else if (!pName.trim().matches(pNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			String pInfo = req.getParameter("pInfo").trim();
			if (pInfo == null || pInfo.trim().length() == 0) {
				errorMsgs.add("商品資訊請勿空白");
			}

			Integer pSize = Integer.valueOf(req.getParameter("pSize").trim());

			String pColor = req.getParameter("pColor").trim();
			if (pColor == null || pColor.trim().length() == 0) {
				errorMsgs.add("顏色請勿空白");
			}

			BigDecimal pPrice = null;
			try {
				String price = req.getParameter("pPrice").trim();
				pPrice = new BigDecimal(price);
			} catch (NumberFormatException e) {
				pPrice = BigDecimal.ZERO;
				errorMsgs.add("薪水請填數字.");
			}

			Byte pStat = null;
			try {
				pStat = Byte.valueOf(req.getParameter("pStat").trim());
			} catch (NumberFormatException e) {
				pStat = Byte.valueOf("0");
				errorMsgs.add("商品狀態請填數字.");
			}

			Integer pSalQty = Integer.valueOf(req.getParameter("pSalQty").trim());

			Integer pComPeople = Integer.valueOf(req.getParameter("pComPeople").trim());

			Integer pComScore = Integer.valueOf(req.getParameter("pComScore").trim());

			ProductVO productVO = new ProductVO();
			productVO.setpCatNo(pCatNo);
			productVO.setpName(pName);
			productVO.setpInfo(pInfo);
			productVO.setpSize(pSize);
			productVO.setpColor(pColor);
			productVO.setpPrice(pPrice);
			productVO.setpStat(pStat);
			productVO.setpSalQty(pSalQty);
			productVO.setpComPeople(pComPeople);
			productVO.setpComScore(pComScore);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("productVO", productVO); // 含有輸入格式錯誤的productVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/product/addproduct.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			ProductServiceImpl productSvc = new ProductServiceImpl();
			productVO = productSvc.addProduct(pCatNo, pName, pInfo, pSize, pColor, pPrice, pStat, pSalQty, pComPeople,
					pComScore);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/product/listAllProduct.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) { // 來自listAllProduct.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer pNo = Integer.valueOf(req.getParameter("pNo"));

			/*************************** 2.開始刪除資料 ***************************************/
			ProductServiceImpl productSvc = new ProductServiceImpl();
			productSvc.deleteProduct(pNo);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/product/listAllProduct.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}
	}
}

package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.ExamInfo;
import dto.Member;
import dto.OneLineBoard;
import service.ExamInfoService;
import service.ExamInfoServiceImpl;
import service.OneLineBoardService;
import service.OneLineBoardServiceImpl;

/**
 * Servlet implementation class OneLineBoard
 */
@WebServlet("/onelineboardpost")
public class OneLineBoardPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneLineBoardPost() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		int curpage = 1;
		if(page!=null) {
			curpage = Integer.parseInt(page);
		}
		
		// 서블릿에서 examinfo 데이터를 가져오는 코드 (예시)
		List<ExamInfo> examInfoList = null;
		try {
			OneLineBoardService oneLineBoardService = new OneLineBoardServiceImpl();
			System.out.println(curpage);
			Map<String, Object> res = oneLineBoardService.oneLineBoardListByPage(curpage);
			ExamInfoService examinfoservice = new ExamInfoServiceImpl();
			examInfoList = examinfoservice.getExamInfoNames();
			request.setAttribute("examInfoList", examInfoList); // JSP 페이지로 데이터 전달
			request.setAttribute("res", res);
			request.getRequestDispatcher("onelineboard.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("onelineboard.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String level = request.getParameter("level");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		String writer = member.getId();
		
		OneLineBoard olb = new OneLineBoard();
		olb.setSubject(subject);
		olb.setContent(content);
		olb.setLevel(level);
		olb.setWriter(writer);
		olb.setNickname(member.getNickname());
		try {
			OneLineBoardService oneLineBoardService = new OneLineBoardServiceImpl();
			oneLineBoardService.boardwirte(olb);
			response.sendRedirect("onelineboardpost");
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("onelineboard.jsp").forward(request, response);
		}
	}

}

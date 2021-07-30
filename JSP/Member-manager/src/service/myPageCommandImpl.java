package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class myPageCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/*<c:if test="${loginInfo eq null}">	
		<script>
			alert('로그인이 필요한 페이지입니다.\n로그인 후 사용해주세요!!');
			location.href = '<%= request.getContextPath()%>/loginForm.jsp';
		</script>
			</c:if>
		<c:if test="${loginInfo ne null}">*/	
		if(request.getSession().getAttribute("loginInfo") == null) {
			return "/WEB-INF/views/pleaseLogin.jsp";
		}else {
			return "/WEB-INF/views/mypage.jsp";
		}
	}
}
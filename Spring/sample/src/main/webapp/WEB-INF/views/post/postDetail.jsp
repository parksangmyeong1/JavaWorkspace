<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project : 게시글 보기</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js" 
integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
crossorigin="anonymous">
</script>
<script>
    $(document).ready(function(){
        
        // 댓글 하나만 입력하도록 설정
        $('.add-recomments').click(function(){
            var add_recomments = $(this).attr('data-recomments');
            console.log(add_recomments);
            $('.recomments').addClass('display-none');
            $('.'+add_recomments).removeClass('display-none');
        })
        $('.write').click(function(){
            $('.recomments').addClass('display-none');
        })
        $('.remove-comments').click(function(){
            $('.recomments').addClass('display-none');
        })

        // 회원 정보
        $('.imgSelect').click(function(){
            var data_id = $(this).attr('data-id');
            console.log(data_id);
            $('.nick-box').addClass('display-none');
            $('.'+data_id).removeClass('display-none');
        })
        // url 복사 기능
        $('.copy-url').click(function(){
            copyLink();
        })

        // 외부영역 클릭 시 팝업 닫기
        $(document).mouseup(function (e){
        var LayerPopup = $(".nick-box");
            if(LayerPopup.has(e.target).length === 0){
                LayerPopup.addClass("display-none");
            }
        });

        // 댓글 좋아요 싫어요 중 하나만 눌리도록 설정
        $('.btn-like').click(function(){
            $(this).toggleClass("done");
            $(this).next().removeClass("done");
        });
        $('.btn-dislike').click(function(){
            $(this).toggleClass("done");
            $(this).prev().removeClass("done");
        });
    });

    // 게시글 좋아요 싫어요 누르면 숫자 증가 시키기
    function count(type){
            const upresult = document.getElementById('upresult');
            const downresult = document.getElementById('downresult');
            
            // 더하기
            if(type === 'up') {
                number = parseInt(upresult.innerText) + 1;
                upresult.innerText = number;
            }else if(type === 'down')  {
                number = parseInt(downresult.innerText) + 1;
                downresult.innerText = number;
            }
        }
        

    //  url 복사 기능
    function copyLink(){

        let currentUrl = window.document.location.href;

        let t = document.createElement("textarea");
        document.body.appendChild(t);
        t.value = currentUrl;
        t.select();
        document.execCommand('copy');
        document.body.removeChild(t);

        alert('주소를 복사하였습니다.');
    }

</script>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	
	<div class="Wrapper">
        <div class="WritingWrap">
            <div class="contents">
                <div class="board_header">
                    <h3><a href="<c:url value='/post/postList'/>">COB 게시판</a></h3>
                    <a href="<c:url value='post/postList'/>" class="categori">잡담</a>
                    <a href="<c:url value='/post/write'/>" class="categori-write">글쓰기</a>
                    <a href="<c:url value='/post/postDetail?postIdx=${postDetail[0].postIdx}'/>" class="categori-right">다음글</a>
                    <a href="<c:url value='/post/postDetail?postIdx=${postDetail[2].postIdx}'/>" class="categori-right">이전글</a>
                    <a href="<c:url value='/post/postList'/>" class="categori-right">목록</a>
                </div>
                <div class="contents-wrap">
                    <div class="contents-header">
                        <div class="header1">
                            <span class="title">${postDetail[1].postTitle}</span>
                            <span class="time"><fmt:formatDate value="${postDetail[1].postRegDate}" type="date"
							pattern="yyyy.MM.dd" /></span>
                            <a herf="#" >
                                <img class="copy-url" src="/cobsp/images/copy--v1.png" alt="링크 주소복사 아이콘" title="주소복사">
                            </a>
                        </div>
                        <div class="header2">
                            <a href="#" class="imgSelect" data-id="id1">
                            	<img src="/cobsp/images/user.png"/>${postDetail[1].postRegDate}
                            </a>
                            <div class="nick-box id1 display-none">
                                <ul>
                                    <li>작성글보기</li>
                                    <li>회원정보보기</li>
                                </ul>
                            </div>
                            <div class="contents-header-info">
                                <span class="commentsCnt">조회수 : ${postDetail[1].views}</span>
                                <span>좋아요 : ${postDetail[1].postLike}</span>
                                <span>댓글 : 4</span>	<!-- 댓글 숫자 가져와야함 -->
                            </div>
                        </div>
                    </div>
                    <div class="contents-text">
                        ${postDetail[1].postContent}
                    </div>
                    <div class="contents-etc">
                        <div class="updown">
                            <div class="up" onclick='count("up")'>
                                <a><img src="https://img.icons8.com/material-rounded/24/4a90e2/facebook-like--v1.png"/></a>
                                <strong id="upresult" >${postDetail[1].postLike}</strong>
                            </div>
                            <div class="down" onclick='count("down")'>
                                <a><img src="https://img.icons8.com/material-rounded/24/fa314a/thumbs-down.png"/></a>
                                <strong id="downresult">${postDetail[1].postDislike}</strong>
                            </div>
                        </div>
                        <div class="icons-wrap">
                            <a><img src="https://img.icons8.com/ios/50/000000/siren.png"/></a>
                            <a><img src="https://img.icons8.com/wired/64/000000/paste.png"/></a>
                            <a><img src="https://img.icons8.com/material-outlined/24/000000/share.png"/></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contents-crud">
                <a href="<c:url value='/post/write'/>" class="contents-c">글쓰기</a>
                <a href="<c:url value='/post/postEdit?postIdx=${postDetail[1].postIdx}'/>" class="contents-u" >수정</a>
                <a href="<c:url value='/post/postDelete?postIdx=${postDetail[1].postIdx}'/>" class="contents-d" onclick="return confirm('해당게시글을 삭제하시겠습니까?');">삭제</a>
                <a href="<c:url value='/post/postList'/>" class="contents-r">목록</a>
            </div>
            <!-- 댓글 만들고 추가 시켜야함 -->
            <div class="comments-wrap" id="comments">
                <div class="comments-best">
                    <div class="commemts-best-title">
                        <span>베스트 댓글</span>
                    </div>
                    <div>			
                        <div class="comments-profile">
                            <img src="https://img.icons8.com/ios/50/000000/nerd--v1.png" >
                        </div>
                        <div class="comments-info">
                            <a><img class="rank imgSelect" data-id="id2" src="https://img.icons8.com/ios/50/fa314a/diamond.png">park
                                <div class="nick-box id2 display-none">
                                    <ul>
                                        <li>작성글보기</li>
                                        <li>회원정보보기</li>
                                    </ul>
                                </div> 
                            </a>
                            <span class="date">2021.06.30 12:20</span>
                            <a class="add-recomments" data-recomments="comments1">답글쓰기</a>	
                            <a><img src="https://img.icons8.com/ios/50/000000/siren.png"/></a>
                            <button class="btn-like">👎</button>
                            <button class="btn-dislike">👍</button>
                            <div class="comments-text">
                               	 유익한 정보 감사합니다.<br>댓글 남기고 가여~~
                            </div>
                            <div class="recomments comments1 display-none">
                                <label class="write">댓글 쓰기</label> 
                                <a class="remove-comments">닫기</a>
                                <div class="recomments-text">
                                    <textarea class="write-comments" cols="50" rows="4" placeholder="댓글을 입력해주세요."></textarea>
                                    <input type="submit" onclick="submitcomments()" value="등록">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="comments">
                    <ul>
                        <li>
                            <div class="id">
                                <div class="comments-profile">
                                    <img src="https://img.icons8.com/ios/50/000000/cat-profile.png" >
                                </div>
                                <div class="comments-info">
                                    <a><img class="rank imgSelect" data-id="id3" src="https://img.icons8.com/ios/50/fa314a/diamond.png" >senei
                                        <div class="nick-box id3 display-none">
                                            <ul>
                                                <li>작성글보기</li>
                                                <li>회원정보보기</li>
                                            </ul>
                                        </div>
                                    </a>
                                    <span class="date">2021.06.30 19:18</span>
                                    <a class="add-recomments" data-recomments="comments2" class="date">답글쓰기</a>	
                                    <a><img src="https://img.icons8.com/ios/50/000000/siren.png"/></a>
                                    <button class="btn-like">👎</button>
                                    <button class="btn-dislike">👍</button>
                                    <div class="comments-text">
                                        1111111111111<br>zzz
                                    </div>
                                    <div class="recomments comments2 display-none">
                                        <label class="write">댓글 쓰기</label> 
                                        <a class="remove-comments">닫기</a>
                                        <div class="recomments-text">
                                            <textarea class="write-comments" cols="50" rows="4" placeholder="댓글을 입력해주세요."></textarea>
                                            <input type="submit" onclick="submitcomments()" value="등록">
                                        </div>
                                    </div>
                                </div>		
                            </div>	
                        </li>
                        <li>
                            <div class="id">			
                                <div class="comments-profile">
                                    <img src="https://img.icons8.com/ios/50/000000/cat-profile.png">
                                </div>
                                <div class="comments-info">
                                    <a><img class="rank imgSelect" data-id="id4" src="https://img.icons8.com/ios/50/fa314a/diamond.png" >king
                                        <div class="nick-box id4 display-none">
                                            <ul>
                                                <li>작성글보기</li>
                                                <li>회원정보보기</li>
                                            </ul>
                                        </div>
                                    </a>
                                    <span class="date">2021.06.30 11:16</span>
                                    <a class="add-recomments" data-recomments="comments3" class="date">답글쓰기</a>	
                                    <a><img src="https://img.icons8.com/ios/50/000000/siren.png"/></a>
                                    <button class="btn-like">👎</button>
                                    <button class="btn-dislike">👍</button>
                                    <div class="comments-text">
                                        222222222222222222<br>댓글 남기고 가여~~
                                    </div>
                                    <div class="recomments comments3 display-none">
                                        <label class="write">댓글 쓰기</label> 
                                        <a class="remove-comments">닫기</a>
                                        <div class="recomments-text">
                                            <textarea class="write-comments" cols="50" rows="4" placeholder="댓글을 입력해주세요."></textarea>
                                            <input type="submit" onclick="submitcomments()" value="등록">
                                        </div>
                                    </div>
                                    <div class="re-recomments">
                                        <img src="https://img.icons8.com/ios/50/000000/right3.png"/>
                                        <div class="id">			
                                            <div class="re-recomments-profile">
                                                <img src="https://img.icons8.com/ios/50/000000/user-female-circle.png">
                                            </div>
                                            <div class="re-recomments-info">
                                                <a href="#"><img class="rank" src="https://img.icons8.com/ios/50/fa314a/diamond.png" >son</a>
                                                <span class="date">2021.06.30 10:56</span>
                                                <a><img src="https://img.icons8.com/ios/50/000000/siren.png"/></a>
                                                <button class="btn-like">👎</button>
                                                <button class="btn-dislike">👍</button>
                                                <div class="comments-text">
                                                 	  ㄱㅅㄱㅅㄱㅅㄱㅅ<br>ㄱㅅㄱㅅㄱㅅㄱㅅ
                                                </div>
                                            </div>		
                                        </div>	
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="comments-write">
                    <label>댓글 쓰기</label>
                    <div>
                    	<form id="commForm" action="<c:url value='/comment/regComment'/>">
	                    	<textarea class="write-comments" name="commContent" cols="50" rows="4" placeholder="댓글을 입력해주세요."></textarea>
	                        <input type="hidden" name="postIdx" value="${postDetail[1].postIdx}">
	                        <input type="submit" form="commForm" onclick="goWrite(this.form);" value="등록">
                    	</form>
                    </div>
                </div>
                <div class="comments-paging">
                    <a href="#"><span>첫 페이지</span></a>			
                    <a href="#">1</a>			
                    <a href="#">2</a>
                    <a href="#">3</a>	
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">7</a>					
                    <a href="#"><span>끝 페이지</span></a>
                </div>
            </div>
        </div>
        <div class="control-bar">
            <a href="#top">⬆</a><br>
            <a href="#comments">💬</a><br>
            <a href="#bottom">⬇</a>
        </div>
    </div>
    
    <script>
		function goWrite(frm) {
			var commContent = frm.commContent.value;
			console.log(commContent);
			if(commContent.trim() == ''){
				alert("댓글 내용을 입력해주세요");
				return false;
			}
			frm.submit();
		}
	</script>
</body>
</html> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	// 세션 저장
	session.setAttribute("nickName", "닉네임");
	session.setAttribute("Id", "현재 아이디");
 %>
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
    	
		commentCount();
    	showCommList();
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
    
 	// 댓글 갯수 구하기
	function commentCount(){
		$.ajax({
			url : '<c:url value="/comment/countComment"/>',    			
			type : "post",
			data : {"postIdx" : ${ postDetail[1].postIdx} },
			async : false,
			success : function(data){
				$('#commCnt').html("댓글 : "+ data);
			},
			error : function(){
				alert("오류발생");
			}
		});
	}
 	
 	function btn_like(){
 		$.ajax({
 			url : '<c:url value="/post/addlLike"/>',    			
			type : "post",
			data : {"postIdx" : ${ postDetail[1].postIdx} },
			async : false,
			success : function(){
				$('#upresult').html(${postDetail[1].postLike});
			},
			error : function(){
				alert("오류발생");
			} 
 		});
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
                            	<img src="/cobsp/images/user.png"/>${postDetail[1].postWriter}
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
                                <span id="commCnt">댓글 : </span>	<!-- 댓글 숫자 가져와야함 -->
                            </div>
                        </div>
                    </div>
                    <div class="contents-text">
                        ${postDetail[1].postContent}
                    </div>
                    <div class="contents-etc">
                        <div class="updown">
                            <div class="up" onclick='btn_like()'>
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
            <!-- 댓글 영역 -->
            <div class="comments-wrap" id="comments">
                <!-- 베스트 댓글 -->
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
                <!-- 댓글이 들어가는 장소 -->
                </div>
                <!-- 댓글 쓰기 -->
                <div class="comments-write">
                    <label>댓글 쓰기</label>
                    <div>
                    	<form id="commForm">
	                    	<textarea id="commText" class="write-comments" name="commContent" cols="50" rows="4" placeholder="댓글을 입력해주세요."></textarea>
	                        <input id="postIdx" type="hidden" name="postIdx" value="${postDetail[1].postIdx}">
	                        <input id="commWriter" type="hidden" name="commWriter" value="<c:out value="${sessionScope.nickName}"/>">
	                        <input id="insert_comment" type="button" form="commForm" value="등록">
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
            <a href="#bottom">⬇</a><br>
            <a href="#comments">💬</a>
        </div>
    </div>
    <div id="#bottom">
    </div>
    <script>
    	// 댓글 등록
		$('#insert_comment').on("click", function(){
			var params = $('#commForm').serialize();
			console.log(params);

			if($('#commText').val() == ''){
				alert('댓글 내용을 입력해주세요');
				return false;
			}
			$.ajax({
				url : '<c:url value="/comment/regComment"/>',
				type :"post",
				data : params,
				async: false,
				success : function(){
					alert('댓글이 등록되었습니다.');
					commentCount();
					showCommList();
					$('#commText').val('');
				},
				error : function(){
					alert("오류 발생!");
				}
			});
			
		});
		
		function showCommList(){
			var postIdx = $('#postIdx').val();
			console.log(postIdx);
			
			$.ajax({
				url : '<c:url value="/comment/commentList"/>',
				type : "post",
				data : {postIdx : postIdx},
				async: false,
				success : function(list){
					var htmls = "";
					
					if(list.length<1){
						htmls = "등록된 댓글이 없습니다.";
					}else{
						for(var i=0;i<list.length; i++){
							var date = new Date(list[i].commRegDate);
							var commRegDate = date.getFullYear() + ". " + date.getMonth() + ". " + date.getDate() + ". " + date.getHours() + ":" + date.getMinutes();
							
							htmls += '<ul><li><div id="id' + list[i].commIdx + '" class="id">';
							htmls += '<div class="comments-profile"><img src="https://img.icons8.com/ios/50/000000/cat-profile.png" ></div>';
							htmls += '<div class="comments-info">';
							htmls += '<a><img class="rank imgSelect" data-id="id3" src="https://img.icons8.com/ios/50/fa314a/diamond.png" >' + list[i].commWriter;
					        htmls += '<div class="nick-box id3 display-none"><ul><li>작성글보기</li><li>회원정보보기</li></ul></div></a>';
					        htmls += '<span class="date">' + commRegDate + '</span>';
					        htmls += '<a class="add-recomments" data-recomments="comments2" class="date">답글쓰기</a>';
					        htmls += '<a href="javascript:void(0)" onclick="fn_editComment(' + list[i].commIdx + ', \'' + list[i].commWriter + '\', \'' + list[i].commContent + '\')">수정</a>';
					        htmls += '<a href="javascript:void(0)" onClick="fn_deleteComment(' + list[i].commIdx + ')">삭제<a>'
					        htmls += '<a><img src="https://img.icons8.com/ios/50/000000/siren.png"/></a>';
					        htmls += '<button class="btn-like">👎<span>' + list[i].commDislike +'</span></button>';
					        htmls += '<button class="btn-dislike">👍<span>' + list[i].commLike +'</span></button>';
					        htmls += '<div class="comments-text">' + list[i].commContent.replaceAll("\r\n", "<br>") + '</div>';
					        htmls += '<div class="recomments comments2 display-none"><label class="write">댓글 쓰기</label><a class="remove-comments">닫기</a>';
					        htmls += '<div class="recomments-text"><textarea class="write-comments" cols="50" rows="4" placeholder="댓글을 입력해주세요."></textarea>';
					        htmls += '<input type="submit" onclick="submitcomments()" value="등록"></div></div></div></div></li></ul>';
						}
					}
					$('.comments').html(htmls);
				},
				error : function(){
					alert("오류 발생!");
				}
			});
		}
		function fn_deleteComment(commIdx){

			var msg = confirm("정말로 삭제하시겠습니까??");

			if(msg){
				$.ajax({
					url : '<c:url value="/comment/deleteComment"/>',
					type : "post",
					data : {commIdx : commIdx},
					async: false,
					success : function(){
						alert('해당 게시물을 삭제했습니다.');
						showCommList();
					},
					error : function(){
						alert('삭제중 오류발생');
					}
				});
			}
			else {
				return false;
			}
		}
		
		function fn_editComment(commIdx,commWriter,commContent){
			var htmls = "";
			
			htmls += '<div class="recomments comments1">';
			htmls += '<label class="write">댓글 쓰기</label>';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateComment(' + commIdx + ', \'' + commContent + '\')" style="padding-right:5px">저장</a>';
			htmls += '<a href="javascript:void(0)" onClick="showCommList()">취소<a>';
			htmls += '<a class="remove-comments">닫기</a>';
			htmls += '<div class="recomments-text">';
			htmls += '<br><textarea id="write-comments" class="write-comments" cols="50" rows="4">' + commContent + '</textarea></div></div>'
			
			$('#id' + commIdx + '').append(htmls);
		}
		
		function fn_updateComment(commIdx, commContent){
			var editContent = $('#write-comments').val();
			
			if($('#write-comments').val() == ''){
				alert('댓글 내용을 입력해주세요');
				return false;
			}
			
			$.ajax({
				url : '<c:url value="/comment/editComment"/>',
				type : "post",
				data : {commIdx : commIdx,
						commContent : editContent	
				},
				async: false,
				success : function(){
					alert('해당 댓글을 수정했습니다.');
					showCommList();
				},
				error : function(){
					alert('수정 입력 중 오류발생');
				}
			});
		}
    </script>
    
</body>
</html> 
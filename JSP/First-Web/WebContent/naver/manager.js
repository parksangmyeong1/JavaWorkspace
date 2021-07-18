
// member 생성자 함수 정의
function Member(id, pw, name, year, month, day, gender, email, country, tel) {
	this.id = id;
    this.pw = pw;
    this.username = name;
    this.birth = year+'년 '+ month +'월 '+ day + '일';
    this.gender = gender;
    this.email = email;
    this.phoneNum = country + ' : ' + tel;
}

// members 배열 : 회원의 정보를 저장
var members = [];

// 시작
$(document).ready(function(){

    if (localStorage.getItem('members') == null) {
        // 배열 members를 저장
        localStorage.setItem('members',JSON.stringify(members));
    } else {
        members = JSON.parse(localStorage.getItem('members')); // JSON 문자열
        console.log(members);

        // 테이블 세팅
        setList();
    }

    // userInfo 캐스팅
    var id = $('#id');
    var pw = $('#pw');
    var repw = $('#repw');
    var name = $('#name');
    var year = $('#year');
    var month = $('#month');
    var day = $('#day');
    var gender = $('#gender');
    var email = $('#email');
    var country = $('#country');
    var tel = $('#tel');
    
    // 로그인 체크
    $('#login_check').submit(function(){
    	chk = false;
    	
    	// 아이디 입력 확인
    	if(id.val()==''){
    		alert('아이디를 입력해주세요!');
    		return false;
    	}
    	// 비밀번호 입력 확인
    	if(pw.val()==''){
    		alert('비밀번호를  입력해주세요!');
    		return false;
    	}
    	
    	for(var i = 0; i < members.length ; i++){
    		if(id.val()==members[i].id){
    			if(pw.val()==members[i].pw){
    				alert('로그인 성공!');
    				chk = true;
    			}
    		}
    	}
    	
    	if(chk==false){
    		alert('로그인 실패!');
    		this.reset();
    		return false;
    	}
    });
    
    // regForm submit
    $('#regForm').submit(function(){
        
    	if(id.val().trim().length < 1){
            $('#id_msg').html('필수항목입니다.');
            $('#id_msg').css({display : 'block', color : 'red'});
            return false;
        }else{
            if(!isId(id.val())){
                $('#id_msg').html('영문 대 소문자, 숫자를 사용해주세요');
                $('#id_msg').css({display : 'block', color : 'red'});
                return false;
            };
        }
    	if(pw.val().trim().length < 1){
            $('#pw_msg').html('필수항목입니다.');
            $('#pw_msg').css({display : 'block', color : 'red'});
            return false;
        }else{
            if(!isPassword(pw.val())){
                $('#pw_msg').html('4~12자 영문 대 소문자, 숫자를 사용해주세요');
                $('#pw_msg').css({display : 'block', color : 'red'});
                return false;
            }
        }

        if(repw.val().trim().length < 1){
            $('#repw_msg').html('필수항목입니다.');
            $('#repw_msg').css({display : 'block', color : 'red'});
            return false;
        }

        // 비밀번호 비밀번호 확인 일치 여부 체크
        if(!(pw.val().trim() == repw.val().trim())){
            $('#repw_msg').html('비밀번호가 일치하지 않습니다.');
            $('#repw_msg').css({display : 'block', color : 'red'});
            return false;
        }
        
        if(name.val().trim().length < 1){
            $('#name_msg').html('필수항목입니다.');
            $('#name_msg').css({display : 'block', color : 'red'});
            return false;
        }else{
            if(!isName(name.val())){
                $('#name_msg').html('2~12자 영문 대 소문자, 한글을 사용해주세요');
                $('#name_msg').css({display : 'block', color : 'red'});
                return false;
            }
        }

        // 아이디 중복 체크
        for (var i = 0; i < members.length; i++){
            if (id.val() == members[i].id) {
                alert('이미 사용중인 아이디입니다.');
                return false;
            }
        }

        // members 배열에 정보 추가
        members.push(new Member(id.val(), pw.val(), name.val(), year.val(), month.val(), day.val(), gender.val(), email.val(), country.val(), tel.val()));

        // localStorage에 members 저장
        localStorage.setItem('members', JSON.stringify(members));

        alert('가입되었습니다.');
        console.log('회원 리스트', members);

        // 테이블 세팅
        setList();
        
    });
    
    // focus : div.msg 없애주기
    $('#id').focus(function(){
        $('#id_msg').css({display : 'none'});
        $('#id_msg').html('')
    });
    $('#pw').focus(function(){
        $('#pw_msg').css({display : 'none'});
        $('#pw_msg').html('')
    });
    $('#repw').focus(function(){
        $('#repw_msg').css({display : 'none'});
        $('#repw_msg').html('')
    });
    $('#name').focus(function(){
        $('#name_msg').css({display : 'none'});
        $('#name_msg').html('')
    }); 
});

//userID 정규식 함수 : 이메일 형식
function isId(string){
    var regExp = /\w+/ig;
    return regExp.test(string);
};

//userPw 정규식 함수 : 영어, 숫자로 이루어짐 4-12글자
function isPassword(string){
    var regExp = /^[A-Za-z0-9]{4,12}$/ig;
    return regExp.test(string);
};

// userName 정규식 함수 : 영어, 한글로 이루어짐 2-12글자
function isName(string){
    var regExp = /^[A-Za-z가-힇]{2,12}$/ig;
    return regExp.test(string);
};

// 테이블 세팅 함수
function setList() {
	
	var tbody = '<table border="1"><tr>';
    tbody += '  <th>순번(index)</th>';
    tbody += '  <th>아이디</th>';
    tbody += '  <th>이름</th>';
    tbody += '  <th>생년월일</th>';
    tbody += '  <th>성별</th>';
    tbody += '  <th>본인 확인 이메일</th>';
    tbody += '  <th>전화번호</th>';
    tbody += '  <th>삭제</th>';
    tbody += '</tr>';
    
    // 데이터 없을 경우
    if (members.length < 1) {
        tbody += '<tr>';
        tbody += '<td colspan=9>데이터가 존재하지 않습니다.</td>';
        tbody += '</tr>';
    }else {
        $.each(members, function(i){
          tbody += '<tr>';
          tbody += '  <td>' + i + '</td>';
          tbody += '  <td>' + members[i].id +'@naver.com'+ '</td>';
          tbody += '  <td>' + members[i].username + '</td>';
          tbody += '  <td>' + members[i].birth + '</td>';
          tbody += '  <td>' + members[i].gender + '</td>';
          tbody += '  <td>' + members[i].email + '</td>';
          tbody += '  <td>' + members[i].phoneNum + '</td>';
          tbody += '  <td> <a href="javascript:deleteMember(' + i + ')">삭제</a></td>';
        });
    };
    tbody += '</table>';

    $('#list').html(tbody);
};

// 삭제 함수
function deleteMember(index) {
        
        if(confirm('삭제하시겠습니까?')){
            members.splice(index, 1);
            alert('삭제되었습니다.');

            // 저장
            localStorage.setItem('members', JSON.stringify(members));

            // 테이블 리스트를 갱신
            setList();
        }
    };


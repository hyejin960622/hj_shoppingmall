<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</head>
<body>
<div class="container">
	<form action="<%=request.getContextPath()%>/signup" method="post">
		<h2 class="text-center mt-2">BASIC INFORMATION</h2>
		<div class="form-group">
		  <label for="me_id">ID</label>
		  <input type="text" class="form-control" id="me_id" name="me_id">
		</div>
		<button class="btn btn-outline-success col-12 mb-3" type="button" id="idCheck">ID CHECK</button>	
		<div class="form-group">
		  <label for="me_pw">PASSWORD</label>
		  <input type="password" class="form-control" id="me_pw" name="me_pw">
		</div>
		<div class="form-group">
		  <label for="me_pw2">PASSWORD CHECK</label>
		  <input type="password" class="form-control" id="me_pw2" name="me_pw2">
		</div>
		<div class="form-group">
		  <label for="me_name">NAME</label>
		  <input type="text" class="form-control" id="me_name" name="me_name">
		</div>
		<div class="form-group">
		  <label for="me_phone">MOBILE</label>
		  <input type="text" class="form-control" id="me_phone" name="me_phone">
		</div>
		<div class="form-group">
		  <label for="me_email">E-MAIL</label>
		  <input type="text" class="form-control" id="me_email" name="me_email">
		</div>
		<div class="form-group">
			<label>ADDRESS</label>
			<div class="input-group mb-3">
		    <input type="text" id="me_post" placeholder="우편번호" name="me_post" class="form-control">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control ">
		  </div>
			<div class="input-group mb-3">
				<input type="text" id="me_addr" placeholder="주소" name="me_addr" class="form-control">
			</div>
			<div class="input-group mb-3">
				<input type="text" id="me_addr_detail" placeholder="상세주소" name="me_addr_detail" class="form-control">
			</div>
		</div>
		<h5 class="text-left">ADD INFOMATION</h5>
		<div class="form-group">
		  <label for="me_birth">BIRTH</label>
		  <input type="text" class="form-control" id="me_birth" name="me_birth">
		</div>
		<div class="form-group">
				  <label>성별:</label>			  
				</div>
				<div class="form-group">
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="checkbox" class="form-check-input" name="me_gender" value="M">남성
					  </label>
					</div>
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="checkbox" class="form-check-input"  name="me_gender" value="F">여성
					  </label>
					</div>
				</div>
		<button class="btn btn-outline-success col-12 mb-5">JOIN US</button>
	</form>
</div>
<script type="text/javascript">
	$(function(){
		$( "#me_birth" ).datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat: 'yy-mm-dd',
      yearRange: "1900:2022"
		});
	})
	
	$(function(){
			$("form").validate({
				rules: {
					me_id: {
						required : true,
					},
					me_pw: {
						required : true,
						regex: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[\w!@#$%^&*]{8,20}$/
					},
					me_pw2: {
						required : true,
						equalTo : me_pw
					},
					me_name: {
						required : true,
						regex: /^([가-힣]{2,20})|([a-zA-Z]{2,20})$/
					},
					me_phone: {
						required : true,
						regex: /^(010)-(\d{4})-(\d{4})$/
					},
					 me_email: {
			      required : "필수항목입니다.",
			      email : "이메일 형식에 맞지 않습니다."
			    },
			},
			//규칙체크 실패시 출력될 메시지
			messages : {
				me_pw: {
					required : "필수항목입니다.",
					regex : "아이디를 입력해주세요."
				},
				me_email: {
					required : "필수항목입니다.",
					email : "이메일 형식에 맞게 작성해주세요."
				},
				me_pw: {
					required : "필수항목입니다.",
					regex : "영어, 숫자, 특수문자(!@#$%^&*)를 혼합한 8글자 이상 20자 이하로 입력해주세요."
				},
				me_pw2: {
					required : "필수항목입니다.",
					equalTo : "비밀번호가 일치하지 않습니다."
				},
				me_name: {
					required : "필수항목입니다.",
					regex: "띄어쓰기 없이 2글자 이상 20자 이하로 입력해주세요."
				},
				me_phone: {
					required : "필수항목입니다.",
					regex: "010-0000-0000 형식으로 입력해주세요."
				}
	        }
	    });
	})
	$.validator.addMethod(
	    "regex",
	    function(value, element, regexp) {
	        var re = new RegExp(regexp);
	        return this.optional(element) || re.test(value);
	    },
	    "Please check your input."
	);
				

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
	
	    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	    var addr = ''; // 주소 변수
	
	    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	        addr = data.roadAddress;
	    } else { // 사용자가 지번 주소를 선택했을 경우(J)
	        addr = data.jibunAddress;
	    }
	
	    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	    document.getElementById('me_post').value = data.zonecode;
	    document.getElementById("me_addr").value = addr;
	    // 커서를 상세주소 필드로 이동한다.
	    document.getElementById("me_addr_detail").focus();
		}						
	}).open();
}


</script>


</body>
</html>
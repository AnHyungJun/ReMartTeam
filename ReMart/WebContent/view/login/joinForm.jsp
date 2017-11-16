<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<br>
	<br>
	<br>
	<br>
	<center>
		<div class="w3-container">
			<tr>
				<td colspan="2" height="39" class="w3-large w3-center"><b>JOIN</b></font>
					<br> <br> <br></td>
			</tr>
			<table class="w3-table w3-bordered w3-center"
				style="width: 40%; font-size: 11px;">

				<tr>
					<td width="200">아이디</td>
					<td width="400"><input type="text" name="id" size="10"
						class="w3-border" maxlength="12"> <input type="hidden"
						name="idchk"> <input type="button"
						class="w3-white w3-border" style="font-size: 11px;"
						name="confirm_id" value="중복확인" OnClick="openConfirmid(this.form)"></td>
				</tr>
				<tr>
					<td width="200">비밀번호</td>
					<td width="400"><input type="password" name="passwd" size="15"
						class="w3-border" maxlength="12"></td>
				<tr>
					<td width="200">이름</td>
					<td width="400"><input type="text" name="name" size="15"
						class="w3-border" maxlength="10"></td>
				</tr>
				<tr>
					<td width="200">성별</td>
					<td width="400"><input type="radio" name="option1">
						남성 &nbsp;&nbsp; <input type="radio" name="option1"> 여성 <br></td>
				</tr>
				<tr>
					<td width="200">주민등록번호</td>
					<td width="400"><input type="text" name="jumin1" size="7"
						class="w3-border" maxlength="6"></td>
				</tr>

				<tr>
					<th scope="row" rowspan="3"><label for="zip">주소</label></th>
					<td class="bg_none"><input type="text" id='zip1' name='zip1'
						readonly="readonly" style="width: 60px" class="w3-border" /> - <input
						type="text" id='zip2' name='zip2' readonly="readonly"
						style="width: 60px" class="w3-border"></input> <input
						type="button" class="w3-white w3-border" style="font-size: 11px;"
						onclick="openDaumPostcode();" value="우편번호"></td>
				</tr>
				<tr>
					<td class="bg_none"><label for="address1" class="tts">기본주소
					</label>&nbsp;&nbsp;<input type="text" id="address1" name="address1"
						class="w3-border" readonly="readonly"
						style="width: 340px; margin-right: 5px" /></td>
				</tr>
				<tr>
					<td><label for="address2" class="tts">상세주소
							&nbsp;&nbsp;</label><input type="text" id="address2" name="address2"
						class="w3-border" style="width: 340px; margin-right: 5px" /></td>
				</tr>
				<tr>
					<td width="200">휴대폰</td>
					<td width="400"><input type="text" name="phone" size="15"
						class="w3-border" maxlength="11"></td>
				</tr>
				<tr>
					<td width="200">이메일</td>
					<td width="400"><input type="text" name="email" size="40"
						class="w3-border" maxlength="30"></td>
				</tr>

			</table>
			<tr>
				<br>
			<tr height="30">
				<td align=center><br> <input type="submit"
					class="w3-button w3-light-grey w3-border" style="font-size: 11px;"
					value="회원가입"> <input type="button"
					class="w3-button w3-white w3-border" style="font-size: 11px;"
					value="취소"></td>
			</tr>
			</td>
			</tr>
		</div>
	</center>
</body>
</html>

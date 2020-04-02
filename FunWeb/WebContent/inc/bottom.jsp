<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
<hr>
<div id="copy">All contents Copyright 2011 FunWeb 2011 FunWeb 
Inc. all rights reserved<br>
Contact mail:funweb@funwebbiz.com Tel +82 64 123 4315
Fax +82 64 123 4321</div>
<div id="social"><img src="../images/facebook.gif" width="33" 
height="33" alt="Facebook">
<img src="../images/twitter.gif" width="34" height="34"
alt="Twitter"></div>

<article>

			<form action="../mail/mailSend.jsp" method="post">
				<h1>Contact us</h1>
				<table>
					<tr>
						<td>보내는 사람 메일 :</td>
						<td style="border-bottom: 1px solid;"><input type="text" name="sender" style="border:none" ></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td>받는 사람 메일 :</td> -->
<!-- 						<td><input type="text" name="receiver"></td> -->
<!-- 					</tr> -->
					<tr>
						<td>제목 :</td>
						<td style="border-bottom: 1px solid;"><input type="text" name="subject" style="border:none" ></td>
					</tr>
					<tr>
						<td>내용 :</td>
						<td style="border-bottom: 1px solid;"><textarea name="content" style="border: none; margin: 0px; width: 311px; height: 36px;" ></textarea></td>
					</tr>
					<tr>
						<td align=center colspan=2><input type="submit" value="보내기"></td>
					</tr>
				</table>
			</form>


		</article>
</footer>
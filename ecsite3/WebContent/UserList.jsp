<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>商品一覧画面</title>
</head>
<body>
	<div id="header">
		<div id="pr">
		</div>
	</div>
	<div id="main">
		<div id="top">
			<p>商品一覧</p>
		</div>
		<div>
			<s:if test="userInfoDTOList == null">
				<h3>ユーザー情報はありません。</h3>
			</s:if>
			<s:elseif test="message == null">
				<h3>ユーザー情報は以下になります。</h3>
				<table border="1">
					<tr>
						<th>id</th>
						<th>ログインID</th>
						<th>パスワード</th>
						<th>ユーザー名</th>
						<th>登録日</th>
						<th>更新日</th>
					</tr>
					<s:iterator value="userInfoDTOList">
						<tr>
							<td><s:property value="id" /></td>
							<td><s:property value="loginId" /></td>
							<td><s:property value="loginPass" /></td>
							<td><s:property value="userName" /></td>
							<td><s:property value="insert_date" /></td>
							<td><s:property value="update_date" /></td>
							<td>
								<a href='<s:url action="UserDataAction">
									<s:param name="loginId" value="%{loginId}"/>
									</s:url>'>詳細</a>
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:elseif>
			<s:if test="message !=null">
				<h3><s:property value="message"/></h3>
			</s:if>
			<s:form action="UserListDeleteConfirmAction">
				<s:submit value="削除する"/>
			</s:form>
			<br/>
			<div id="text-right">
				<p>管理者TOP画面へ戻る場合は<a href='control.jsp'>こちら</a></p>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="pr">
		</div>
	</div>
</body>
</html>
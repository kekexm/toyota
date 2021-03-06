<%@ page contentType="text/html;charset=utf-8" isErrorPage="true" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<title>500</title>
<link rel="stylesheet" type="text/css" href="/common/css/error.css" />
<script type="text/javascript">
	var phoneWidth =  parseInt(window.screen.width);
	var phoneScale = phoneWidth/640;
	var ua = navigator.userAgent;
	if (/Android (\d+\.\d+)/.test(ua)){
		var version = parseFloat(RegExp.$1);
		if(version>2.3){
			document.write('<meta name="viewport" content="width=640, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
		}else{
			document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
		}
	} else {
		document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
	};
	
</script>
	
</head>
<body>
<div class="wrapError">
	<%
		//Exception from JSP didn't log yet ,should log it here.
		String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
		LogFactory.getLog(requestUri).error(exception.getMessage(), exception);
	%>
	
	<div style="display:none">
		<%exception.printStackTrace(new java.io.PrintWriter(out));%>
	</div>
	
	<div class="wrap500Cen">
		<div class="prompt">
			<img src="/common/images/500.png" />
		</div>
		<div class="promptBtn">
			<h3>服务器内部错误</h3>
			<a href="javascript:;" class="backHome" onclick="location.href=window.location.href;" >重新加载此页</a>
		</div>
	</div>
</div>
</body>
</html>
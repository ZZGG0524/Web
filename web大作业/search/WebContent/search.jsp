<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>百度一下,你就知道</title>
<style type="text/css">
#mydiv {
	position: absolute;
	left: 30%;
	top: 30%;
}
.mouseOver{
backgroud:#708090;
color:#FFFAFA
}
.mouseOut{
backgroud:#FFFAFA;
color:red;
}

</style>
<script>
	function getMoreContents() {
		//1.获得输入的值
		var keyword = document.getElementById("keyword");
		if (keyword.value == "") {
			clearContents();
			return;
		}
		//2.创建xmlHttp对象
		var xmlHttp;
		xmlHttp = createXmlHttp();
		//３.发送信息给服务器
		var url = "search?keyword=" + escape(keyword.value);
		xmlHttp.open("GET", url, true);//true代表send方法后不用等待服务器的响应继续执行
		//4.xmlHttp绑定回调函数,有0-4四个状态，我们只关心第四个状态(complete)
		xmlHttp.onreadystatechange = callback;
		xmlHttp.send(null);//信息在url中写了
		//创建xmlHttp
		function createXmlHttp() {
			var xmlHttp;
			//对于大多数的浏览器都适用
			if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
			//考虑浏览器的兼容性
			if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Micsoft.XMLHTTP");
				if (!xmlHttp) {
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				}
			}
			return xmlHttp;
		}
		//回调函数
		function callback() {
			/*XMLHTTP 的 readyState 值含义： 
			0－未初始化，即尚未调用 open。
			1－初始化，即尚未调用 send。
			2－发送数据，即已经调用 send。
			3－数据传送中。
			4－完成。
			 */
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var result = xmlHttp.responseText;
					var json = eval("(" + result + ")");
					//获取数据后动态的展示
					setContents(json);
				}

			}
		}
		//设置关联数据	
		function setContents(contents) {
			clearContents();//设置前先清除数据
			var size = contents.length;
			for (var i = 0; i < size; i++) {
				var nextNode = contents[i];
				var tr = document.createElement("tr");
				var td = document.createElement("td");
				td.setAttribute("border", "0");
				td.setAttribute("bgcolor", "#FFFAFA");
				td.onmouseover = function() {
					this.className = "mouseOver";
				};
				td.onmouseout = function() {
					this.className = "mouseOut";
				};
				//当鼠标点击一个关联数据时，关联数据到输入框
				td.onclick = function() {
					alert("123");
				};
				var text = document.createTextNode(nextNode);
				td.appendChild(text);
				tr.appendChild(td);
				document.getElementById("tbody").append(tr);
			}

		}
	}
	//清空数据
	function clearContents() {
		var tbody = document.getElementById("tbody")
		var size = tbody.childNodes.length;
		for (var i = size - 1; i >= 0; i--) {
			tbody.removeChild(tbody.childNodes[i]);
		}
	}
	function clearAll() {
		clearContents();
	}
</script>
</head>
<body>
	<div id="mydiv">
		<input type="text" size=50 id="keyword" onkeyup="getMoreContents()"
			onblur="clearAll()" onfocus="getMoreContents()" />
		<!--onkeyup 键盘按键被松开时触发事件 -->
		<button id="btn1">百度一下</button>
		<!-- 内容动态展示 -->
		<div id="popDiv">
			<table>
				<tbody id="tbody">
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
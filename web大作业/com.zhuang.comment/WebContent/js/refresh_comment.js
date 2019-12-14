var comment_xhr = null;

function comment_init() {
	comment_xhr = GetXMlHttpRequest();
	if(comment_xhr) {
		comment_xhr.onreadystatechange = comment_response;
		comment_xhr.open('get','getComment.action',true);
		comment_xhr.send(null);
	}else {
		alert("你的浏览器不支持AJAX，推荐使用firefoxs或者chrome浏览器");
	}
}

function comment_response() {
	// if(comment_xhr.readyState <= 3) {
	// 	document.getElementById("usercomment").innerHTML = "loading...";
	// }
	if(comment_xhr.readyState == 4) {
		if(comment_xhr.status == 200) {
			document.getElementById("usercomment").innerHTML = "";
			var comment = comment_xhr.responseText;
			var json_comment = JSON.parse(comment);

			var parent_div = document.getElementById("usercomment");
			for(var i = 0; i < json_comment.length; i++) {
				var div = document.createElement("div");

				div.setAttribute("id", json_comment[i].comment_id);

				var username_div = document.createElement("a");
				var username = document.createTextNode("匿名用户：");
				username_div.appendChild(username);

				

				username_div.setAttribute("href","#");				

				var comment_content_div = document.createElement("div");
				var comment_content = document.createTextNode("评论内容:"+json_comment[i].comment_content);
				comment_content_div.appendChild(comment_content);

				var comment_time_div = document.createElement("div");
				var comment_time = document.createTextNode("评论时间:"+json_comment[i].comment_time);
				comment_time_div.appendChild(comment_time);

				div.appendChild(username_div);
				div.appendChild(comment_content_div);
				div.appendChild(comment_time_div);

				var br = document.createElement("br");

				parent_div.appendChild(div);
				parent_div.appendChild(br);
			}
		}else {
			document.getElementById("request").innerHTML = "操作失败!  "+comment_xhr.status;
		}
	}
}
var xhr = null;

function user_comment_init() {
    xhr = GetXMlHttpRequest();
	if(xhr) {
		xhr.onreadystatechange = user_comment_response;
	}else {
		alert("你的浏览器不支持AJAX，推荐使用firefoxs或者chrome浏览器");
	}
}

function user_comment_request() {
	if(xhr) {
		// var content = document.getElementById("comment_content").value;
		// var content = document.getElementById("comment_content").innerHTML;
        var content = $("#comment_content").val();
        if(content == "" ) {
            alert("内容为空");
        }else {
            xhr.open('post','insertComment.action',true);
            xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
            xhr.send('content='+content);
        }
	}
}

function user_comment_response() {
	if(xhr.readyState == 4) {
		if(xhr.status == 200) {
			cleartextarea();
            comment_init();
		}
	}
}

function cleartextarea() {
	document.getElementById("comment_content").value="";
}
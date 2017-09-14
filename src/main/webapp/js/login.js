$(function(){
    //用于登录和注册业内切换
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');

	});
	$('#switch_login').click(function(){

		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});

		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
	});
	if(getParam("a")=='0')
	{
		$('#switch_login').trigger('click');
	}

});

function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');



}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) {
	var params = location.search.substr(1); // 获取参数 平且去掉？
	var ArrParam = params.split('&');
	if (ArrParam.length == 1) {
		//只有一个参数的情况
		return params.split('=')[1];
	}
	else {
		//多个参数参数的情况
		for (var i = 0; i < ArrParam.length; i++) {
			if (ArrParam[i].split('=')[0] == pname) {
				return ArrParam[i].split('=')[1];
			}
		}
	}
}

function checkLoginInfo() {
	if ("" == $("#u").val()) {
		$("#u").tips({
			side: 2,
			msg: '用户名不得为空',
			bg: '#AE81FF',
			time: 3
		});
		$("#u").focus();
		return false;
	}
	if ($("#p").val() == "") {

		$("#p").tips({
			side: 2,
			msg: '密码不得为空',
			bg: '#AE81FF',
			time: 3
		});
		$("#p").focus();
		return false;
	}
	return true;
}
//获取当前项目的路径
    var urlRootContext = (function () {
//location.pathname返回URL的域名后的部分。例如 http://www.dreamdu.com/xhtml/ 返回/xhtml/但不含后面的参数
	var strPath = window.document.location.pathname;
//indexOf() 方法可返回某个指定的字符串值在字符串中首次出现的位置
//substring() 方法用于提取字符串中介于两个指定下标之间的字符（第二个参数可省），注意是之间所以是0，+1
	var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
	return postPath;
})();

function webLogin() {
	if (checkLoginInfo()) {
		var loginname = $("#u").val();
		var password = $("#p").val();
		var url = '/user/login';
		$.ajax({
			type: "POST",
			url: url,
			data: {loginId: loginname, pwd: password},
			dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
			cache: false,
			success: function (data) {
				if (data.code == 1) {
					window.location.href = data.data.nextUrl;
				} else {
					alert(data.msg);
				}
			}
		});
	}
}

function webReg() {

	if ($('#user').val() == "") {
		$('#user').focus();
		$("#user").tips({
			side: 2,
			msg: '用户名不能为空',
			bg: '#AE81FF',
			time: 3
		});
		return false;
	}

	if ($('#user').val().length < 4 || $('#user').val().length > 16) {
		$('#user').focus();
		$("#user").tips({
			side: 2,
			msg: '用户名位6-16字符',
			bg: '#AE81FF',
			time: 3
		});
		return false;
	}

	if ($('#name').val().length < 2
		|| $('#name').val().length > 16
		|| $('#name').val() == "") {

		$('#name').focus();

		$("#name").tips({
			side: 2,
			msg: '用户姓名必须为4-16位字符',
			bg: '#AE81FF',
			time: 3
		});
		return false;
	}

	if ($('#passwd').val().length < 6) {
		$('#passwd').focus();
		$("#passwd").tips({
			side: 2,
			msg: '密码不能小于6位',
			bg: '#AE81FF',
			time: 3
		});
		return false;
	}
	if ($('#passwd2').val() != $('#passwd').val()) {
		$('#passwd2').focus();
		$("#passwd2").tips({
			side: 2,
			msg: '两次密码不一致',
			bg: '#AE81FF',
			time: 3
		});
		return false;
	}

	var sqq = /^1[34578]\d{9}$/;
	if (!sqq.test($('#cellNumber').val()) || $('#cellNumber').val().length < 5 || $('#cellNumber').val().length > 12) {
		//原来的tips加到手机号上有问题
		$('#cellNumber').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×手机号格式不正确</b></font>");
		return false;
	}
    //
	//if ($('#sex').val() == "") {
	//	$('#sex').focus();
	//	$("#sex").tips({
	//		side: 2,
	//		msg: '性别不能为空',
	//		bg: '#AE81FF',
	//		time: 3
	//	});
	//	return false;
	//}
    //
	//if ($('#age').val() == "") {
	//	$('#age').focus();
	//	$("#age").tips({
	//		side: 2,
	//		msg: '年龄不能为空',
	//		bg: '#AE81FF',
	//		time: 3
	//	});
	//	return false;
	//}false

	var loginname = $("#user").val();
	var password = $("#passwd").val();
	var username = $("#name").val();
	var cellnumber = $("#cellnumber").val();
	var sex = $("#sex").val();
	var age = $("#age").val();

	$.ajax({
		type: "POST",
		url: '/user/reg',
		data: {loginId: loginname, pwd: password, name: username, sex: sex, age: age, cellNumber: cellnumber},
		dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
		cache: false,
		success: function (data) {
			if (data.code == 1) {
				window.location.href = data.data.nextUrl;
			} else {
                alert(data.msg);
			}
		}
	});
}


//var reMethod = "POST",
//		pwdmin = 6;
//
//$(document).ready(function() {
//
//
//	$('#reg').click(function() {
//
//		if ($('#user').val() == "") {
//			$('#user').focus().css({
//				border: "1px solid red",
//				boxShadow: "0 0 2px red"
//			});
//			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
//			return false;
//		}
//
//		if ($('#user').val().length < 4 || $('#user').val().length > 16) {
//
//			$('#user').focus().css({
//				border: "1px solid red",
//				boxShadow: "0 0 2px red"
//			});
//			$('#userCue').html("<font color='red'><b>×用户名位4-16字符</b></font>");
//			return false;
//		}
//		//异步检测用户名是否存在
//		//$.ajax({
//		//	type: reMethod,
//		//	url: "/userAction/findUser",
//		//	data: $("#user").val(),
//		//	dataType: 'html',
//		//	success: function(result) {
//        //
//		//		if (result.length > 2) {
//		//			$('#user').focus().css({
//		//				border: "1px solid red",
//		//				boxShadow: "0 0 2px red"
//		//			});$("#userCue").html(result);
//		//			return false;
//		//		} else {
//		//			$('#user').css({
//		//				border: "1px solid #D7D7D7",
//		//				boxShadow: "none"
//		//			});
//		//		}
//        //
//		//	}
//		//});
//
//
//		if ($('#passwd').val().length < pwdmin) {
//			$('#passwd').focus();
//			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
//			return false;
//		}
//		if ($('#passwd2').val() != $('#passwd').val()) {
//			$('#passwd2').focus();
//			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
//			return false;
//		}
//
//		var sqq = /^1[34578]\d{9}$/;
//		if (!sqq.test($('#cellNumber').val()) || $('#cellNumber').val().length < 5 || $('#cellNumber').val().length > 12) {
//			$('#cellNumber').focus().css({
//				border: "1px solid red",
//				boxShadow: "0 0 2px red"
//			});
//			$('#userCue').html("<font color='red'><b>×手机号格式不正确</b></font>");return false;
//		} else {
//			$('#cellNumber').css({
//				border: "1px solid #D7D7D7",
//				boxShadow: "none"
//			});
//
//		}
//
//		$('#regUser').submit();
//	});
//
//
//});
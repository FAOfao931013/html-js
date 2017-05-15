<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理</title>
	<link rel="stylesheet" type="text/css" href="res/ysfd.css">
	<link rel="stylesheet" type="text/css" href="res/jquery-easyui-1.4.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="res/jquery-easyui-1.4.2/themes/icon.css">
	<script type="text/javascript" src="res/jquery-easyui-1.4.2/jquery.min.js"></script>
	<script type="text/javascript" src="res/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
</head>
<body>
  <div style="margin:5px 0;"></div>
	<div class="easyui-layout" style="width:1340px;height:630px;">
		<div data-options="region:'north'" style="height:75px">
			<jsp:include page="mt/layout_top.jsp" />
		</div>
		<div data-options="region:'south'" style="height:30px;">
			<jsp:include page="mt/layout_bottom.jsp" />
		</div>
		<div data-options="region:'west',title:'系统菜单'" style="width:210px;">
			<jsp:include page="mt/layout_left.jsp" />
		</div>
		<div data-options="region:'center'">
			<div id="tabs" class="easyui-tabs" style="width:1125px;">
				<div title="首页" data-options="selected:true,href:'index_form.jsp'" style="padding:10px">
				</div>
				<div title="业务内容" data-options="closable:true" style="padding:2px">
				</div>
				<div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
					帮助内容
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">

		function getUrlParam(name)	//应该置于工具库当
		{
			if(window.location.search.length > 0) {
				var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
 				var r = window.location.search.substr(1).match(reg);  //匹配目标参数
 				if(r==null)
 					return null;
 				else
 					return r[2];	//需要unescape
			}
			else {
				return null;
			}
		}

		//因为时间原因暂时写两遍，实际应该与layout_left.jsp（菜单的定义相合并）
		var menu_tab_title_url_array = new Array(
			["100101", "学员录入", "m1/add_student_form.jsp"],
			["100102", "查看学员", "m1/add_student_form.jsp"],
			["100103", "管理学员", "m1/add_student_form.jsp"],
			["100201", "组班", "m1/add_student_form.jsp"],
			["100202", "查询班级", "m1/add_student_form.jsp"],
			["100203", "管理班级", "m1/add_student_form.jsp"],
			["100301", "成绩录入", "m1/add_student_form.jsp"],
			["100302", "查询成绩", "m1/add_student_form.jsp"],
			["100303", "管理成绩", "m1/add_student_form.jsp"],
			["100401", "查看证书", "m1/add_student_form.jsp"],
			["300001", "用户管理", "m1/add_student_form.jsp"],
			["300003", "日志查看", "m1/add_student_form.jsp"]
		);

		$(document).ready(function(){
			function fuck(){
				alert(1);
				var x=document.getElementById("iCard");
				x.value=x.value.toUpperCase();
			}

 			var tabs = $('#tabs').tabs('tabs');

			var menuID = getUrlParam("menuID");
			if(menuID == null) {
				$("#tabs").tabs("select",0);
 				tabs[1].panel('options').tab.hide();
			}
			else {
				for(var i=0; i<menu_tab_title_url_array.length; i++) {
					if(menu_tab_title_url_array[i][0] == menuID) {
		 				tabs[1].panel('options').tab.show();
						$("#tabs").tabs("select",1);

				        $('#tabs').tabs('update', {
				            tab: tabs[1],
				            options: {
				                title: menu_tab_title_url_array[i][1],
				                href: menu_tab_title_url_array[i][2]
				            }
				        });

				        tabs[1].panel('refresh');

						break;
					}
				}
			}
		});
	</script>
</body>
</html>
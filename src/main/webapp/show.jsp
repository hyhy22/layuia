<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/modules/code.css">
</head>
<body>

	<div>
		<div>
			<button data-method="notice" class="layui-btn" onclick="xinzeng()">新增</button>
		</div>
		<table class="layui-table" lay-data="{url:'<%=request.getContextPath()%>/user/queryUser', page:true,id:'idTest'}" lay-filter="demo">
	  		<thead>
		    	<tr>
		      		<th lay-data="{field:'userid', sort: true}">ID</th>
		      		<th lay-data="{field:'username', sort: true}">姓名</th>
		      		<th lay-data="{field:'address', sort: true}">地址</th>
		      		<th lay-data="{field:'birthday', sort: true}">生日</th>
		      		<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
		    	</tr>
		  	</thead>
		</table>
	</div>
	
	<form id="xin" class="layui-form">
		<table align="center">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
				    <input type="text" name="username" placeholder="姓名" class="layui-input">
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="address" placeholder="地址" class="layui-input">
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="birthday" placeholder="生日" class="layui-input">
				</td>
			</tr>			
			<tr>
				<td>
					<div class="layui-form-item" style="width:500px">
					    <div class="layui-input-block">
					    	<button class="layui-btn layui-btn-warm layui-btn-radius" onclick="fan(this)">返回</button>
					      	<button class="layui-btn layui-btn-normal layui-btn-radius" onclick="zeng()">添加</button>
					    </div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
	<form id="xinas" class="layui-form">
		<input type="hidden" name="userid"/>
		<table align="center">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
				    <input type="text" name="username" placeholder="姓名" class="layui-input">
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="address" placeholder="地址" class="layui-input">
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="birthday" placeholder="生日" class="layui-input">
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					<div class="layui-form-item" style="width:500px">
					    <div class="layui-input-block">
					    	<button class="layui-btn layui-btn-warm layui-btn-radius" onclick="fans(this)">返回</button>
					      	<button class="layui-btn layui-btn-normal layui-btn-radius" onclick="gia()">添加</button>
					    </div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/lay/modules/tree.js"></script>	
<script type="text/javascript">
	$("#xin").hide();
	$("#xinas").hide();
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/javascript">

	layui.use('table', function(){
	  var table = layui.table;
	  table.on('tool(demo)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'del'){
	      layer.confirm('真的删除行么', function(index){
	    	  var id = data.userid;
	      	  $.ajax({
	      		  url:"<%=request.getContextPath()%>/user/deleteUser",
	      		  type:"post",
	      		  data:{"userid":id},
	      		  dataType:"text",
	      		  success:function (data){
	      			  location.reload();
	      		  }
	      	  })
	      });
	    } else if(obj.event === 'edit'){
	      	$("[name='userid']").val(data.userid);
	      	$("[name='username']").val(data.username);
	      	$("[name='address']").val(data.address);
            $("[name='birthday']").val(data.birthday);
	      	layer.open({
	  	      type: 1,
	  	      area: ['550px', '550px'],
	  	      content: $("#xinas").show(),
	  	    });
	    }
	  });
	  
	  $('.demoTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	});

	
	function xinzeng(){
		$("[name='username']").val("");
		$("[name='address']").val("");
		layer.open({
	      type: 1,
	      area: ['550px', '300px'],
	      content: $("#xin").show(),
	    });
	}
	
	function fan(obj){
		location.reload();
	}
	
	function fans(obj){
		location.reload();
	}
	
	function zeng(){
		$.ajax({
			url:"<%=request.getContextPath()%>/user/addUser",
			type:"post",
			data:$("#xin").serialize(),
			dataType:"text",
			success:function (data){
				$("#xin").hide();
				location.reload();
			}
		});
	}
	
	function gia(){
		$.ajax({
      		url:"<%=request.getContextPath()%>/user/updateUser",
      		type:"post",
      		data:$("#xinas").serialize(),
      		dataType:"text",
      		success:function (data){
      			$("#xinas").hide();
      			location.reload();
      		}
      	})
	}
	
	/*layui.use('upload', function(){
		  var $ = layui.jquery  
		  ,upload = layui.upload;  
		    
		  //普通图片上传  
		  var uploadInst = upload.render({  
		    elem: '#empphoto'  
		    ,url: '<%=request.getContextPath()%>/layuis/uploadFile.action'  
		    ,before: function(obj){  
		      //预读本地文件示例，不支持ie8  
		      obj.preview(function(index, file, result){  
		        $('#demo1').attr('src', result); //图片链接（base64）  
		      });  
		    }  
 		    ,done: function(res){  
 		      //上传成功  
 		        return layer.msg(res.msg,{icon: res.status,time: 2000});  
			}  
		  });  
		}); */
	
</script>
</body>
</html>
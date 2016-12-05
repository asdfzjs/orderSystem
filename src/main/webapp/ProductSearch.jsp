<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>产品管理</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<form method="post" action="searchOrder.do" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 内容列表</strong> <a href=""
					style="float: right; display: none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search"padding-left:10px;>
					 <li>信息类型：</li>
					<!--<li><input id="txtBeginDate" name="txtBeginDate"
						style="width: 170px; padding: 7px 10px; border: 1px solid #ccc; margin-right: 10px;" />
					</li> -->
					<li><select name="cid" class="input"
						style="width: 200px; line-height: 17px;" onchange="changesearch()">
							<option value="">请选择地址</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
					</select></li>
					<input type="submit" value="查询"
						class="button border-main icon-search">
				</ul>

				<ul class="search" style="padding-left: 10px; margin-top: 5px;">
					<li><a class="button border-main icon-plus-square-o"
						href="addProduct2.do"> 新增</a></li>
				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th width="100" style="text-align: left; padding-left: 20px;">产品编码</th>
					<th width="100" style="text-align: left; padding-left: 20px;">类别</th>
					<th width="10%">系列</th>
					<th>产品名称</th>
					<th>等级</th>
					<th>色号</th>
					<!-- <th>是否审核</th> -->
					<th width="310">操作</th>
				</tr>
				<c:forEach items="${productlist}" var="product">
					<tr>
						<td><c:out value="${product.commodityID}" /></td>
						<td><c:out value="" />${product.commdityCategoryID}</td>
						<td><c:out value="" />${product.commditySeriesID}</td>
						<td><c:out value="${product.commdityName}" /></td>
						<td><c:out value="${product.commdityLevelID}" /></td>
						<td><c:out value="${product.colorCode}" /></td>
						<td>
						<div class="button-group">
								<a class="button border-main" href="add.html"><span
									class="icon-edit"></span> 修改</a> <a class="button border-red"
									href="javascript:void(0)" onclick="return del(1,1,1)"><span
									class="icon-trash-o"></span> 删除</a>
							</div></td>
					</tr>
				</c:forEach>
				<tr>
				</tr>
				<tfoot>
					<div class="pagelist">
						<tr>
							<td colspan="9" align="center" class="p"><c:if
									test="${pageNum != 1}">
									<a href="searchOrder.do?query=a&page=${pageNum - 1}">上一页</a>
								</c:if> <c:if test="${pages != 1}">
									<c:forEach var="pageIndex" begin="1" end="${pages}">
										<c:choose>
											<c:when test="${pageNum == pageIndex}">
												<a>${pageIndex}</a>
											</c:when>
											<c:otherwise>
												<a href="searchOrder.do?page=${pageIndex}">${pageIndex}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if> <c:if test="${pageNum != pages}">
									<a href="searchOrder.do?page=${pageNum+1}">下一页</a>
								</c:if></td>
						</tr>
					</div>
				</tfoot>
			</table>
		</div>
	</form>
	<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>
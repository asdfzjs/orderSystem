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
<title>订单待支付</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<link href="css/lyz.calendar.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.5.1.js"></script>
<script src="js/lyz.calendar.min.js" type="text/javascript"></script>
<style>
body {
font-size: 12px;
font-family: "微软雅黑", "宋体", "Arial Narrow";
}
</style>
<script>
    $(function () {
        $("#txtBeginDate").calendar({
            controlId: "divDate",                                 // 弹出的日期控件ID，默认: $(this).attr("id") + "Calendar"
            speed: 200,                                           // 三种预定速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认：200
            complement: true,                                     // 是否显示日期或年空白处的前后月的补充,默认：true
            readonly: true,                                       // 目标对象是否设为只读，默认：true
            upperLimit: new Date("2099/01/01"),                               // 日期上限，默认：NaN(不限制)
            lowerLimit: new Date("2011/01/01"),                   // 日期下限，默认：NaN(不限制)
            callback: function () {                               // 点击选择日期后的回调函数
                //alert("您选择的日期是：" + $("#txtBeginDate").val());
            }
        });
        $("#txtEndDate").calendar();
    });
</script>
</head>
<body>
	<form method="post" action="searchPayOrder.do" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 内容列表</strong> <a href=""
					style="float: right; display: none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search"padding-left:10px;>
					<li>请选择起止时间：</li>
					<li>  
						<input id="txtBeginDate" name="txtBeginDate" style="width:170px;padding:7px 10px;border:1px solid #ccc;margin-right:10px;"/>
  						<input id="txtEndDate" name="txtEndDate" style="width:170px;padding:7px 10px;border:1px solid #ccc;" />
  					</li>
					<li>
					<select name="cid" class="input"
						style="width: 200px; line-height: 17px;" onchange="changesearch()">
							<option value="">请选择地址</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
					</select>
					</li>
					<input type="submit" value="查询" class="button border-main icon-search">
				</ul>
				
				<ul class="search" style="padding-left: 10px; margin-top:5px;">
					<!-- <li><a class="button border-main icon-plus-square-o"
						href="add.html"> 导入</a></li> -->
					<li><a class="button border-main icon-plus-square-o"
						href="javascript:window.print()"> 打印</a></li>
					<!-- <li><a class="button border-main icon-plus-square-o"
						href="add.html"> 导出</a></li> -->
				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th width="100" style="text-align: left; padding-left: 20px;">经销商抬头</th>
					<th width="10%">省</th>
					<th>市</th>
					<th>订单号</th>
					<th>订单金额</th>
					<th>订单状态</th>
					<th width="10%">提交时间</th>
					<th>备注</th>
					<th width="310">操作</th>
				</tr>
				<c:forEach items="${orderlist}" var="order">  
				<tr>
				     	<td><c:out value="${order.fullname}"/></td>  
				        <td><c:out value=""/>${order.province}</td>  
				        <td><c:out value=""/>${order.city}</td>   
				        <td><c:out value="${order.orderID}"/></td>  
				        <td><c:out value="${order.amount}"/></td>  
				        <td><c:out value="${order.orderStatus}"/></td>  
				        <td><c:out value="${order.createTime}"/></td>  
				        <td><c:out value="${order.urgent}"/></td>  
				        <td><div class="button-group"> <a class="button border-main" href="add.html"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="javascript:void(0)" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> </div></td>  
				</tr>  
				</c:forEach>  
				<tr>
      </tr>
				<tfoot>  
			        <div class="pagelist">
			        <tr>  
			            <td colspan="9" align="center" class="p">  
			                <c:if test="${pageNum != 1}">  
			                    <a href="searchOrder.do?query=a&page=${pageNum - 1}">上一页</a>  
			                </c:if>  
			                <c:if test="${pages != 1}">  
			                    <c:forEach var="pageIndex" begin="1" end="${pages}">  
			                         <c:choose>  
			                            <c:when test="${pageNum == pageIndex}">  
			                                <a>${pageIndex}</a>  
			                            </c:when>  
			                            <c:otherwise>  
			                                <a href="searchPayOrder.do?page=${pageIndex}">${pageIndex}</a>  
			                             </c:otherwise>  
			                        </c:choose>  
			                    </c:forEach>  
			                </c:if>  
			                <c:if test="${pageNum != pages}">  
			                    <a href="searchPayOrder.do?page=${pageNum+1}">下一页</a>  
			                </c:if>  
			            </td>  
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
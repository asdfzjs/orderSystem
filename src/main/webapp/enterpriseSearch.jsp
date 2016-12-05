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
<title>经销商管理</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="js/jquery-1.5.1.js" type="text/javascript"></script>
<script src="js/CityJson.js" type="text/javascript"></script>
<script src="js/ProJson.js" type="text/javascript"></script>
<script src="js/DistrictJson.js" type="text/javascript"></script>
<script type="text/javascript">

//获取下拉列表选中项的文本
function getSelectedText(name){
  var obj=document.getElementById(name);
  for(i=0;i<obj.length;i++){
      if(obj[i].selected==true){
          return obj[i].innerText;//关键是通过option对象的innerText属性获取到选项文本
      }
  }
};
        $(function () {

            $.each(province, function (k, p) { 
                var option = "<option value='" + p.ProID + "'>" + p.ProName + "</option>";
                $("#selProvince").append(option);
            });
             
            $("#selProvince").change(function () {
                var selValue = $(this).val(); 
                $("#selCity option:gt(0)").remove();
                 
                $.each(city, function (k, p) { 
                    if (p.ProID == selValue) {
                        var option = "<option value='" + p.CityID + "'>" + p.CityName + "</option>";
                        $("#selCity").append(option);
                    }
                });
                 
            });
             
            $("#selCity").change(function () {
                var selValue = $(this).val();
                $("#selDistrict option:gt(0)").remove(); 

                $.each(District, function (k, p) {
                    if (p.CityID == selValue) {
                        var option = "<option value='" + p.Id + "'>" + p.DisName + "</option>";
                        $("#selDistrict").append(option);
                    }
                }); 
            }); 
        });
        
        function checkAreas(){
      	  $("#province").val(getSelectedText("selProvince"));
           $("#city").val(getSelectedText("selCity"));
      }
      
    </script>
</head>
<body>
	<form method="post" action="searchEnterprise.do" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 内容列表</strong> <a href=""
					style="float: right; display: none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search"padding-left:10px;>
					<li>经销商名称：</li>
					<li><input id="txtBeginDate" name="fullname"
						style="width: 170px; padding: 7px 10px; border: 1px solid #ccc; margin-right: 10px;" />
					</li>
					<li><select id="selProvince" class="input" name="selProvince"
						style="width: 200px; line-height: 17px;">
				        <option value="0">--请选择省份--</option>
				    </select></li>
				    <input type="hidden" id="province" name="province" />
				    <li><select id="selCity" class="input" name="selCity"
						style="width: 200px; line-height: 17px;">
				        <option value="0">--请选择城市--</option>
				    </select></li>
					<input type="hidden" id="city" name="city" />
					<input type="submit" value="查询"
						class="button border-main icon-search" onClick="return checkAreas()">
				</ul>

				<ul class="search" style="padding-left: 10px; margin-top: 5px;">
					<li><a class="button border-main icon-plus-square-o"
						href="addProduct.do"> 新增</a></li>
				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th width="100" style="text-align: left; padding-left: 20px;">经销商抬头</th>
					<th width="100" style="text-align: left; padding-left: 20px;">经销商全称</th>
					<th width="10%">省</th>
					<th>市</th>
					<th>详细地址</th>
					<th>联系人</th>
					<th>联系电话</th>
					<th width="10%">传真</th>
					<th>经销商登陆账号</th>
					<th>生效日期</th>
					<th>失效日期</th>
					<th>状态</th>
					<th width="310">操作</th>
				</tr>
				<c:forEach items="${enterpriselist}" var="enterprise">
					<tr>
						<td><c:out value="${enterprise.title}" /></td>
						<td><c:out value="" />${enterprise.fullname}</td>
						<td><c:out value="" />${enterprise.province}</td>
						<td><c:out value="${enterprise.city}" /></td>
						<td><c:out value="${enterprise.address}" /></td>
						<td><c:out value="${enterprise.contact}" /></td>
						<td><c:out value="${enterprise.telephone}" /></td>
						<td><c:out value="${enterprise.fax}" /></td>
						<td><c:out value="${enterprise.mem_id}" /></td>
						<td><c:out value="${enterprise.startdate}" /></td>
						<td><c:out value="${enterprise.enddate}" /></td>
						<td>
						<c:choose>
								<c:when test="${enterprise.status == '01'}">
								正常使用
								</c:when>
								<c:when test="${enterprise.status == '02'}">
								 已注销
								</c:when>
								<c:otherwise>
								停用
								</c:otherwise>
								</c:choose>
						</td>
						<td><div class="button-group">
								<a class="button border-main" href="getEnterprise.do?mem_id=${enterprise.mem_id}"><span
									class="icon-edit"></span> 修改</a> <a class="button border-red"
									href="deleteEnterprise.do?mem_id=${enterprise.mem_id}"><span class="icon-trash-o"></span> 删除</a>
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
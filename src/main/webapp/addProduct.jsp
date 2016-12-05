<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>添加产品</title> 
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>新增产品</strnong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="addProduct3.do">      
      <div class="form-group">
      <table border=0  cellspacing=0 cellpadding=0>
		<tr>
			<th colspan=2> 
	          <label>产品编号：</label>
	        </th>
	        <td>
	        <div class="field">
	          <input type="text" class="input" name="commodityID" value="" />
	          <div class="tips"></div>
	        </div>
	        </td>
	    </tr>
	    
	    <tr>
			<th colspan=2> 
	          <label>类别：</label>
	        </th>
	        <td>
	        <div class="field">
			        <select name="commdityCategoryID">
				        <c:forEach items="${categoryList}" var="category">
						        	<option value="${category.commdityCategoryID}">${category.commdityCategoryName}</option>
						</c:forEach>
					</select>
		    </div>
	        </td>
	    </tr>
	    
	    <tr>
			<th colspan=2> 
	          <label>系列：</label>
	        </th>
	        <td>
	        <div class="field">
	          <select name="commditySeriesID">
		        <c:forEach items="${seriesList}" var="series">
		        	<option value="${series.commditySeriesID}"><c:out value="${series.commditySeriesName}" /></option>
				</c:forEach>
			 </select>
	        </div>
	        </td>
	    </tr>
	    
	    <tr>
			<th colspan=2> 
	          <label>产品名称：</label>
	        </th>
	        <td>
	        <div class="field">
	          <input type="text" class="input" name="commdityName" value="" />
	          <div class="tips"></div>
	        </div>
	        </td>
	    </tr>
		
		
		<tr><th rowspan=3>规格： </th>
		<th>长</th> <td><div class="field">
	          <input type="text" class="input" name="length" value="" />
	          <div class="tips"></div>
	        </div></td>
		</tr>
		<tr><th>宽</th> <td><div class="field">
	          <input type="text" class="input" name="width" value="" />
	          <div class="tips"></div>
	        </div></td></tr>
		<tr><th>厚</th> <td><div class="field">
	          <input type="text" class="input" name="height" value="" />
	          <div class="tips"></div>
	        </div></td></tr>
		<!-- <tr><th>片/件</th> <td>
			<div class="field">
	          <select class="input" name="priceunit">
	          	<option value="片" >片</option>
	          	<option value="平方米" >平方米</option>
	          </select>
	          <div class="tips"></div>
	        </div></td></tr>-->
		<tr> 
			<th colspan=2> 
	          <label>等级：</label>
	        </th>
	        <td>
	        <div class="field">
	          <select name="commdityLevelID">
		        <c:forEach items="${levelList}" var="level">
		        	<option value="${level.commdityLevelID}"><c:out value="${level.commdityLevelName}" /></option>
				</c:forEach>
			 </select>
	        </div>
	        </td>
	    </tr>
		
		
		<tr>
			<th colspan=2> 
	          <label>单价：</label>
	        </th>
	        <td>
	        <div class="field">
	          <input type="text" class="input" name="price" value="" />
	          <div class="tips"></div>
	        </div>
	        </td>
	    </tr>
	    
	    <tr>
			<th colspan=2> 
	          <label>每包片数：</label>
	        </th>
	        <td>
	        <div class="field">
	          <input type="text" class="input" name="count" value="" />
	          <div class="tips"></div>
	        </div>
	        </td>
	    </tr>
	    
	    <tr>
			<th colspan=2> 
	          <label>计价单位：</label>
	        </th>
	        <td>
	        <div class="field">
	          <select class="input" name="priceunit">
	          	<option value="平方米" >平方米</option>
	          	<option value="片" >片</option>
	          </select>
	        </div>
	        </td>
	    </tr>
	    <tr>
			<th colspan=2> 
	          <label>色号：</label>
	        </th>
	        <td>
	        <div class="field">
	          <input type="text" class="input" name="colorCode" value="" />
	          <div class="tips"></div>
	        </div>
	        </td>
	    </tr>
	    
		</table>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>
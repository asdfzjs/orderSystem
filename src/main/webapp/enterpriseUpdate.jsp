<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>修改经销商</title>
<script type="text/javascript" src="js/jquery-1.5.1.js"></script>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="js/CityJson.js" type="text/javascript"></script>
<script src="js/ProJson.js" type="text/javascript"></script>
<script src="js/DistrictJson.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<style>
body {
	font-size: 12px;
	font-family: "微软雅黑", "宋体", "Arial Narrow";
}
</style>
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
            	$("#province").val(getSelectedText("selProvince"));
            });
             
            $("#selCity").change(function () {
                var selValue = $(this).val();
                $("#selDistrict option:gt(0)").remove(); 

                $.each(District, function (k, p) {
                    if (p.CityID == selValue) {
                        var option = "<option value='" + p.Id + "'>" + p.DisName + "</option>";
                        $("#city").val$("#selDistrict").append(option);
                    }
                }); 
            	$("#city").val(getSelectedText("selCity"));
            }); 
           
        });
        
        function checkAreas(){
        	  $("#provice").val(getSelectedText("selProvince"));
             $("#city").val(getSelectedText("selCity"));
        }
        
        
    </script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span>新增经销商</strnong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="updateProduct.do">
				<div class="form-group">
					<table border=0 cellspacing=0 cellpadding=0>
						<tr>
							<th colspan=2><label>经销商抬头：</label></th>
							<td>
								<div class="field">
									<input type="text" class="input" name="title" value="${enterprise.title}" />
									<div class="tips"></div>
								</div>
							</td>
						</tr>

						<tr>
							<th colspan=2><label>经销商全称：</label></th>
							<td>
								<div class="field">
									<input type="text" class="input" name="fullname" value="${enterprise.fullname}" />
									<div class="tips"></div>
								</div>
							</td>
						</tr>

						<tr>
							<th colspan=2><label>所在省：</label></th>
							<td>
								<div class="field">
									<select id="selProvince" class="input" name="province2"
										style="width: 200px; line-height: 17px;">
										<option value="0">${enterprise.province}</option>
									</select>
									<div class="tips"></div>
								</div>
							</td>
						</tr>
						<input type="hidden" id="province" name="province" />
						<tr>
							<th colspan=2><label>所在市：</label></th>
							<td>
								<div class="field">
									<select id="selCity" class="input" name="city2"
										style="width: 200px; line-height: 17px;">
										<option value="0">${enterprise.city}</option>
									</select>
									<div class="tips"></div>
								</div>
							</td>
						</tr>
						<input type="hidden" id="city" name="city" />

						<tr>
							<th colspan=2><label>详细地址：</label></th>
							<td>
								<div class="field">
									<input type="text" class="input" name="address" value="${enterprise.address}" />
									<div class="tips"></div>
								</div>
							</td>
						</tr>


						<tr>
							<th colspan=2><label>联系人：</label></th>
							<td>
								<div class="field">
									<input type="text" class="input" name="contact" value="${enterprise.contact}" />
									<div class="tips"></div>
								</div>
							</td>
						</tr>

						<tr>
							<th colspan=2><label>联系电话：</label></th>
							<td>
								<div class="field">
									<input type="text" class="input" name="telephone" value="${enterprise.telephone}" />
									<div class="tips"></div>
								</div>
							</td>
						</tr>

						<tr>
							<th colspan=2><label>传真：</label></th>
							<td>
								<div class="field">
									<input type="text" class="input" name="fax" value="${enterprise.fax}" />
									<div class="tips"></div>
								</div>
							</td>
						</tr>
						<tr>
							<th colspan=2><label>经销商登录账号：</label></th>
							<td>
								<div class="field">
									<input type="text" class="input" name="telephone" value="${enterprise.telephone}" />
									<div class="tips"></div>
								</div>
							</td>
						</tr>
						<tr>
							<th colspan=2><label>生效时间：</label></th>
							<td>
							<div class="field">
									<input class="input" name="startdate" type="text" onClick="WdatePicker()" value="${enterprise.startdate}">
							</div>
							</td>
						</tr>

						<tr>
							<th colspan=2><label>失效时间：</label></th>
							<td><div class="field">
									<input class="input" type="text" name="enddate" onClick="WdatePicker()" value="${enterprise.enddate}"></div>
							</td>
						</tr>
						<tr>
							<th colspan=2><label>账户状态：</label></th>
							<td>
								<div class="field">
									<select  class="input" name="status" 
											style="width: 200px; line-height: 17px;">
												<option value="01">正常</option>
												<option value="03">无效</option>
												<option value="02">注销</option>
									</select>

									<div class="tips"></div>
								</div>
							</td>
						</tr>
				<input type="hidden" class="input" name="mem_id" value="${enterprise.mem_id}" />

					</table>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit" onClick="return checkAreas()">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
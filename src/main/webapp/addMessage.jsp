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
<title>添加经销商</title>
<script type="text/javascript" src="js/jquery-1.5.1.js"></script>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<style>
body {
	font-size: 12px;
	font-family: "微软雅黑", "宋体", "Arial Narrow";
}
</style>

</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span>新增信息</strnong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="addMessage.do">
				<div class="form-group">
					<table border=0 cellspacing=0 cellpadding=0>
						<tr>
							<th colspan=2><label>标题：</label></th>
							<td>
								<div class="field">
									<input type="text" class="input" name="title" value="" />
									<div class="tips"></div>
								</div>
							</td>
						</tr>

						<tr>
							<th colspan=2><label>内容：</label></th>
							<td>
								<div class="field">
									<textarea type="text" class="input" name="content" value="" style="height:100px;"></textarea>
									<div class="tips"></div>
								</div>
							</td>
						</tr>

						


						<tr>
							<th colspan=2><label>是否置顶：</label></th>
							<td>
								<div class="field">
									<input name="zhiding" type="checkbox" value="1" />是否置顶 </label>
									<div class="tips"></div>
								</div>
							</td>
						</tr>

						
						<tr>
							<th colspan=2><label>账户状态：</label></th>
							<td>
								<div class="field">
									<select  class="input" name="status" 
											style="width: 200px; line-height: 17px;">
												<option value="01">正常</option>
												<option value="02">下架</option>
									</select>

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
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<script type="text/javascript">
			$(function(){
				var currentPage=$("#currentPage").val()
				var totalPage=$("#totalPage").val();
				if(parseInt(currentPage)<=1){
					$("#upPage").attr("disabled","disabled");
				}
				if(parseInt(currentPage)>=parseInt(totalPage)){
					$("#downPage").attr("disabled","disabled");
				}
			});

			function changePage(){
				var nextPage=$("#toPage").val()
				var totalPage=$("#totalPage").val();
				var reg=/^([1-9]+[0-9]*)$/;
				if(!reg.exec(nextPage)){
					alert("请正确输入页数");
					$("#nextPage").val(1);
					return;
				}else {
				if(nextPage==''||parseInt(nextPage)==0){
					nextPage=1;
				}else if(parseInt(nextPage)>parseInt(totalPage)){
					nextPage=totalPage;
				}
				}
				page(nextPage);
			}

			function pageTo(val){
				page(val);
			}
		</script>
		<input id="currentPage" type="hidden" value="${currentPage}">
		<input id="totalPage" type="hidden" value="${pageCount}">
		<table width="710px" border="0" cellspacing="0" cellpadding="0">
			<tr valign="middle">
				<td width="25%" height="20" nowrap="nowrap" valign="middle">
					<span
						style="color: #03515d; font-size: 12px; vertical-align: middle;">共有
						${totalCount} 条记录，当前第 ${currentPage}/${pageCount} 页</span>
				</td>
				<td width="75%" valign="middle" style="font-size: 12px;">
					<div align="right">
						<table width="352" height="20" border="0" cellpadding="0"
							cellspacing="0">
							<tr valign="middle">
								<td class="page_td">
									<input type="button" class="button_02" onclick="pageTo('1')"
										value="首页" />
								</td>
								<td class="page_td">
									<input id="upPage" type="button" class="button_02"
										onclick="pageTo('${currentPage-1}')" value="上页" />
								</td>
								<td class="page_td">
									<input id="downPage" type="button" class="button_02"
										onclick="pageTo('${currentPage+1}')" value="下页" />
								</td>
								<td class="page_td">
									<input type="button" class="button_02"
										onclick="pageTo('${pageCount}')" value="未页" />
								</td>
								<td width="130px" style="font-size: 14px;">
									转到第
									<input type="text" style="width: 30px; height: 16px;"
										id="toPage" value="${currentPage}"
										onkeydown="if(event.keyCode==13){changePage();}" />
									页&nbsp;
								</td>
								<td class="page_td">
									<input type="button" class="button_02" value="跳转"
										onclick="changePage()" />
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>

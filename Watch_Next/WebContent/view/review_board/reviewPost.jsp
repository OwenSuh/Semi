<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.*, java.util.ArrayList, common.Comment, report.model.vo.Report" %>
<%
	Review r = (Review)request.getAttribute("review");
	ArrayList<Comment> list = (ArrayList<Comment>)request.getAttribute("list");
	ArrayList<Report> replist = (ArrayList<Report>)request.getAttribute("replist");
	char chk = (char)request.getAttribute("chk");
	char fchk = (char)request.getAttribute("fchk");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<%@ include file="/view/layout/import.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link type="text/css" href="/Watch_Next/Resources/css/review_post.css" rel="stylesheet" >
<style>
	.subnav li {width: 120px;}
	.popimg{width:35px; height:35px;}
	.like{width:35px; height:35px;}
	.likeb{background-color:transparent; border:none;}
	#sirenb{background-color:transparent; border:none;}
</style>
</head>
<body>
	<%@ include file="/view/layout/Header.jsp" %>
	<br clear="all">

	<section>
		<!-- 리뷰 게시판 상세 -->
	
		<div id="review">
			<h2 id="rh2"><strong>리뷰 게시판 상세보기</strong></h2>
			<hr class="hline">
			<form action="<%= request.getContextPath()%>/view/review_board/ReviewUpdateForm.jsp" id="detailForm" name="detailForm"> 
				<div style="overflow:hidden; height:auto;" id="box">
					<div id="spo">
						<b>
							<%if(r.getSpo().trim().equals("Y")) { %>
								스포있음
							<%} else { %>
								스포없음
							<% } %>	
							<input type="hidden" name="revW_spolier" value="<%= r.getSpo() %>">
						</b>
						&nbsp;&nbsp;&nbsp;
						
						<label id=rtitle>[<%= r.getmTitle() %>] <%= r.getbTitle() %></label>
						<input type="hidden" name="revW_reviewName" value="<%= r.getbTitle() %>">	 
						<input type="hidden" name="revW_movieName" value="<%= r.getmTitle() %>">	 									  
					</div>
					<input type="hidden" name="rv" value="<%=r.getbNo() %>">
		  
					<hr>
		
					<div id="wInfo">
						<table>
							<tr>
								<td width="850px" style="font-size:17px;">
									<% if(r.getPopcorn() ==1) { %>
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
									<%} else if(r.getPopcorn() ==2) { %>
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
									<%} else if(r.getPopcorn() ==3) { %>
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
									<%} else if(r.getPopcorn() ==4) { %>
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_gray.png">
									<%} else if(r.getPopcorn() ==5) { %>
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
										<img class="popimg" src="<%=request.getContextPath()%>/Resources/images/popcorn_after.png">
									<%} %>
								</td>
								<td width="80px" style="font-size:17px;">글쓴이 : </td>
								<td width="70px" style="font-size:17px;" id="rpWriter">
									<ul>
										<li>
											<%= r.getbWriter() %>
											<% if(!loginUser.getUserId().equals(r.getbWriter())) { %> 
											<ul>
												<li><a onclick="window.open('<%= request.getContextPath()%>/view/letter/letter_send.jsp', 'message',
														'left='+(screen.availWidth-450)/2+',top='+(screen.availHeight-650)/2+', width=450px,height=650px')">
													쪽지보내기</a>
												</li>
														
												<li>
													<% if(fchk == 'N' || fchk == 0) {%>
														<a onclick="onFollow()">팔로우추가</a>
													<%} else if(fchk == 'Y') {%>
														<a onclick="onNoFollow()">팔로우해제</a>
													<%} %>
												</li>
												<% } %>
											</ul>
										</li>
									</ul>
								</td>
								<td width="70px" style="font-size:17px;">날짜 : </td>
						      	<td width="150px" style="font-size:17px;"><%= r.getbDate() %></td>
						      	<td width="80px" style="font-size:17px;">조회수 : </td>
						      	<td width="70px" style="font-size:17px;"><%= r.getbCount() %></td>
							</tr>
								
						</table>
						
						<script>
							function onFollow(){
								var fwriter = "<%=r.getbWriter()%>";
								var rv = <%=r.getbNo() %>;
								
								$.ajax({
									url: 'putFollow.rv',
									data: {fwriter:fwriter, rv:rv},
									success: function(){
										alert('팔로우성공');
										location.reload();
									}
								})
							}
							
							function onNoFollow(){
								var fwriter = "<%=r.getbWriter()%>";
								var rv = <%=r.getbNo() %>;
								
								$.ajax({
									url: 'notFollow.rv',
									data: {fwriter:fwriter, rv:rv},
									success: function(){
										alert('팔로우해제 성공');
										location.reload();
									}
								})
							}
						</script>
					</div>
		
					<hr>
		
					<div id="content" style="font-size:15px;">
						
							<%= r.getbContent()%>
							<input type="hidden" name="editor_content" value='<%= r.getbContent() %>'>	 
							<br><br><br><br><br><br><br><br><br><br>
						
					</div>
		
					<!-- 좋아요 및 신고버튼 -->
					<table style="margin-left: auto; margin-right: auto; margin-bottom:10px; text-align: center; font-size:15px; color:red;">
						<tr>
							<td>	
							<% if(!loginUser.getUserId().equals(r.getbWriter())) { %>
									<% if(chk == 'N' || chk==0) {%>
							 			<button type="button" class="likeb" onclick="onLike();"><img class="like" src="<%=request.getContextPath()%>/Resources/images/like.png"></button>
									<% } else if(chk =='Y') {%>
										<button type="button" class="likeb" onclick="onNoLike();"><img class="like" src="<%=request.getContextPath()%>/Resources/images/likeee.png"></button>
									<% } %>
									<script>
										function onLike(){
											var rv = <%=r.getbNo() %>;
 											location.href="<%=request.getContextPath()%>/putLike.rv?rv="+rv;
										}
										function onNoLike(){
											var rv = <%=r.getbNo() %>;
											location.href="<%=request.getContextPath()%>/notLike.rv?rv="+rv;
										}
									</script>
							</td>
							<td width=5px></td>
							<td>

									<input type="hidden" name="rbNo" value="<%=r.getbNo() %>">
									<button type="button" id="sirenb" value="popup" onclick="sendPop();">
										<img src="/Watch_Next/Resources/images/siren2.png" width="37px" height="37px">
									</button>
							
									

									<script>
									var win;
									  function sendPop(){
											win = window.open('<%=request.getContextPath() %>/view/reportPop/reportPop.jsp', 'pop', 
											'left='+(screen.availWidth-500)/2+',top='+(screen.availHeight-300)/2+', width=500px,height=300px');	
											setTimeout(function(){
												win.document.getElementById("bno").value="<%=r.getbNo() %>";
											},600)
										   }
									  
															  
 									</script>
							</td>
							
						</tr>
							
						<tr>
							<td id="likeCnt"><%= r.getbLike() %></td>
							<td></td>
							
							<%} else {%>
							<% if(chk == 'N' || chk==0) {%>
							 			<button type="button" class="likeb" onclick="onLike();"><img class="like" src="<%=request.getContextPath()%>/Resources/images/like.png"></button>
									<% } else if(chk =='Y') {%>
										<button type="button" class="likeb" onclick="onNoLike();"><img class="like" src="<%=request.getContextPath()%>/Resources/images/likeee.png"></button>
									<% } %>
									<script>
										function onLike(){
											var rv = <%=r.getbNo() %>;
 											location.href="<%=request.getContextPath()%>/putLike.rv?rv="+rv;
										}
										function onNoLike(){
											var rv = <%=r.getbNo() %>;
											location.href="<%=request.getContextPath()%>/notLike.rv?rv="+rv;
										}
									</script>
							</td>
							<td width=5px></td>
							<td>

									<input type="hidden" name="rbNo" value="<%=r.getbNo() %>">
							
								
							</td>
							
						</tr>
							
						<tr>
							<td id="likeCnt"><%= r.getbLike() %></td>
							<td></td>
							
							<%} %>
						</tr>
					</table>
				</div>
			
	    
	 
	    <div id=listbtn>
	    <% if(loginUser != null && loginUser.getUserId().equals(r.getbWriter())) { %>
	        <button  class="myButton" id="bupBtn" type=submit title="수정" >수정</button>&nbsp;&nbsp;&nbsp;
	        <button  class="myButton" id="bdelBtn" type=button title="삭제" onclick="deleterv();">삭제</button>&nbsp;&nbsp;&nbsp;
	   		<button class="myButton" id="bliBtn" onclick="location.href='<%=request.getContextPath() %>/list.rv'" type=button title="목록" >목록</button>
	    <% } else if(!loginUser.getUserId().equals(r.getbWriter())) {%>    
	        <button style="margin-left:175px" class="myButton" id="bliBtn" onclick="location.href='<%=request.getContextPath() %>/list.rv'" type=button title="목록" >목록</button>
	    <% }  %>            		
	    </div>
	    </form>
	    
	    <br clear="all">
	    
	   	<!-- 댓글 -->
		<div id="replybox1">
			<textarea id="reply_content" placeholder="심한 욕설 또는 저속한 표현등과 같이 이용자 다수에게 불쾌감을 주는  댓글은 삭제&신고 될 수 있습니다." name="reply_content" rows="2" cols="193" placeholder="댓글을 입력하세요." style="white-space: pre-wrap; resize: none; border:none;"></textarea>
		</div>
		<button class="myButton" id="reply_save">댓글 작성</button>
	
		<br clear="all">
	
		<div id="replybox2">
			<table id="replySelectTable">
				<%if(list.isEmpty()){ %>
					<tr><td rowspan=2 colspan=2 style="font-size:14px; text-align:center"><br>댓글이 없습니다.</td></tr>
				<% } else {%>
					<% for(int i=0; i<list.size(); i++) { %>
					<tr>
						<th>
							<%= list.get(i).getrWriter() %>
						</th>
						<td>
							<% if(loginUser!=null && loginUser.getUserId().equals(list.get(i).getrWriter())) { %>
								<form action="<%=request.getContextPath()%>/deleteReply.rv">
									<input type="submit" class="myButton" id="replydelete" value="삭제" onclick="return rpdel();">
									<input type=hidden name="replyno" value="<%=list.get(i).getrId()%>">

								<input type="hidden" name="rv" value="<%=r.getbNo() %>">
							</form>
							<% } else { %>
								<%-- <% for(int j=0; j<list.size(); j++) { %> --%>
									<%-- <% if(list.get(i).getrId() == ){ %> --%>
									<button type=button id=report class="myButton" onclick="sendPopR();">신고</button>
<%-- 									<%} %> --%>
<%-- 								<%} %> --%>
							<% } %>	
							
							<script>
							  function sendPopR(){
									win = window.open('<%=request.getContextPath() %>/view/reportPop/reportPop.jsp', 'pop', 
									'left='+(screen.availWidth-500)/2+',top='+(screen.availHeight-300)/2+', width=500px,height=300px');	
									setTimeout(function(){
										win.document.getElementById("rno").value="<%=list.get(i).getrId() %>";
									},600)
								}
							</script>
						</td>
						
					</tr>
					<tr>	
						<td colspan=2 style="font-size:14px">
							<%= list.get(i).getrContent() %>
						</td>
					</tr>
					
					<% } %>
				<% }  %>
			</table>
		</div> 
		</div>
	</section>

	<!-- footer -->
	<%@ include file="/view/layout/footer.jsp" %>
	<script src="<%=request.getContextPath() %>/Resources/js/Header.js"></script>
	
	<script>
		//게시글삭제
		function deleterv(){
			var bool = confirm('정말 삭제하시겠습니까?');
			if(bool) {
				location.href="<%= request.getContextPath()%>/delete.rv?rv="+"<%=r.getbNo()%>";
			}
		}
		
		//댓글작성
		$('#reply_save').click(function(){
			var writer = '<%= loginUser.getUserId() %>';
			var bid = <%= r.getbNo() %>;
			var content = $('#reply_content').val();
			$.ajax({
				url: 'insertReply.rv',
				data: {writer:writer, content:content, bid:bid},
				success : function(data){
					$replyTable = $('#replySelectTable');
					$replyTable.text("");
					
					console.log(data);
										
					for(var key in data) {
						var $tr = $('<tr>');
						var $writerTd = $('<td>').text(data[key].rWriter).css('color','red');
						var $contentTd = $('<td>').text(data[key].rContent).css('font-size','14px');
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						$replyTable.append($tr);
					}
					
					$('#reply_content').val("");

					$("#replySelectTable").load(window.location.href + " #replySelectTable");
					
					
				} 
				
			});
		});
		
		//댓글삭제
		function rpdel(){
			var rpmsg = confirm("댓글을 삭제합니다.");
			if(rpmsg == true){
				alert('삭제하였습니다.');
			} else{
				return false;
			}
				
		};
		
		
	</script>
	
	
</body>
</html>
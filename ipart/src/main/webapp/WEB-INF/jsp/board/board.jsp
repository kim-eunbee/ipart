<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>I PART - 커뮤니티</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">       
<style>
	#outer_box {
		margin: 100px 200px;
	}
</style>
</head>
<body>
	<c:import url="../main/main.jsp"/>
	<div id="outer_box">
		<div id="board_box">
		</div>
		<div id="comment_box">
		</div>
		<div id="paging_box">
		</div>
	</div>
	
	

	
	
	
	<script>
		$(function(){
			boardlist();
		})
	
		/** 게시판의 글 리스트 불러오기 */
		function boardlist(type) {
			var burl = type ? "search.ipart" : "list/notice.ipart";
			$.ajax({
				url : burl,
				type : "POST",
				dataType: "json",
				data : $("#searchForm").serialize()
			}).done(function(board) {
					$("#comment_box").html("");
					var type="detail";
					var html="";
						html += "<table class='table table-hover boardList'>"
						html += "<tr>"
						html += "<th>번호</th>"
						html += "<th>제목</th>"
						html += "<th>작성자</th>"
						html += "<th>작성일${category}</th>"
						html += "</tr>"
						for(var b of board){
					   	   html+="<tr onclick='boardDetail("+b.no+",`detail`)'>"
						   html+="<td>"+b.no+"</td>"
						   html+="<td>"+b.title+"</td>"
						   html+="<td>"+b.writer+"</td>"
						   html+="<td>"+b.regDate+"</td>"
						   html+="</tr>"
						}
						html+="<tr>";
						html+="<td colspan='4'><button type='button' onclick='boardWriteFrom()' class='btn btn-default'>글 쓰기</button></td>";
						html+="</tr>";
						html+="</table>"
						html+="<form id='searchForm' method='POST'>"
						html+= "<select name='searchType'>"
						html+= "<option value='uni'selected >통합검색</option>"
						html+= "<option value='writer' >글쓴이</option>"
						html+= "<option value='title' >제목</option>"
						html+= "<option value='contetn' >내용</option>"
						html+= "</select>"
						html+= "<input type='text' name='keyWord'size='30' />"
						html+= "<button type='button' onclick='boardlist(`search`)' class='btn btn-default btn-xs'>검색</button>"
						html+= "</form>"
						
						$("#board_box").html(html);
						
						
						
						
						
						paging();
			});
			
		};
		
		
		
		/** 게시판의 상세 글 리스트*/
		function boardDetail(no, type){
			$.ajax({
				url : "detail/"+no+".ipart",
				type : "POST",
				dataType: "json"
			}).done(function (b) {
				if(type=="detail"){
					var html=""
					html +="<table class='table'>"
					html +="<tr>"
					html += "<td>"+b.no+"</td>"
					html += "<td>["+b.category+"]</td>"
					html += "<td>"+b.title+"</td>"
					html +="</tr>"
					html +="<tr>"
					html += "<td>"+b.writer+"</td>"
					html += "<td>"+b.view+"</td>"
					html += "<td>"+b.regDate+"</td>"
					html +="</tr>"
					html += "<tr>"
					html += "<td colspan='3'>"+b.content+"</td>"
					html += "</tr>"
					html += "<tr>"
					html += "<td></td>"
					html += "<td></td>"
					html += "<td>"
					html += "<button type='button' onclick='boardDetail("+b.no+",`modify`)' class='btn btn-default'>수정</button>"
					html += "<button type='button' onclick='boardDelete("+b.no+")' class='btn btn-default'>삭제</button>"
					html += "</td>"
					html += "</tr>";
					html += "</table>";
					
					$("#board_box").html(html);
					commentList(b);
				}else if(type=="modify"){
					boardWriteFrom(b);
				}
			});
		};
		
		
		/** 게시글 작성 폼 */
		function boardWriteFrom(b){
			$("#comment_box").html("");
			var no = b ? b.no : 0;
			var title= b ? b.title : "";
			var writer= b ? b.writer : "";
			var content= b ? b.content : "";
			var html="";
			html += "<form id='writeForm' method='POST'><tr>";
			html += "<table class='table'>";
			html += "<td><input type='hidden' name='no' value='"+no+"'/>"
			html += "<input type='hidden' name='category' value='notice'/>"
			html += "글제목 <input type='text' size='110' name='title' value='"+title+"'></input>"
			html += "<td>작성자 <input type='text' name='writer' value='"+writer+"'></input></td>"
			html += "</tr>";
			html += "<td colspan='2'>내용<br><textarea name='content' cols='4000' rows='30' style='width: 100%' >"+content+"</textarea></td>"
			html += "<tr>"
			if(!b){
				html += "<td colspan='2'><button type='button' onclick='boardWrite()' class='btn btn-default'>글 등록</button></td>"
			}else{
				html += "<td colspan='2'><button type='button' onclick='boardModify("+b.no+")' class='btn btn-default'>글 수정</button></td>"
			}
			html += "</tr>"
			html += "</table>";
			html += "</form>";
			
			$("#board_box").html(html);
		};
		
		
	
		function boardWrite(){
			$.ajax({
				url : "write.ipart",
				type : "POST",
				dataType: "json",
				data : $("#writeForm").serialize()
			}).done(function (cnt) {
				if(cnt==1){
					alert("게시글이 등록되었습니다.");
					boardlist();
				}else{
					alert("게시글이 등록되는 도중에 문제가 생겼습니다.");
				}
			});
			

		};
		
		
		
		/** 게시글 수정 */
		function boardModify(no){
			$.ajax({
				url : "modify.ipart",
				type : "POST",
				dataType: "json",
				data : $("#writeForm").serialize()
			}).done(function (cnt) {
				if(cnt==1){
					alert("게시글이 수정되었습니다.");
					boardlist();
				}else{
					alert("게시글이 수정되는 도중에 문제가 생겼습니다.");
				}
			});
		};
		
		/** 게시글 삭제*/
		 function boardDelete(no){
			$.ajax({
				url : "delete/"+no+".ipart",
				type : "POST",
				DataType : "json"
			}).done(function(cnt){
				console.log(cnt);
				if(cnt==1){
					alert("게시글이 삭제되었습니다.");
					boardlist();
				}else{
					alert("게시글이 삭제되는 도중에 문제가 생겼습니다.");
				}
			});
		};
		
		/**  댓글 목록   */
		function commentList(b){
			/** 댓글 목록  */
			/* if($("#comment"+c.no" .btn").attr("disabled")){} */
			html2 = ""
			html2 += "<form id='commentWriteForm' method='POST'>"
			html2 += "<table class='table table-hover'>"
			html2 += "<tr>"
			html2 += "<td colspan='2'><input type='hidden' name='boardNo' value='"+b.no+"'/><input type='text' name='writer' /></td>"
			html2 += "<td colspan='2'><textarea name='content' cols='100' rows=3' style='width: 100%' ></textarea></td>"
			html2 += "<td><button type='button' onclick='commentWrite("+b.no+")' class='btn btn-default'>등록</button></td>"
			html2 += "</tr>"
			html2 += "</table>"
			html2 += "</form>"
			html2 += "<form id='commentModifyForm' method='POST'>"
			html2 += "<table class='table table-hover commentList'>"
			for(var c of b.commentList){
			html2 += "<tr id=comment"+c.no+">"
			html2 += "<td>"+c.no+"</td>"
			html2 += "<td>"+c.writer+"</td>"
			html2 += "<td>"+c.content+"</td>"
			html2 += "<td>"+c.regDate+"</td>"
			html2 += "<td><button type='button' id='CModify' onclick='commentModifyForm("+JSON.stringify(c)+")' class='btn btn-default'>수정</button>"
			html2 += "<button type='button' id='CDelete' onclick='commentDelete("+c.no+","+b.no+")' class='btn btn-default'>삭제</button></td>"
			html2 += "</tr>"
			}
			html2 += "</table>"
			html2 += "</form>"
			
			$("#comment_box").html(html2);
		}
		
		
		/**  댓글 작성  */
		function commentWrite(no){
			$.ajax({
				url : "/ipart/comment/write.ipart",
				type : "POST",
				dataType : "json",
				data : $("#commentWriteForm").serialize()
			}).done(function (cnt) {
				if(cnt==1){
					alert("댓글이 등록되었습니다.");
					$("#commentWriteForm")[0].reset();
					boardDetail(no, "detail");
				}else{
					alert("댓글이 등록되는 도중에 문제가 생겼습니다.");
				}
			});
		};
		
		
		/**  댓글 수정 폼   */
		var b= {};
		function commentModifyForm(c){
			html2=""
			html2 += "<td colspan='2'><input type='hidden' name='boardNo' value='"+c.boardNo+"'/><input type='text' name='writer'  value="+c.writer+" /></td>"
			html2 += "<td colspan='2'><input type='hidden' name='no' value='"+c.no+"'/><textarea name='content' cols='100' rows=3' style='width: 100%' >"+c.content+"</textarea></td>"
			html2 += "<td><button type='button' onclick='commentModify("+c.boardNo+")' class='btn btn-default'>등록</button>"
			html2 += "<button type='button' onclick='boardDetail("+c.boardNo+",`detail`)' class='btn btn-default'>취소</button></td>"
			$("#comment"+c.no).html(html2);
			$(".commentList #CModify, #CDelete").attr("disabled","disabled");
		};	
		
		/**  댓글 수정    */
		function commentModify(no){
			$.ajax({
				url : "/ipart/comment/modify.ipart",
				type : "POST",
				DataType : "json",
				data : $("#commentModifyForm").serialize()
			}).done(function(cnt){
				console.log(cnt);
				if(cnt==1){
					boardDetail(no, "detail");
					alert("댓글이 수정되었습니다.");
					$(".commentList #CModify, #CDelete").removeAttr("disabled");
				}else{
					alert("댓글이 수정되는 도중에 문제가 생겼습니다.");
				}
			});
		};
		
		
		
		
		/**  댓글 삭제    */
		function commentDelete(no,boardNo){
			$.ajax({
				url : "/ipart/comment/delete/"+no+".ipart",
				type : "POST",
				DataType : "json"
			}).done(function(cnt){
				console.log(cnt);
				if(cnt==1){
					alert("댓글이 삭제되었습니다.");
					boardDetail(boardNo, "detail");
				}else{
					alert("댓글이 삭제되는 도중에 문제가 생겼습니다.");
				}
			});
		};
		
		function paging(){
			$.ajax(){
				url : "/",
				type : "",
				
			}
			html="<c:if test='${pageResult.count != 0}'>"
			html+="<nav>"
			html+="<ul class='pagination'>"
			html+="<li <c:if test='${pageResult.prev eq false}'>class='disabled'</c:if> >"
			html+="<a href='${pageResult.beginPage - 1}' aria-label='Previous'>"
			html+="<span aria-hidden='true'>&laquo;</span>"
			html+="</a>"
			html+="</li>"
			html+="<c:forEach var='i' begin='${pageResult.beginPage}' end='${pageResult.endPage}'>"
			html+="<li <c:if test='${i eq pageResult.pageNo}'>class='active'</c:if> >"
			html+="<c:choose>"
			html+="<c:when test='${i ne pageResult.pageNo}' >"
			html+="<a href='${i}'>${i}</a>"
			html+="</c:when>"
			html+="<c:otherwise>"
			html+="<a href='#'>${i}</a>"
			html+="</c:otherwise>"
			html+="</c:choose>"
			html+="</li>"
			html+="</c:forEach>"
			html+="<li <c:if test='${pageResult.next eq false}'>class='disabled'</c:if> >"
			html+="<a href='${pageResult.endPage + 1}' aria-label='Next'>"
			html+="<span aria-hidden='true'>&raquo;</span>"
			html+="</a>"
			html+="</li>"
			html+="</ul>"
			html+="</nav>"
			html+="</c:if>"
			
			
			$("paging_box").html(html);
		}
		
		
		

		
		
		


	</script>
</body>
</html>
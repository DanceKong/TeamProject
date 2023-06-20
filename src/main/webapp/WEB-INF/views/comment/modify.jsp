<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
            <div class="rounded-box">
               <div style="padding: 9px">
                  <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77" alt="프로필 사진" width="36" height="36" hspace="3" vspace="1" align=left>&nbsp; 
                  <input type="text" id="commentWriter" style="border: none; font-size:1.3em" value="${sessionScope.username }" readonly><br><br>
               </div>
               <textarea class="scroll" id="commentContents" style="outline:none; resize:none; margin-left:8px; border-color:#ced4da" rows="5" cols="60" required>${comOne.commentContents }</textarea>
               <input style="margin-left:8px; margin-top:10px; padding:8px" type="button" value="수정" onclick="commentModify()" class="comment-btn">

            </div>
</body>

<script>
const commentModify = () => {
   const writer = document.getElementById("commentWriter").value;
   const contents = document.getElementById("commentContents").value;
   const id = ${comOne.id};
   
   $.ajax({
      type:"post",
      url: "/commMo?id=" + id + "&num=${one.num}",
      data:{
         "commentWriter": writer,
         "commentContents": contents,
         "boardNum": id
      },
   });
   alert("수정하시겠습니까?");
   /* opener.history.back(0); */
   window.opener.location.href = window.opener.document.URL;
   window.close();
   /* window.location.href='content?num=' + ${one.num}; */
};
</script>
</html>
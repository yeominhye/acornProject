/**
 * 신고 기능 
 */
var boardUserCode = document.querySelector('.boardUsercode').value;
var userCode = document.querySelector('.userCode').value;
var boardCode = document.querySelector('.boardCode').value;

function report(){
    let reportCode = null;
    let reportedUserCode = boardUserCode;
    let reportingUserCode = $("#regUserCode").val() ? $("#regUserCode").val() : null;
       let reportDate = null;
       let reportContent = null;
       
       let report ={
         reportCode: reportCode,
         boardCode: boardCode,
         reportedUserCode: reportedUserCode,
         reportingUserCode: reportingUserCode,
         reportDate: reportDate,
         reportContent: reportContent
       }
       
       console.log(report);
       
       let reportString = JSON.stringify(report);
       console.log(reportString);
       
      
       
      $.ajax({
          type: "post",
          url: "/project/board/free/report"+boardCode,
          data: reportString,
          contentType: "application/json",
          
          success: function(response, data) {
             console.log("성공:"+ data);
             alert("신고되었습니다.");
               
          },
          error: function(xhr, status, error) {
              console.log("오류");  
 			  window.location.href = "http://localhost:8080/project/user/login.do"; 
          }
      });
       
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>실물후기</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- Third party plugin CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
 <style type="text/css">
      .btnGroup {
        text-align: center;
      }
    </style>
</head>
<body>
	<header class="masthead"></header>
	<jsp:include page="../common/topbar.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function(){
		
			$.get("${root}/localcode/sido/default"
		            ,function(data, status){
		               $.each(data, function(index, vo) {
		                  $(".sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
		               });//each
		            }//function
		            , "json"
		      );//get
		      $("select[id$='Sido'] option:eq(0)").prop("selected",true);
		      $("select[id$='Gugun'] option:eq(0)").prop("selected",true);
		      $("select[id$='Dong'] option:eq(0)").prop("selected",true);//로딩시 첫번째 요소 선택
		});
		
		function hing()
		{

			var data = {
				title : $("#title").val(),
				writer : $("#writer").val(),
				content: $("#Content").val(),
				dong_code: $("#reviewDong option:selected").val()
				//attachList: $("attachList").val();
			};
			
			$.ajax({
				type:'post',
				url:"/dealReview/new",
				dataType:'text',
				contentType:'application/json; charset=utf-8',
				data:JSON.stringify(data)
			}).success(function(){
				window.location.assign('dealReview.do');
				alert("글이 등록되었습니다.");
			}).fail(function(error)
			{
				alert(JSON.stringify(error));
			});
		}
				
		</script>
	<div id="content" class="container">
	<br/>
	<h3 align="center">게시글 등록</h3>
	<form role="form">
		<p class="m-4"></p>
		<p style="font-size: 15px; display: inline-block; background-color: #d7ebc2;"> </p>
		
		<table id="dealReview-write-table" class="table table-hover">
			<tbody>
				<br/>
				<tr>
					<div class="form-group form-inline"
							style="display: inline-block; text-align: center;">
							<div class="form-group form-inline justify-content-between">
								<label for="preferLocation" class="mr-3">지역</label> 
								<select id="reviewSido"
									class="form-control sido mr-3" name="sido">
									<option selected value="">선택</option>
								</select> <select id="reviewGugun" class="form-control gugun mr-3" name="gugun">
									<option selected value="">선택</option>
								</select> <select id="reviewDong" class="form-control dong mr-3" name="dong">
									<option selected value="">선택</option>
								</select>
							</div>
					</div>
				</tr>
				
				
				<tr>
					<th scope="row" >작성자</th>
					<td colspan="2">
					<input placeholder="작성자"  id="writer" style="width: 100%" />
					</td>
				</tr>
				
				
				<tr>
					<th scope="row">제목</th>
					<td colspan="2">
					<input placeholder="제목"  id="title" style="width: 100%" />
					</td>
				</tr>
				
				<tr>
					<th scope="row" >내용</th>
					<td colspan="2">
					<textarea placeholder="내용" id="Content" style="width: 100%" rows="14"></textarea></td>
				</tr>
				<tr>
					<th scope="row" >파일 업로드</th>
					<td colspan="2">	
					<input type="file" name="uploadFile" style="width: 100%" multiple="multiple"/></td>
				</tr>
					
			</tbody>
		</table>
		<div class='uploadResult'> 
         		 <ul>
          			
          		</ul>
       		  </div>	
		
		
		</form>
		
		<div class="container btnGroup">
			<button type="submit" id="okay-btn" class="btn btn-light" >확인</button>
			<button type="button"  class="btn btn-light"
				data-toggle="dropdown" onClick="location.href='dealReview.do'">취소</button>
		</div>
		<p class="m-4"></p>
		<p style="font-size: 15px; display: inline-block; background-color: #d7ebc2;"> </p>
	
	</div>
	<script>

$(document).ready(function(e){


  var formObj = $("form[role='form']");
  
  $("button[type='submit']").on("click", function(e){
    
    e.preventDefault();
    
    console.log("submit clicked");
    
    var str = "";
    
    $(".uploadResult ul li").each(function(i, obj){
      console.log(i);
      var jobj = $(obj);
      
      console.log(jobj);
      console.log("-------------------------");
      console.log(jobj.data("uuid "));
      
      
      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
      str +="<input type='hidden' name='writer'  value='${writer}'/>"
      //console.log(attachList[0].fileName);
    });
    
    console.log(str);
    
    formObj.append(str).submit();
 	hing()
    
  });

  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 50242880; //50MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);      
    }
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
        	console.log("!!!!");
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
    
  });  
  
  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
    
		
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "</div>";
			str +"</li>";
		}

    });
    
    uploadUL.append(str);
  }
  
  
  
  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    var targetFile = $(this).data("file");
    var type = $(this).data("type");
    
    var targetLi = $(this).closest("li");   
    $.ajax({
      url: '/deleteFile',
      data: {fileName: targetFile, type:type},
      dataType:'text',
      type: 'POST',
        success: function(result){
           alert(result);
           targetLi.remove();
         }
    }); //$.ajax
   });


  
});

</script>
	
<jsp:include page="../common/bottombar.jsp"></jsp:include>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
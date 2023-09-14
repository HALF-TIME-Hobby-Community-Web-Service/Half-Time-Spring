<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="../css/write.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="../js/write.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    게시물 작성
    <div class="backboard">
        <nav>
            <ul class="write">
                <ul class="imglist">
                <li>
                    <img src=""width="100" height="100" class="real-upload" id="input-multiple-image" >
                </li>
                <li>
                    <img src="" width="100" height="100" class="real-upload" id="input-multiple-image">
                </li>
                <li>
                    <img src="" width="100" height="100" class="real-upload" id="input-multiple-image">
                </li>
                <li>
                    <img src="" width="100" height="100" class="real-upload" id="input-multiple-image">
                </li>
            </ul>    
               
                <form action="">
                    <input type="text" class="write" >
                    <input type="file" id="uploadFiles" class="form-control" accept="image/*" multiple onchange="setThumbnail()">
                    <div class="upload"></div>
                    <ul class="image-preview"></ul>
                    <button class="btn btn-primary">게시물 작성</button>
                </form>


                <div class="searchlocation">
                <form class="form-inline d-flex justify-content-center md-form form-sm location" >
                    <input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="위치를 입력해주세요."
                      aria-label="Search">
                    <i class="fas fa-search" aria-hidden="true"></i><button type="button" class="btn btn-outline-primary searchbtn">검색</button>
                </form>


                </div>
                <div class="searchcategory">
                    <form class="form-inline d-flex justify-content-center md-form form-sm category">
                        <input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="카테고리를 입력해주세요."
                          aria-label="Search">
                          <button type="button" class="btn btn-outline-primary searchbtn" >검색</button>
                        <i class="fas fa-search" aria-hidden="true"></i>
                </div> 
                    
                
           
            
        </nav>
        
    </div>

</body>
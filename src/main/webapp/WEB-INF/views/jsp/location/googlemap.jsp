<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="/resources/js/googlemap.js"></script>
  <script
    defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5o_ctjVFbtm8kt-EfRg7KNU4_hL4JFaw&callback=initMap"
  ></script>
</head>
<body>
 <form class="d-flex" role="search" id="searchform">
		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                            id="feed_searchinput">
                        <button type="button" class="btn btn-outline-dark btn-outline-success" id="location_search"
                            type="submit">Search</button>
                    </form>
  <div id="map" style=" width: 70% ;height: 500px;"></div>
</body>
</body>
</html>
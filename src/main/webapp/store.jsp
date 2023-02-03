<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>STORE | CAFFEYUNE</title>
	<style>
		* { margin: 0; padding: 0; }
		li { list-sytle: none; }
		a { text-decoration: none; }
	</style>
	<style>
		#product_name { font-family: 'Bebas Neue', cursive; font-family: 'Noto Sans KR', sans-serif; font-size: 28px; 
						font-weight: bold; width: 100%; height: 30px; padding: 15px 50px; color: #A4A4A4; }
		hr { width: 40%; height: 2px; background: #C1C1C1; }
	</style>
	<!-- table -->
	<style>
		section { width: 100%; }
		table.type10 {
			border-collapse: collapse;
			text-align: left;
			line-height: 1.5;
			border-top: 1px solid #ccc;
			border-bottom: 1px solid #ccc;
			width: 70%;
			margin: 20px auto;;
		}
		
		table.type10 thead th {
			width: 150px;
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			color: #fff;
			background: #e7708d;
			margin: 20px 10px;
			text-align: center;
		}
		
		table.type10 tbody th {
			width: 150px;
			padding: 10px;
		}
		
		table.type10 td {
			width: 350px;
			padding: 10px;
			vertical-align: top;
		}
		
		table.type10 .even {
			background: #fdf3f5;
		}
	</style>
	<style>
		#map { width: 70%; margin: 15px auto; height: 500px; }
	</style>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div id = "product_name">매장 위치</div>
	<hr>
	<section>
		<table class="type10">
			<thead>
				<tr>
					<th scope="cols">매장</th>
					<th scope="cols">주소</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">영대병원점</th>
					<td>대구 남구 현충로 170 호흡기전문질환센터 지상 2층</td>
				</tr>
				<tr>
					<th scope="row" class="even">경북대병원점</th>
					<td class="even">대구 중구 동덕로 130 (삼덕동 2가, 경북대병원 간이휴게소동 지상)</td>
				</tr>
				<tr>
					<th scope="row">동대구역사점</th>
					<td>대구 동구 동대구로 550</td>
				</tr>
			</tbody>
		</table>
	</section>
	<div id = "map"></div>
	<%@ include file = "footer.jsp" %>
	
	<!-- js파일 연결하기 -->
	<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBklQsuRcO8qycMXtSPWsC-1omzgkc5rJQ&callback=initMap&v=weekly"
      defer>
	</script>
	<script>
		 let map;
		 let infowindow;
	
		 let stores = [
		 	 { name: "영대병원점", lat: 35.8481070, lng: 128.5820500 },
		 	 { name: "경북대병원점", lat: 35.8662525, lng: 128.6047030 },
		 	 { name: "동대구역사점", lat: 35.8794362, lng: 128.6287756 }
		 ];
	
		 let store1 = { lat: 35.8481070, lng: 128.5820500 };
		 let store2 = { lat: 35.8662525, lng: 128.6047030 };
		 let store3 = { lat: 35.8794362, lng: 128.6287756 };
	
		 function initMap() {
		 	map = new google.maps.Map(document.getElementById("map"), {
		 		center: { lat: 35.8713900, lng: 128.6017630 },
		 		zoom: 12,
		 	});
		   
		   	stores.forEach(({name, lat, lng}) => {
		 		let marker = new google.maps.Marker({
		 			position: {lat, lng},
		 			map
		 		});
		 		
		 		infowindow = new google.maps.InfoWindow();
		 		marker.addListener("click", () => {
		 			infowindow.setContent(name);
		 			infowindow.open({
		 				anchor: marker,
		 				map
		 			})
		 		});
		 	
		 	});
		 }
	
		 window.initMap = initMap;	
	</script>
</body>
</html>
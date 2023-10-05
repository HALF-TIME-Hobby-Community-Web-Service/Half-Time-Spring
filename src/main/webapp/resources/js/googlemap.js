let map, infoWindow;

function initMap() {
	map = new google.maps.Map($("#map")[0], {
		center: { lat: -34.397, lng: 150.644 },
		zoom: 10,
	});
	infoWindow = new google.maps.InfoWindow();

	const locationButton = document.createElement("button");
	locationButton.textContent = "현재 위치";
	locationButton.classList.add("custom-map-control-button");
	map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
	locationButton.addEventListener("click", () => {
		// Try HTML5 geolocation.
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(
				(position) => {
					const pos = {
						lat: position.coords.latitude,
						lng: position.coords.longitude,
					};

					infoWindow.setPosition(pos);
					infoWindow.setContent("현재 위치");
					infoWindow.open(map);
					map.setCenter(pos);

					// 여기에서 위치 정보를 사용할 수 있습니다.
					console.log("현재 위치의 위도: " + pos.lat);
					console.log("현재 위치의 경도: " + pos.lng);

					// 장소 검색 코드를 여기에 추가할 수 있습니다.
				},
				() => {
					handleLocationError(true, infoWindow, map.getCenter());
				}
			);
		} else {
			// Browser doesn't support Geolocation
			handleLocationError(false, infoWindow, map.getCenter());
		}
	});
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	infoWindow.setPosition(pos);
	infoWindow.setContent(
		browserHasGeolocation
			? "Error: The Geolocation service failed."
			: "Error: Your browser doesn't support geolocation."
	);
	infoWindow.open(map);
}

function searchPlace() {
	const placeInput = $('#place-input')[0];
	const placeName = placeInput.value;

	// 검색할 장소 정보 설정
	const request = {
		query: placeName
	};

	// 장소 검색 서비스 생성
	const service = new google.maps.places.PlacesService(map);

	// 장소 검색 실행
	service.textSearch(request, function (results, status) {
		if (status === google.maps.places.PlacesServiceStatus.OK) {
			if (results.length > 0) {
				const firstResult = results[0];
				const pos = firstResult.geometry.location;

				// 검색된 장소로 지도 이동
				map.setCenter(pos);

				// 마커 추가 및 정보창 표시
				const marker = new google.maps.Marker({
					position: pos,
					map: map
				});

				infoWindow.setContent(firstResult.name);
				infoWindow.open(map, marker);
			} else {
				alert('장소를 찾을 수 없습니다.');
			}
		} else {
			alert('장소 검색 중 오류가 발생했습니다.');
		}
	});
}

window.initMap = initMap;

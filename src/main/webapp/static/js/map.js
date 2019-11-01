let map;

let latlong = {lat: ${ad.lat}, lng: ${ad.lon}};

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: latlong,
        zoom: 17,
        mapTypeId: 'roadmap'
    });

    let marker = new google.maps.Marker({
        position: latlong,
        map: map,
        title: 'Hello World!'
    });
}
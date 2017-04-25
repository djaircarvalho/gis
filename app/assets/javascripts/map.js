  $( document ).ready(function() {
    function toWKT(layer) {
      var lng, lat, coords = [];
      if (layer instanceof L.Polygon) {
          var latlngs = layer.getLatLngs();
          for (var i = 0; i < latlngs.length; i++) {
            for (var j = 0; j < latlngs[i].length; j++) {
              coords.push(latlngs[i][j].lng + " " + latlngs[i][j].lat);
              if (i === 0 && j===0) {
                lng = latlngs[0][i].lng;
                lat = latlngs[0][i].lat;
              }
            }  
          }
          
        return "POLYGON((" + coords.join(",") + "," + lng + " " + lat + "))";
          
        }else if (layer instanceof L.Polyline) {
          var latlngs = layer.getLatLngs();
          for (var i = 0; i < latlngs.length; i++) {
            coords.push(latlngs[i].lng + " " + latlngs[i].lat);
              if (i === 0) {
                lng = latlngs[i].lng;
                lat = latlngs[i].lat;
              }
          }
              return "LINESTRING(" + coords.join(",") + ")";
        }
         else if (layer instanceof L.Marker) {
            return "POINT(" + layer.getLatLng().lng + " " + layer.getLatLng().lat + ")";
        }
    };
    
    var drawnItems = new L.FeatureGroup();
        map.addLayer(drawnItems);

        var drawControl = new L.Control.Draw({
         draw: {
          polygon: {
           shapeOptions: {
            color: 'purple'
           },
          },
          polyline: {
           shapeOptions: {
            color: 'red'
           },
          },
          rect: false,
          circle: false,
         },
         edit: {
          featureGroup: drawnItems
         }
        });
 
  map.addControl(drawControl);

        map.on('draw:created', function (e) {
            var type = e.layerType,
                layer = e.layer;
            drawnItems.addLayer(layer);
            $('#quadra_localizacao').val(toWKT(layer));
        });

});
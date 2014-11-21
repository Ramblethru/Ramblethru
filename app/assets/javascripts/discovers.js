
// foursquare api example call
$.ajax({
	type: 'POST',
	dataType: "json",
	url: 'https://api.foursquare.com/v2/venues/search?client_id=1BFAML3P0MNEHNINJ3GUHPRJXCY4ZM3JM14LZBGXEOAB4PFT&client_secret=E5R0UEZFE0JDJB2ON0K31RBAYOPZ3CHWKR3JFK0BDELV2CUJ&v=20130815&ll=40.7,-74&query=sushi',
	success: function(data) {
		('.foursq').append(data.response.venues[0].name);
	}
});

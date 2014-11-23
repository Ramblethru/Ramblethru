
// foursquare api example call
$.ajax({
	type: 'GET',
	dataType: "json",
	url: 'https://api.foursquare.com/v2/venues/explore?client_id=1BFAML3P0MNEHNINJ3GUHPRJXCY4ZM3JM14LZBGXEOAB4PFT&client_secret=E5R0UEZFE0JDJB2ON0K31RBAYOPZ3CHWKR3JFK0BDELV2CUJ&v=20130815&ll=35.9,-78.9',
	success: function(data) {
		$('.foursq').append('<div class="foursqapi">' + '<a href="' + data.response.groups[0].items[0].venue.url + '"' + '>' + data.response.groups[0].items[0].venue.name +
		'</a>' + " - " + "rating " + data.response.groups[0].items[0].venue.rating);
		$('.foursq').append('<div class="foursqapi">' + '<a href="' + data.response.groups[0].items[1].venue.url + '"' + '>' + data.response.groups[0].items[1].venue.name +
		'</a>' + " - " + "rating " + data.response.groups[0].items[1].venue.rating);
		$('.foursq').append('<div class="foursqapi">' + '<a href="' + data.response.groups[0].items[2].venue.url + '"' + '>' + data.response.groups[0].items[2].venue.name +
		'</a>' + " - " + "rating " + data.response.groups[0].items[2].venue.rating);
		$('.foursq').append('<div class="foursqapi">' + '<a href="' + data.response.groups[0].items[3].venue.url + '"' + '>' + data.response.groups[0].items[3].venue.name +
		'</a>' + " - " + "rating " + data.response.groups[0].items[3].venue.rating);
	}
});
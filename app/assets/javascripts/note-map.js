// var ramblesURL = "/notes.json";


// $(document).ready(function(){
//   var plots = [];

//   $.getJSON(ramblesURL).done(function (rambles) {
//     _.each(rambles, function (plot) {
//       newobj = {
//         value: plot.ramble,
//         latitude: plot.latitude,
//         longitude: plot.longitude,
//         tooltip: {content: plot.ramble},
//         href: "rambles/" + plot.slug
//       }
//       plots.push(newobj);
//     })
//     console.log("yey!");
//     }).done(function () {
//     $(".us_map").mapael({

//     map : {
//       name : "usa_states",
//       cssClass : "map",
//       tooltip : {
//         cssClass : "mapTooltip"
//         },
//       defaultArea : {
//         attrs : {
//           fill : "#282828",
//           stroke: "#9a9a9a",
//         },
//         attrsHover : {
//           fill : "#7a7c7c",
//           animDuration: 300
//         }
//       },
//       defaultPlot : {
//         type : "circle",
//         href : "#",
//         size : 15,
//         attrs: {
//           fill : "#f95a61"
//         },
//         attrsHover: {

//         }
//       },
//     },

//     plots : plots,

//     })
//   })
// });
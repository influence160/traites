$(document).ready(function()
{
	var configObject = {
			urlTraitesTemplate: "/traites/serieDeTraites/traitesTemplate/" + viewObject.serieDeTraitesId
	}
	

		
		
    $("#montant-total").live("click", function(){      
//        var myModel = new ModalSheet();
//        myModel.CreateModalSheet(configObject.urlTraitesList, "75%", "85%", {serieDeTraitesId: viewObject.serieDeTraitesId}); 
		$.get(configObject.urlTraitesTemplate, function(data){
			// create a modal dialog with the data
			$(data).modal({
				containerCss:{
					backgroundColor:"#fff", 
					borderColor:"#fff", 
					padding:0, 
					width: "80%",
					height: "80%"
				},
				closeClass: "ui-icon-closethick",
				//closeHTML: "<a href='#' title='Close' class='modal-close'>x</a>",
				overlayCss: {backgroundColor:"#333333"}
			});
		});
    });
});

function onOpen(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.slideDown('slow', function () {
			dialog.data.fadeIn('slow');
		});
	});
}
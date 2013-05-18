/* 
    Document   : ModalSheet.jQuery.js
    Created on : Mar 26, 2012, 10:28:31 AM
    Author     : Multiple Q.Frank, Walid Souilem
    Description:
        Purpose of the stylesheet follows.
*/


function ModalSheet() {
    this.CreateModalSheet= function (sheetDataURL, containerWidth, containerHeight, params) {			
		
			$('body').ajaxStart(function(){ $('#qfSpinner').show(); });			
			$('body').ajaxStop(function(){ $('#qfSpinner').fadeOut(500); });
			// Main workflow starts here
			createContainers();	
			
			$('#qfSheetContent').load(
                                sheetDataURL,
                                params,
                                function(response, status, xhr){                                
                                    if (status == "error") {
                                        var msg = "There was an error loading the content!<br />";
                                        $("#qfSheetContainer").html(msg + xhr.status + " " + xhr.statusText);
                                    } else {                                           
                                            showContent();                                            
                                            $('#qfSheetContainer').animate({'bottom': '0px'}, {queue:true, duration:500});                                           
                                    }
			});
                        
			$('#qfCloseContainer').live("click", function(){
				undoEverything();
                                //closeContainer();
			});
                                                                                                			
			// Main workflow ends here
						
			function createContainers() {
				//console.log('Creating containers...');
				// Define html to be prepended to the body
				var qfInner = "<div id=\"qfCloseContainer\">&times;</div>\n<div id=\"qfSheetContent\"></div>";
	                        var qfSheetContainer = "<div id=\"qfSheetContainer\">" + qfInner + "</div>";
				var qfDimmer = "<div id=\"qfDimmer\"></div>";
				var qfSpinner = "<div id=\"qfSpinner\"></div>";
			
				// Prepend the containers and remove the body scrollbars
                                $('body').css('overflow','hidden').prepend(qfSheetContainer, qfDimmer, qfSpinner);
		
				// Hide the containers immediately
				$('#qfDimmer').hide().fadeIn(250);
				$('#qfSheetContainer, #qfSpinner').hide();
			}
			
			function showContent() {
				
				// Convert dimensions to string				
				containerWidth = containerWidth.toString();
				containerHeight = containerHeight.toString();
				
				
				// If the declared width is a percentage
				if (containerWidth.indexOf("%") > -1) {
					containerWidth = containerWidth.replace('%','') / 100;
					var originalWidth = containerWidth;
					containerWidth = containerWidth * window.innerWidth;
					//console.log("Converting width from percentage...");
					
					//Resize width
					$(window).resize(function(){
						containerWidth = originalWidth * window.innerWidth;
						$('#qfSheetContainer').css({'width':containerWidth, 'marginLeft': -containerWidth/2 });
						// console.log("Width resizing to: " + containerWidth);
					});
				}

				if (containerHeight.indexOf("%") > -1) {
					containerHeight = containerHeight.replace('%','') / 100;
					var originalHeight = containerHeight;
					containerHeight = containerHeight * window.innerHeight;
					//console.log("Converting height from percentage...");
					 
					//Resize height
					$(window).resize(function(){
						containerHeight = originalHeight * window.innerHeight;
						$('#qfSheetContainer').css({'height':containerHeight});
						// console.log("Height resizing to: " + containerHeight);
					});
				}
				
				$('#qfSheetContainer').css({
					'width'		: containerWidth,
					'height'	: containerHeight,
					'marginLeft': -containerWidth / 2,
					'bottom'	: -containerHeight
				}).show();
				 
//				console.log("Container width in pixels: " + containerWidth);
//				console.log("Container height in pixels: " + containerHeight);
//				return containerHeight;
			}
			
			function undoEverything() {
				$('#qfSheetContainer').animate({'bottom': -containerHeight}, 200, function(){
					$(this).remove();
					$('#qfDimmer').fadeOut(250, function(){
						$(this).remove();
					$('#qfSpinner').remove();
					});
				});
			}		
        }
        
        this.closeContainer = function(containerHeight){
            $('#qfSheetContainer').animate({'bottom': -containerHeight}, 200, function(){
                    $(this).remove();
                    $('#qfDimmer').fadeOut(250, function(){
                            $(this).remove();
                    $('#qfSpinner').remove();
                    });                   
            });         
        }
}


function closeWinModalByReloadPage(){
     closeWinModal();
     location.reload();
}

function closeWinModal(){
     var myModel = new ModalSheet();
     myModel.closeContainer(300);     
}
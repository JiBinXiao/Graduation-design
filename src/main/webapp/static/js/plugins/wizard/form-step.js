var FormWizard = function() {
	return {
		init: function() {
			if(!jQuery().bootstrapWizard) {
				return;
			}
			/*-----------------------------------------------------------------------------------*/
			/*	Show country list in Uniform style
			/*-----------------------------------------------------------------------------------*/
			var wizform = $('#wizForm');
			var alert_success = $('.alert-success', wizform);
			var alert_error = $('.alert-danger', wizform);


			/*-----------------------------------------------------------------------------------*/
			/*	Initialize Bootstrap Wizard
			/*-----------------------------------------------------------------------------------*/
			$('#formWizard').bootstrapWizard({
				'nextSelector': '.nextBtn',
				'previousSelector': '.prevBtn',
				onNext: function(tab, navigation, index) {
					var nextpage = index + 1;

					var data = $('#formWizard').bootstrapValidator('validate');
					if (!$('#formWizard').data("bootstrapValidator").isValid()) {
						return false;
					}
					var total = navigation.find('li').length;
					var current = index + 1;
					$('.stepHeader', $('#formWizard')).text('Step ' + (index + 1) + ' of ' + total);
					jQuery('li', $('#formWizard')).removeClass("done");
					var li_list = navigation.find('li');
					for(var i = 0; i < index; i++) {
						jQuery(li_list[i]).addClass("done");
					}
					if(current == 1) {
						$('#formWizard').find('.prevBtn').hide();
					} else {
						$('#formWizard').find('.prevBtn').show();
						
					}
					if(current == 2) {
						$('#formWizard').find('.two_step').each(function(){
							$(this).removeClass("hidden");
						})
						$(".first_step").addClass("hidden");
					}else if(current == 3){
						$('#formWizard').find('.two_step').each(function(){
							$(this).addClass("hidden");
						})
						$(".first_step").addClass("hidden");
						$('#formWizard').find(".three_step").removeClass("hidden");
					}else if(current == 4){
						$('#formWizard').find('.two_step').each(function(){
								$(this).addClass("hidden");
						})
						$(".first_step").addClass("hidden");
						$('#formWizard').find(".three_step").addClass("hidden");
					}
					
					if(current >= total) {
						$('#formWizard').find('.nextBtn').hide();
						$('#formWizard').find('.submitBtn').show();
					} else {
						$('#formWizard').find('.nextBtn').show();
						$('#formWizard').find('.submitBtn').hide();
					}
				},
				onPrevious: function(tab, navigation, index) {
					var prevpage = index + 1;
					var total = navigation.find('li').length;
					var current = index + 1;
					$('.stepHeader', $('#formWizard')).text('Step ' + (index + 1) + ' of ' + total);
					jQuery('li', $('#formWizard')).removeClass("done");
					var li_list = navigation.find('li');
					for(var i = 0; i < index; i++) {
						jQuery(li_list[i]).addClass("done");
					}
					if(current == 2) {
						$('#formWizard').find('.two_step').each(function(){
							$(this).removeClass("hidden");
						})
						$('#formWizard').find(".three_step").addClass("hidden");
					}else if(current == 3){
						$('#formWizard').find('.two_step').each(function(){
							$(this).addClass("hidden");
						})
						$(".first_step").addClass("hidden");
						$('#formWizard').find(".three_step").removeClass("hidden");
					}else if(current == 4){
						$('#formWizard').find('.two_step').each(function(){
								$(this).addClass("hidden");
						})
						$(".first_step").addClass("hidden");
						$('#formWizard').find(".three_step").addClass("hidden");
					}else if(current == 1){
						$('#formWizard').find('.two_step').each(function(){
								$(this).addClass("hidden");
						})
						$(".first_step").removeClass("hidden");
					}
					
					if(current >= total) {
						$('#formWizard').find('.nextBtn').hide();
						$('#formWizard').find('.submitBtn').show();
					} else {
						$('#formWizard').find('.nextBtn').show();
						$('#formWizard').find('.submitBtn').hide();
					}
				},
				onTabClick: function(tab, navigation, index) {
					var data = $('#formWizard').bootstrapValidator('validate');
					if (!$('#formWizard').data("bootstrapValidator").isValid()) {
						return false;
					}

				},
				onTabShow: function(tab, navigation, index) {
					var total = navigation.find('li').length;
					var current = index + 1;
					if(current == 1) {
						$('#formWizard').find('.prevBtn').hide();
						$('#formWizard').find('.nextBtn').show();
						$('#formWizard').find('.submitBtn').hide();
					} else if(current == total) {
						$('#formWizard').find('.prevBtn').show();
						$('#formWizard').find('.nextBtn').hide();
						$('#formWizard').find('.submitBtn').show();
					} else {
						$('#formWizard').find('.prevBtn').show();
						$('#formWizard').find('.nextBtn').show();
						$('#formWizard').find('.submitBtn').hide();
					}
					if(current == 2) {
						$('#formWizard').find('.two_step').each(function(){
							$(this).removeClass("hidden");
						})
						$('#formWizard').find(".three_step").addClass("hidden");
					}else if(current == 3){
						$('#formWizard').find('.two_step').each(function(){
							$(this).addClass("hidden");
						})
						$(".first_step").addClass("hidden");
						$('#formWizard').find(".three_step").removeClass("hidden");
                        getFileds();
					}else if(current == 4){
						$('#formWizard').find('.two_step').each(function(){
								$(this).addClass("hidden");
						})
						$(".first_step").addClass("hidden");
						$('#formWizard').find(".three_step").addClass("hidden");
					}else if(current == 1){
						$('#formWizard').find('.two_step').each(function(){
								$(this).addClass("hidden");
						})
						$(".first_step").removeClass("hidden");
					}
					var $percent = (current / total) * 100;
					$('#formWizard').find('.progress-bar').css({
						width: $percent + '%'
					});
				}
			});

			$('#formWizard').find('.prevBtn').hide();
			$('#formWizard .submitBtn').click(function() {
                formSubmit();
			}).hide();
		}
	};
}();
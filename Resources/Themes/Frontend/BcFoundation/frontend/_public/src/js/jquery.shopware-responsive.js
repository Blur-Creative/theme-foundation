(function($, window) {
	window.StateManager
	
        // OffCanvas menu
        .addPlugin('*[data-offcanvas="true"]', 'swOffcanvasMenu', {
			'closeButtonSelector': '.btn-close-offcanvas'
		},['xs', 's'])
	
		// Remove the Selectbox Replacement completly
		.removePlugin('select:not([data-no-fancy-select="true"])', 'swSelectboxReplacement')
		
		        // OffCanvas menu
		.removePlugin('.navigation--entry.entry--account.with-slt', 'swDropdownMenu', [ 'm', 'l', 'xl' ])
		
		// Update Dropdown Menu
		.updatePlugin('*[data-drop-down-menu="true"]', 'swDropdownMenu')
	;
	
	/*
	 * init Bootstrap Popovers funcionality
	 */
	$(function () {
	  $('[data-toggle="popover"]').popover();
	});
	
	/*
	 * init Bootstrap Tooltip funcionality
	 */
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip();
	});

	/*
	 * Init Custom Bootstrap Form Validation
	 * Need to set `.needs-validation` class and novalidate boolean to <form> Element
	 */
	(function() {
	'use strict';
	window.addEventListener('load', function() {
	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.getElementsByClassName('needs-validation');
	  // Loop over them and prevent submission
	  var validation = Array.prototype.filter.call(forms, function(form) {
		form.addEventListener('submit', function(event) {
		  if (form.checkValidity() === false) {
			event.preventDefault();
			event.stopPropagation();
		  }
		  form.classList.add('was-validated');
		}, false);
	  });
	}, false);
	})();

	
})(jQuery, window);
(function($, window) {
	window.StateManager
	
        // OffCanvas menu
        .addPlugin('*[data-offcanvas="true"]', 'swOffcanvasMenu', {
			'closeButtonSelector': '.btn-close-offcanvas'
		},['xs', 's'])
		
		.addPlugin('*[data-collapse-cart="true"]', 'swCollapseCart', {
			'triggerElSelector': '.shop--navigation .entry--cart'
		})
		
		// menu scroller
		.addPlugin('*[data-menu-scroller="true"]', 'swMenuScroller', {
			leftArrowContent: '',
			rightArrowContent: ''
		})
		
		.addPlugin('*[data-image-gallery="true"]', 'swImageGallery', {
			btnClass: 'btn is--small is--light',
		})
	
		// Remove the Selectbox Replacement completly
		.removePlugin('select:not([data-no-fancy-select="true"])', 'swSelectboxReplacement')
		
		// OffCanvas menu
		.removePlugin('.navigation--entry.entry--account.with-slt', 'swDropdownMenu', [ 'm', 'l', 'xl' ])
		
		// Update Dropdown Menu
		.removePlugin('*[data-drop-down-menu="true"]', 'swDropdownMenu')
		.addPlugin('*[data-drop-down-menu="true"]', 'bcDropdownMenu', [ 'xs', 's', 'm', 'l', 'xl'])
		
		.addPlugin('div[data-register="true"]', 'swRegister', {
			paymentInputSelector: '.payment--selection-input'
		})
		
		.addPlugin('*[data-bc-sidebar-category-nav="true"]', 'bcSidebarCategoryNav', ['xs', 's'])
		
		//BC Sticky Nav
		.addPlugin('*[data-sticky-navigation="true"]', 'bcStickyNav')
	;
	
	/*
	 * Override 'registerEventListeners' in swOffcanvasMenu
	 * Remove touchstart on button click for better usability
	 */
	$.overridePlugin('swOffcanvasMenu', {
        registerEventListeners: function () {
            var me = this,
                opts = me.opts;

            // Button click
            me._on(me.$el, 'click', $.proxy(me.onClickElement, me));

            // Allow the user to close the off canvas menu
            me.$offCanvas.on(me.getEventName('click'), opts.closeButtonSelector, $.proxy(me.onClickCloseButton, me));

            $.subscribe(me.getEventName('plugin/swOffcanvasMenu/onBeforeOpenMenu'), $.proxy(me.onBeforeOpenMenu, me));

            $.publish('plugin/swOffcanvasMenu/onRegisterEvents', [ me ]);
        }
	});
	
	/*
	 * Override 'openMenu' and 'closeMenu'
	 * Change advancedMenu Container from 'show' and 'hide'
	 * To to Class 'active'
	 */
	$.overridePlugin('swRegister', {
        onPaymentChanged: function () {
            var me = this,
                opts = me.opts,
                inputClass = opts.inputSelector,
                hiddenClass = opts.hiddenClass,
                inputSelector = opts.paymentInputSelector,
                paymentSelector = opts.paymentFieldSelector,
                requiredMethod,
                $fieldSet,
                isChecked,
                radio,
                $el;
				
				me.$paymentMethods.removeClass( 'active' );

            $.each(me.$paymentMethods, function (index, el) {
                $el = $(el);

                radio = $el.find(inputSelector);
                isChecked = radio[0].checked;

                requiredMethod = (isChecked) ? me.setHtmlRequired : me.removeHtmlRequired;

                requiredMethod($el.find(inputClass));

                $fieldSet = $el.find(paymentSelector);
                $fieldSet[((isChecked) ? 'removeClass' : 'addClass')](hiddenClass);
				
				if( radio[0].checked ) {
					$( this ).addClass( 'active' );
				}
            });

            $.publish('plugin/swRegister/onPaymentChanged', [ me ]);
        }
	});
	
	/*
	 * Override 'openMenu' and 'closeMenu'
	 * Change advancedMenu Container from 'show' and 'hide'
	 * To to Class 'active'
	 */
	$.overridePlugin('swMenuScroller', {
        updateScrollBarOffset: function () {
            var me = this,
                $list = me.$list,
                offset;

            offset = me.scrollBarOffset = Math.min(Math.abs($list[0].scrollHeight - $list.height()) * -1, me.scrollBarOffset);

            $.publish('plugin/swMenuScroller/onUpdateScrollBarOffset', [ me, offset ]);
        },
        updateButtons: function () {
            var me = this,
                $list = me.$list,
                elWidth = me.$el.width(),
                listWidth = $list.prop('scrollWidth'),
                scrollLeft = $list.scrollLeft();
				
			var items_width = 0;
			
			me.$el.find( '.js--menu-scroller--item' ).each(function() {
				var $this = $(this);
				items_width += $this.outerWidth();
			});
				
			
			if ( elWidth > items_width ) {
				me.$rightArrow.addClass( 'is--hidden' );
				me.$leftArrow.addClass( 'is--hidden' );
			} else {
				if( scrollLeft == 0) {
					me.$leftArrow.addClass( 'is--hidden' );
				}
				if( scrollLeft > 0) {
					me.$leftArrow.removeClass( 'is--hidden' );
				}
				if( scrollLeft >= ( items_width - elWidth ) ) {
					me.$rightArrow.addClass( 'is--hidden' );
				}
				if( scrollLeft < ( items_width - elWidth ) ) {
					me.$rightArrow.removeClass( 'is--hidden' );
				}
			}

            $.publish('plugin/swMenuScroller/onUpdateButtons', [ me, me.$leftArrow, me.$rightArrow ]);
        },
	});
	
	
	/*
	 * Override 'createArrows' in swImageSlider Plugin
	 * Change Arrow Element from 'a' to 'span'
	 */
	$.overridePlugin('swImageSlider', {
        createArrows: function () {
            var me = this,
                opts = me.opts,
                hiddenClass = ' ' + opts.hiddenClass;

            /**
             * Left slide arrow element.
             *
             * @private
             * @property _$arrowLeft
             * @type {jQuery}
             */
            me._$arrowLeft = $('<span>', {
                'class': opts.leftArrowCls + ((opts.loopSlides || me._slideIndex > 0) && me._itemCount > 1 ? '' : hiddenClass)
            }).appendTo(me._$slideContainer);

            /**
             * Right slide arrow element.
             *
             * @private
             * @property _$arrowRight
             * @type {jQuery}
             */
            me._$arrowRight = $('<span>', {
                'class': opts.rightArrowCls + ((opts.loopSlides || me._slideIndex < me._itemCount - 1) && me._itemCount > 1 ? '' : hiddenClass)
            }).appendTo(me._$slideContainer);

            $.publish('plugin/swImageSlider/onCreateArrows', [ me, me._$arrowLeft, me._$arrowRight ]);
        },
		createThumbnailArrows: function () {
            var me = this,
                opts = me.opts,
                isHorizontal = (me._thumbnailOrientation === 'horizontal'),
                prevClass = isHorizontal ? opts.thumbnailArrowLeftCls : opts.thumbnailArrowTopCls,
                nextClass = isHorizontal ? opts.thumbnailArrowRightCls : opts.thumbnailArrowBottomCls;

            /**
             * Left/Top thumbnail slide arrow element.
             *
             * @private
             * @property _$thumbnailArrowPrev
             * @type {jQuery}
             */
            me._$thumbnailArrowPrev = $('<span>', {
                'class': opts.thumbnailArrowCls + ' ' + prevClass
            }).appendTo(me._$thumbnailContainer);

            /**
             * Right/Bottom thumbnail slide arrow element.
             *
             * @private
             * @property _$thumbnailArrowNext
             * @type {jQuery}
             */
            me._$thumbnailArrowNext = $('<span>', {
                'class': opts.thumbnailArrowCls + ' ' + nextClass
            }).appendTo(me._$thumbnailContainer);

            $.publish('plugin/swImageSlider/onCreateThumbnailArrows', [ me, me._$thumbnailArrowPrev, me._$thumbnailArrowNext ]);
        }
	});
	
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

	$(function($) {
		
	    $('.add-voucher--checkbox').on('change', function (event) {
            var method = ($(this).is(':checked')) ? 'addClass' : 'removeClass';
            event.preventDefault();

            $( '.add-voucher--label' )[method]( 'is--active' );
        });
	});
	
})(jQuery, window);
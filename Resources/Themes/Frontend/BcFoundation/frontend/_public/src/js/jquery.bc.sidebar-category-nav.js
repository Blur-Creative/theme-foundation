;(function ($) {
    'use strict';

    var $html = $('html');
	var target;
    var targetParent;

    /**
     * BC mobile menu menu plugin
     *
     * The plugin provides an lightweight way to use an off canvas pattern for all kind of content. The content
     * needs to be positioned off canvas using CSS3 `transform`. All the rest will be handled by the plugin.
     *
     * @example Simple usage
     * ```
     *     <a href="#" data-offcanvas="true">Menu</a>
     * ```
     *
     * @example Show the menu on the right side
     * ```
     *     <a href="#" data-offcanvas="true" data-direction="fromRight">Menu</a>
     * ```
     *
     * @ToDo: Implement swipe gesture control. The old swipe gesture was removed due to a scrolling bug.
     */
    $.plugin('bcSidebarCategoryNav', {

        /**
         * Plugin default options.
         * Get merged automatically with the user configuration.
         */
		 
        defaults: {

			// Menü Flyout Collapse Class
            'menuCollapse': '.sidebar--categories-navigation',
			
			// event name(s) used for registering the events to navigate
			'eventName': 'click',
			
			// indicator to get subcategorys
			'subIndicatorCls': '.subcategory--indicator',
			
			// indicator icon for subcategorys
			'subIndicatorIcon': 'icon--arrow-down',
			
			// active indicator icon for subcategorys
			'subIndicatorIconActive': 'icon--arrow-up',

            // ID of the root category ID of the current shop.
            // This is used to determine if the user switches to the main
            // menu when clicking on a back button.			
            'mainCategoryId': null,

            // Category ID of the current page.
            // When this and fetchUrl is set, the correct slide will be loaded.
            'categoryId': null,

            // URL to get the current navigation slide.
            // When this and categoryID is set, the correct slide will be loaded.
            'fetchUrl': '',
        },

        /**
         * Initializes the plugin, sets up event listeners and adds the necessary
         * classes to get the plugin up and running.
         *
         * @public
         * @method init
         */
        init: function () {
            var me = this,
                opts = me.opts;
				
            // Overwrite plugin configuration with user configuration
            me.applyDataAttributes();

			// var to check if subcategories is open or not
			me.subIsOpen = false;
			
            // Reference of the main menu element.
            me.$menu = $(opts.menuCollapse);
			
			// register events
            me.registerEventListeners();
        },

        /**
         * Registers all necessary event listeners for the plugin to proper operate.
         *
         * @public
         * @method onClickElement
         */
        registerEventListeners: function () {
            var me = this,
                opts = me.opts,
				$menu = me.$menu,
				eventName = opts.eventName,
				$closeSelectors = $(opts.closeSelectors);

			// call the onClickShowCategories function if subIndicatorCls is clickes
			$menu.on(me.getEventName('click'), opts.subIndicatorCls, $.proxy(me.onClickShowCategories, me));


			// call the onClickShowCategories function if subIndicatorCls is clickes
			$closeSelectors.on('click', $.proxy(me.closeMenu, me));
		},



        /**
         * Called when the plugin element was clicked on.
         * Opens the off canvas menu, if the clicked element is not inside
         * the off canvas menu, prevent its default behaviour.
         *
         * @public
         * @method onClickElement
         * @param {jQuery.Event} event
         */
        onToggleMenu: function (event) {
            var me = this;

			$(me.opts.menuCollapse).toggleClass('in');
			$html.toggleClass('no--scroll');
			$(me.opts.parentCollapse).toggleClass('bc-mobile-menu--is-open');
			$(me.$el).toggleClass('is--active');
        },

        /**
         * Called when clicked on a show categories button.
         * Loads the sub categories on the category id and fetch url.
         *
         * @public
         * @method onClickForwardButton
         * @param {Object} event
         */
        onClickShowCategories: function (event) {
            event.preventDefault();

            var me = this,
                $target = $(event.currentTarget),
				$targetParent = $target.parent(),
                url = $target.attr('data-fetchUrl');
				targetParent = $targetParent;
				target = $target;
			
			
			if(!targetParent.hasClass('is--active')) {
				me.loadTemplate(url, me.openSubcategories, $targetParent);
			}

			if(targetParent.hasClass('is--active')) {
				me.closeSubcategories($targetParent);
			}		
        },

        /**
         * loads a template via ajax call
         *
         * @public
         * @method loadTemplate
         * @param {String} url
         * @param {Function} callback
         * @param {jQuery} $loadingTarget
         */
        loadTemplate: function (url, callback, $loadingTarget) {
            var me = this;		
			
            $.get(url, function (template) {
                callback.call(me, template);
            });
        },
		
        /**
         * Slides a given template/slide into the viewport of the sidebar.
         * After the sliding animation is finished,
         * the previous slide will be removed.
         *
         * @public
         * @method slideIn
         * @param {String} template
         */
        openSubcategories: function (template) {
            var me = this,
                opts = me.opts;
			
			//append the subcategories after the parent categorie level
			targetParent.after(template);
			
			targetParent.addClass('is--active');	

			target.find('i').removeClass(opts.subIndicatorIcon);
			target.find('i').addClass(opts.subIndicatorIconActive);
        },
		
        /**
         * Slides a given template/slide into the viewport of the sidebar.
         * After the sliding animation is finished,
         * the previous slide will be removed.
         *
         * @public
         * @method slideIn
         * @param {String} template
         */
        closeSubcategories: function ($targetParent) {
            var me = this,
                opts = me.opts,
				$subCatContainer = $targetParent.next();

			$subCatContainer.remove();
			
			targetParent.removeClass('is--active');
			
			target.find('i').removeClass(opts.subIndicatorIconActive);
			target.find('i').addClass(opts.subIndicatorIcon);
        },
		
        /**
         * Opens the off-canvas menu based on the direction.
         * Also closes all other off-canvas menus.
         *
         * @public
         * @method openMenu
         */
        openMenu: function () {
            var me = this,
                opts = me.opts;
				
			/*

            if (me.isOpened) {
                return;
            }
            me.isOpened = true;

            $.publish('plugin/swOffcanvasMenu/onBeforeOpenMenu', [ me ]);

            $html.addClass('no--scroll');

            $.overlay.open({
                onClose: $.proxy(me.closeMenu, me)
            });

            if (opts.moveWrapper) {
                if (opts.direction === 'fromRight') {
                    menuWidth *= -1;
                }

                me.$pageWrap.css('left', menuWidth);
            }

            me.$offCanvas.addClass(opts.openClass);

            $.publish('plugin/swOffcanvasMenu/onOpenMenu', [ me ]);

            if (opts.mode === 'ajax' && opts.ajaxURL) {
                $.ajax({
                    url: opts.ajaxURL,
                    success: function (result) {
                        me.$offCanvas.html(result);
                    }
                });
            }
			*/
        },

        /**
         * Closes the menu and slides the content wrapper
         * back to the normal position.
         *
         * @public
         * @method closeMenu
         */
        closeMenu: function (event) {
            var me = this;
				
				event.preventDefault();
			
			$(me.opts.menuCollapse).removeClass('in');
			$html.removeClass('no--scroll');
			$(me.opts.parentCollapse).removeClass('bc-mobile-menu--is-open');
			$(me.$el).removeClass('is--active');			
			
			
			//event.preventDefault();
			/*
            if (!me.isOpened) {
                return;
            }
            me.isOpened = false;

            $.overlay.close();

            // Disable scrolling on body
            $html.removeClass('no--scroll');

            if (opts.moveWrapper) {
                me.$pageWrap.css('left', 0);
            }

            me.$offCanvas.removeClass(opts.openClass);

            $.publish('plugin/swOffcanvasMenu/onCloseMenu', [ me ]);
			*/
        },

        /**
         * Destroys the initialized plugin completely, so all event listeners will
         * be removed and the plugin data, which is stored in-memory referenced to
         * the DOM node.
         *
         * @public
         * @method destroy
         */
        destroy: function () {
            var me = this,
                opts = me.opts;

			/*
            me.closeMenu();

            me.$offCanvas.removeClass(opts.offCanvasElementCls)
                .removeClass(opts.activeMenuCls)
                .removeClass(opts.openClass)
                .removeAttr('style');

            if (opts.moveWrapper) {
                me.$pageWrap.removeAttr('style');
            }

            me.$el.off(me.getEventName('click'), opts.closeButtonSelector);

            $.unsubscribe('plugin/swOffcanvasMenu/onBeforeOpenMenu', $.proxy(me.onBeforeOpenMenu, me));

            me._destroy();
			*/
        }
    });
})(jQuery);

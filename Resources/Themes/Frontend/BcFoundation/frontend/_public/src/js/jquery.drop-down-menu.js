;(function($) {
    'use strict';

    $.plugin('bcDropdownMenu', {

        defaults: {
            activeCls: 'js--is--dropdown-active',
            preventDefault: true,
            closeOnBody: true,
            dropdownCls: '.dropdown--menu'
        },

        init: function () {
            var me = this;

            me._on(me.$el, 'click', $.proxy(me.onClickTrigger, me));

			
            $.publish('plugin/bcDropdownMenu/onInitEvents', [ me ]);
        },

        onClickTrigger: function (event) {
            var me = this,
                dropdown = me.opts.dropdownCls;

            me.applyDataAttributes();
			
            if ($(event.target).parents(dropdown).is(dropdown)) {
				event.stopPropagation();
                return;
			}	
			
			if ( me.$el.hasClass(me.opts.activeCls) ) {
				me.$el.removeClass(me.opts.activeCls);
				
				return false;
			}
			
			if ( !me.$el.hasClass(me.opts.activeCls) ) {
				$( '*[data-drop-down-menu="true"]' ).removeClass( me.opts.activeCls );
				me.$el.addClass(me.opts.activeCls);
				
				if (me.opts.closeOnBody) {
					event.stopPropagation();
					$('body').on(me.getEventName('click'), $.proxy(me.onClickBody, me));
				}

				return false;
			}
			
			$.publish('plugin/bcDropdownMenu/onClickTrigger', [ me ]);
        },

        onClickBody: function(event) {
            var me = this,
                dropdown = me.opts.dropdownCls;

            if ($(event.target).parents(dropdown).is(dropdown)) {
				event.stopPropagation();
                return;
            }

            $('body').off(me.getEventName('click'));

            me.$el.removeClass(me.opts.activeCls);

			$.publish('plugin/bcDropdownMenu/onClickBody', [ me ]);
        },

        destroy: function () {
            var me = this;

            me._destroy();
        }
    });
})(jQuery);
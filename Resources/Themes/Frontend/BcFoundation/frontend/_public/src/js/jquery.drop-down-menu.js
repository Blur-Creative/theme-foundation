;(function($) {
    'use strict';

    $.plugin('swDropdownMenu', {

        defaults: {
            activeCls: 'js--is--dropdown-active',
            preventDefault: true,
            closeOnBody: true,
            dropdownCls: '.dropdown--menu'
        },

        init: function () {
            var me = this;

            me._on(me.$el, 'touchstart click', $.proxy(me.onClickMenu, me));

            $.publish('plugin/swDropdownMenu/onRegisterEvents', [ me ]);
        },

        onClickMenu: function (event) {
            var me = this,
                dropdown = me.opts.dropdownCls;

            me.applyDataAttributes();
			
            if ($(event.target).parents(dropdown).is(dropdown)) {
				event.stopPropagation();
                return;
            }

            if (me.opts.preventDefault) {
                event.preventDefault();
            }

            me.$el.toggleClass(me.opts.activeCls);

            if (me.opts.closeOnBody) {
                event.stopPropagation();
                $('body').on(me.getEventName('touchstart click'), $.proxy(me.onClickBody, me));
            }

            $.publish('plugin/swDropdownMenu/onClickMenu', [ me, event ]);
        },

        onClickBody: function(event) {
            var me = this,
                dropdown = me.opts.dropdownCls;

            if ($(event.target).parents(dropdown).is(dropdown)) {
				event.stopPropagation();
                return;
            }

            event.preventDefault();

            $('body').off(me.getEventName('touchstart click'));

            me.$el.removeClass(me.opts.activeCls);

            $.publish('plugin/swDropdownMenu/onClickBody', [ me, event ]);
        },

        destroy: function () {
            var me = this;

            me._destroy();
        }
    });
})(jQuery);
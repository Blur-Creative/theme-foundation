{extends file='parent:frontend/checkout/cart.tpl'}

{block name="frontend_checkout_actions_checkout"}
<div class="checkout--action action--checkout-proceed">
	<a href="{if {config name=always_select_payment}}{url controller='checkout' action='shippingPayment'}{else}{url controller='checkout' action='confirm'}{/if}"
	   title="{"{s name='CheckoutActionsLinkProceedShort' namespace="frontend/checkout/actions"}{/s}"|escape}"
	   class="btn btn--checkout-proceed is--success">
		<span class="text-node">{s name="CheckoutActionsLinkProceedShort" namespace="frontend/checkout/actions"}{/s}</span>
	</a>
</div>
{/block}

{block name="frontend_checkout_actions_checkout"}
	<div class="checkout--action action--checkout-proceed">
		<span
		   title="{"{s name='CheckoutActionsLinkProceedShort' namespace="frontend/checkout/actions"}{/s}"|escape}"
		   class="btn is--disabled btn--checkout-proceed is--success">
			<span class="text-node">{s name="CheckoutActionsLinkProceedShort" namespace="frontend/checkout/actions"}{/s}</span>
		</span>
	</div>
{/block}

{* Product table content *}
{block name='frontend_checkout_cart_panel'}
	<div class="panel products--overview has--border">
		<div class="panel--table is--rounded">

			{* Product table header *}
			{block name='frontend_checkout_cart_cart_head'}
				{include file="frontend/checkout/cart_header.tpl"}
			{/block}

			{* Basket items *}
			{foreach $sBasket.content as $sBasketItem}
				{block name='frontend_checkout_cart_item'}
					{include file='frontend/checkout/cart_item.tpl' isLast=$sBasketItem@last}
				{/block}
			{/foreach}

			{* Product table footer *}
			{block name='frontend_checkout_cart_cart_footer'}
				{include file="frontend/checkout/cart_footer.tpl"}
			{/block}
		</div>
	</div>
{/block}

{block name="frontend_checkout_actions_confirm_bottom"}
	<div class="main--actions">

		{* Continue shopping *}
		{block name="frontend_checkout_actions_link_last_bottom"}{/block}
		
		{if !$sMinimumSurcharge && ($sInquiry || $sDispatchNoOrder)}
			{block name="frontend_checkout_actions_inquiry"}
				<div class="checkout--action action--order-inquiry">
					<a href="{$sInquiryLink}"
					   title="{"{s name='CheckoutActionsLinkOffer' namespace="frontend/checkout/actions"}{/s}"|escape}"
					   class="btn btn--inquiry is--info">
						<span class="text-node">{s name="CheckoutActionsLinkOffer" namespace="frontend/checkout/actions"}{/s}</span>
					</a>
				</div>
			{/block}
		{/if}

		{* Forward to the checkout *}
		{if !$sMinimumSurcharge && !($sDispatchNoOrder && !$sDispatches)}
			{block name="frontend_checkout_actions_confirm_bottom_checkout"}
				<div class="checkout--action action--checkout-proceed">
					<a href="{if {config name=always_select_payment}}{url controller='checkout' action='shippingPayment'}{else}{url controller='checkout' action='confirm'}{/if}"
					   title="{"{s name='CheckoutActionsLinkProceedShort' namespace="frontend/checkout/actions"}{/s}"|escape}"
					   class="btn btn--checkout-proceed is--success">
						<span class="text-node">{s name="CheckoutActionsLinkProceedShort" namespace="frontend/checkout/actions"}{/s}</span>
					</a>
				</div>
			{/block}
		{else}
			{block name="frontend_checkout_actions_confirm_bottom_checkout"}
				<div class="checkout--action action--checkout-proceed">
					<span
					   title="{"{s name='CheckoutActionsLinkProceedShort' namespace="frontend/checkout/actions"}{/s}"|escape}"
					   class="btn is--disabled btn--checkout-proceed is--success">
						<span class="text-node">{s name="CheckoutActionsLinkProceedShort" namespace="frontend/checkout/actions"}{/s}</span>
					</span>
				</div>
			{/block}
		{/if}
	</div>
{/block}
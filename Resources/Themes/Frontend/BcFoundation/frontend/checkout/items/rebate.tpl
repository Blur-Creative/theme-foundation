{extends file='parent:frontend/checkout/items/rebate.tpl'}

{* Badge *}
{block name='frontend_checkout_cart_item_rebate_badge'}
	<div class="panel--td column--image">
	</div>
{/block}

{* Accumulated product price *}
{block name='frontend_checkout_cart_item_rebate_total_sum'}
	<div class="panel--td table--column column--total-price block is--align-right">
		
		<div class="column--total-price--inner">
			{block name='frontend_checkout_cart_item_rebate_total_sum_label'}
				<div class="column--label total-price--label">
					{s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}
				</div>
			{/block}
	
			{block name='frontend_checkout_cart_item_rebate_total_sum_display'}
				{if $sBasketItem.itemInfo}
					{$sBasketItem.itemInfo}
				{else}
					{$sBasketItem.price|currency}{block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}
				{/if}
			{/block}
		</div>
		
	    {* Product tax rate *}
		{block name='frontend_checkout_cart_item_rebate_total_sum_tax_price'}{/block}
	</div>
{/block}
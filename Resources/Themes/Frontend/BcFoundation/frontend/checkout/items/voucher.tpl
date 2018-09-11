{extends file='parent:frontend/checkout/items/voucher.tpl'}

{* Badge *}
{block name='frontend_checkout_cart_item_voucher_badge'}
	<div class="panel--td column--image">
		<div class="table--media">
			<div class="table--media-outer">
				<div class="table--media-inner">
					<img srcset="{link file='frontend/_public/src/img/products/voucher.png'} 1x, {link file='frontend/_public/src/img/products/voucher-2x.png'} 2x"
						 src="{link file='frontend/_public/src/img/products/voucher.png'}" />
				</div>
			</div>
		</div>
	</div>
{/block}

{* Product tax rate *}
{block name='frontend_checkout_cart_item_voucher_tax_price'}
	<div class="panel--td column--quantity is--align-right">
		<div class="quantity-selection--container">
		</div>
		
		<div class="delete-action--container">
		
			<form action="{url action='deleteArticle' sDelete=voucher sTargetAction=$sTargetAction}" method="post">
				<button type="submit" class="btn is--danger-outline column--actions-link"
						title="{"{s name='CartItemLinkDelete'}{/s}"|escape}">
					<i class="icon--cross"></i>
					<span class="text-node">{s namespace='frontend/checkout/cart_item' name='CartItemLinkDelete'}{/s}</span>
				</button>
			</form>
			
		</div>
	</div>

	{$smarty.block.parent}
{/block}

{* Accumulated product price *}
{block name='frontend_checkout_cart_item_voucher_total_sum'}
	<div class="panel--td column--total-price block is--align-right">
		<div class="column--total-price--inner">
			{block name='frontend_checkout_cart_item_voucher_total_sum_label'}
				<div class="column--label total-price--label">
					{s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}
				</div>
			{/block}
	
			{block name='frontend_checkout_cart_item_voucher_total_sum_display'}
				<div class="column--value total-price--value">
					{if $sBasketItem.itemInfo}
						{$sBasketItem.itemInfo}
					{else}
						{$sBasketItem.price|currency}{block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}
					{/if}
				</div>
			{/block}
		</div>
		
		{block name='frontend_checkout_cart_item_voucher_total_sum_tax_price'}
		{/block}
	</div>
{/block}

{* Remove voucher from basket *}
{block name='frontend_checkout_cart_item_voucher_delete_article'}
{/block}
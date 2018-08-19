{extends file='parent:frontend/checkout/items/premium-product.tpl'}

{block name='frontend_checkout_cart_item_premium_name'}
	{$smarty.block.parent}
	
	<div class="panel--td column--quantity is--align-right">
		
		<div class="quantity-selection--container">
		</div>

		{* Remove product from basket *}
		{block name='frontend_checkout_cart_item_premium_delete_article_action'}
			<div class="delete-action--container">
				<form action="{url action='deleteArticle' sDelete=$sBasketItem.id sTargetAction=$sTargetAction}"
					  method="post">
					<button type="submit" class="btn is--danger-outline column--actions-link"
							title="{"{s name='CartItemLinkDelete' namespace='frontend/checkout/cart_item'}{/s}"|escape}">
						<i class="icon--cross"></i>
						<span class="text-node">{s name='CartItemLinkDelete' namespace='frontend/checkout/cart_item'}{/s}</span>
					</button>
				</form>
			</div>
		{/block}		
	</div>
{/block}

{* Accumulated product price *}
{block name='frontend_checkout_cart_item_premium_total_sum'}
	<div class="panel--td column--total-price block is--align-right">
		<div class="column--total-price--inner">
			{block name='frontend_checkout_cart_item_premium_total_sum_label'}
				<div class="column--label total-price--label">
					{s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}
				</div>
			{/block}
	
			{block name='frontend_checkout_cart_item_premium_total_sum_display'}
				{s name="CartItemInfoFree" namespace="frontend/checkout/cart_item"}{/s}
			{/block}
		</div>
		
		{* Product tax rate *}
		{block name='frontend_checkout_cart_item_premium_product_total_sum_tax_price'}{/block}
	</div>
{/block}

{block name='frontend_checkout_cart_item_premium_delete_article'}
{/block}
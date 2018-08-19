{extends file='parent:frontend/checkout/items/product.tpl'}

{* Hide Quantity Label *}
{block name='frontend_checkout_cart_item_quantity_label'}
{/block}

{block name='frontend_checkout_cart_item_delete_article'}
{/block}

{* Product SKU number *}
{block name='frontend_checkout_cart_item_details_sku'}
	<div class="product--price">
		{$sBasketItem.price|currency}{block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}
	</div>
	<div class="content--sku">
		{s name="CartItemInfoId" namespace="frontend/checkout/cart_item"}{/s} {$sBasketItem.ordernumber}
	</div>
{/block}

{block name='frontend_checkout_cart_item_quantity_selection'}
	<div class="quantity-selection--container">
		{$smarty.block.parent}
	</div>
	
    {block name='frontend_checkout_cart_item_delete_action'}
        <div class="delete-action--container">
            <form action="{url action='deleteArticle' sDelete=$sBasketItem.id sTargetAction=$sTargetAction}"
                  method="post">
                <button type="submit" class="btn is--danger-outline column--actions-link"
                        title="{"{s name='CartItemLinkDelete'}{/s}"|escape}">
                    <i class="icon--cross"></i>
					<span class="text-node">{s name='CartItemLinkDelete' namespace='frontend/checkout/cart_item'}{/s}</span>
                </button>
            </form>
        </div>
    {/block}
{/block}

{* Accumulated product price *}
{block name='frontend_checkout_cart_item_total_sum'}
	<div class="panel--td column--total-price is--align-right">
		
		<div class="column--total-price--inner">
			{block name='frontend_checkout_cart_item_total_price_label'}
				<div class="column--label total-price--label">
					{s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}
				</div>
			{/block}
			<div class="column--value total-price--value">
				{$sBasketItem.amount|currency}{block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}
			</div>
		</div>
		
	    {* Product tax rate *}
		{block name='frontend_checkout_cart_item_total_sum_tax_price'}{/block}
	</div>
{/block}
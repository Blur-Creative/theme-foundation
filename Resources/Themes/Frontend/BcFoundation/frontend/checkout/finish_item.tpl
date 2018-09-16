{extends file='parent:frontend/checkout/finish_item.tpl'}

{* Article amount *}
{block name='frontend_checkout_cart_item_quantity'}
    <div class="panel--td column--quantity block is--align-right">
        {* Label *}
        {block name='frontend_checkout_finish_cart_item_quantity_label'}
            <div class="column--label quantity--label">
                {s name="CartColumnQuantity" namespace="frontend/checkout/cart_header"}{/s}
            </div>
        {/block}

		{block name='frontend_checkout_finish_cart_item_quantity_label'}
			<div class="column--value quantity--value">
				{$sBasketItem.quantity}
			</div>
		{/block}
    </div>
{/block}

{* Voucher tax price *}
{block name='frontend_checkout_cart_item_voucher_tax_price'}
	<div class="panel--td column--quantity is--align-right">
	</div>
{/block}
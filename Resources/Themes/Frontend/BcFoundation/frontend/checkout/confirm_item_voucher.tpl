{extends file='parent:frontend/checkout/confirm_item_voucher.tpl'}

{* Voucher tax price *}
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
{/block}

{* Voucher Accumulated product price *}
{block name='frontend_checkout_cart_item_voucher_total_sum_tax_price'}
    <div class="total-price--tax block is--align-right">
        {block name='frontend_checkout_cart_voucher_tax_label'}
            <div class="column--label tax-price--label">
                {if $sUserData.additional.charge_vat && !$sUserData.additional.show_net}
                    {s name='CheckoutColumnExcludeTax' namespace="frontend/checkout/confirm_header"}{/s}
                {elseif $sUserData.additional.charge_vat}
                    {s name='CheckoutColumnTax' namespace="frontend/checkout/confirm_header"}{/s}
                {/if}
            </div>
        {/block}
		
		<div class="column--value tax-price--value">
			{if $sUserData.additional.charge_vat}{$sBasketItem.tax|currency}{else}&nbsp;{/if}
		</div>
    </div>
{/block}
{extends file='parent:frontend/checkout/confirm_item_rebate.tpl'}

{block name='frontend_checkout_cart_item_rebate_tax_price'}
{/block}

{* Product Rabate tax rate *}
{block name='frontend_checkout_cart_item_rebate_total_sum_tax_price'}
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
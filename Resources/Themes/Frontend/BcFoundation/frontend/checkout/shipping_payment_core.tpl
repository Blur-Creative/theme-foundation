{extends file='parent:frontend/checkout/shipping_payment_core.tpl'}

{block name='frontend_checkout_shipping_payment_core_buttons_top'}
	<div class="confirm--actions table--actions actions--top block">
		<div class="main--actions">
			
			{block name='frontend_checkout_shipping_payment_core_buttons'}
				<div class="checkout--action action--checkout-proceed">
					<button type="submit" class="btn btn--checkout-proceed is--success" form="shippingPaymentForm">
						<span class="text-node">{s namespace='frontend/checkout/shipping_payment' name='NextButton'}{/s}</span>
					</button>
				</div>
			{/block}
			
		</div>
	</div>
{/block}

{block name='frontend_checkout_shipping_payment_core_buttons_bottom'}
	<div class="confirm--actions table--actions actions--bottom block">
		<div class="main--actions">
			
			{block name='frontend_checkout_shipping_payment_core_buttons'}
				<div class="checkout--action action--checkout-proceed">
					<button type="submit" class="btn btn--checkout-proceed is--success" form="shippingPaymentForm">
						<span class="text-node">{s namespace='frontend/checkout/shipping_payment' name='NextButton'}{/s}</span>
					</button>
				</div>
			{/block}
			
		</div>
	</div>
{/block}

{* Add product using the sku *}
{block name='frontend_checkout_cart_footer_add_product'}
{/block}

{* Add product using a voucher *}
{block name='frontend_checkout_cart_footer_add_voucher'}
{/block}

{* Benefit and services footer *}
{block name="frontend_checkout_footer"}
{/block}
{extends file='parent:frontend/checkout/cart_footer.tpl'}

{* Add product using the sku *}
{block name='frontend_checkout_cart_footer_add_product'}
    <form method="post" action="{url action='addArticle' sTargetAction=$sTargetAction}" class="table--add-product add-product--form block-group">
		<div class="input-group">
	
			{block name='frontend_checkout_cart_footer_add_product_field'}
				<input name="sAdd" class="add-product--field form-control" type="text" placeholder="{s name='CheckoutFooterAddProductPlaceholder' namespace='frontend/checkout/cart_footer_left'}{/s}" />
			{/block}
			
			{block name='frontend_checkout_cart_footer_add_product_button'}
				<div class="input-group-append">
					<button type="submit" class="add-product--button btn is--primary is--center block">
						<i class="icon--check"></i>
					</button>
				</div>
			{/block}
		</div>
    </form>
{/block}

{* Add product using a voucher *}
{block name='frontend_checkout_cart_footer_add_voucher'}
	<form method="post" action="{url action='addVoucher' sTargetAction=$sTargetAction}" class="table--add-voucher add-voucher--form">

		{block name='frontend_checkout_cart_footer_add_voucher_trigger'}
			<input type="checkbox" id="add-voucher--trigger" class="add-voucher--checkbox">
		{/block}

		{block name='frontend_checkout_cart_footer_add_voucher_label'}
			<label for="add-voucher--trigger" class="add-voucher--label">{s name="CheckoutFooterVoucherTrigger"}{/s}</label>
		{/block}

		<div class="add-voucher--panel is--hidden block-group">
			
			<div class="input-group">
				
				{block name='frontend_checkout_cart_footer_add_voucher_field'}
					<input type="text" class="add-voucher--field is--medium form-control" name="sVoucher" placeholder="{"{s name='CheckoutFooterAddVoucherLabelInline'}{/s}"|escape}" />
				{/block}
	
				{block name='frontend_checkout_cart_footer_add_voucher_button'}
					<div class="input-group-append">
						<button type="submit" class="add-voucher--button is--medium btn is--primary is--center block">
							<i class="icon--coupon"></i>
						</button>
					</div>
				{/block}
			</div>
		</div>
	</form>
{/block}

{block name='frontend_checkout_shipping_costs_country_trigger'}
	<a href="#show-hide--shipping-costs" class="btn table--shipping-costs-trigger">
		<span class="text-node">{s name='CheckoutFooterEstimatedShippingCosts'}{/s}</span>
		<i class="icon--arrow-down"></i>
	</a>
{/block}
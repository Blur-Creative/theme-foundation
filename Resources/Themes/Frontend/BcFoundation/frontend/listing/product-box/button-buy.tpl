{extends file='parent:frontend/listing/product-box/button-buy.tpl'}

{block name="frontend_listing_product_box_button_buy_button"}
	<button class="buybox--button btn is--success">
		{block name="frontend_listing_product_box_button_buy_button_text"}
			<i class="icon--cart"></i>
			<span class="text-node">In den Warenkorb</span>
		{/block}
	</button>
{/block}
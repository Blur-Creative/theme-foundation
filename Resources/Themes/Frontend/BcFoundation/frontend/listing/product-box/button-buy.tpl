{extends file='parent:frontend/listing/product-box/button-buy.tpl'}

{block name="frontend_listing_product_box_button_buy_button"}
	<button class="buybox--button btn">
		{block name="frontend_listing_product_box_button_buy_button_text"}
			<i class="fas fa-cart-plus"></i>
			<span class="text-node">{s namespace="frontend/listing/box_article" name="ListingBuyActionAdd"}{/s}</span>
		{/block}
	</button>
{/block}
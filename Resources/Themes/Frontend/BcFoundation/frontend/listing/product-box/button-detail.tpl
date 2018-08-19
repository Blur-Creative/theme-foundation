{extends file='parent:frontend/listing/product-box/button-detail.tpl'}

{block name="frontend_listing_product_box_button_detail_anchor"}
	<a href="{$url}" class="button--detail btn is--dark" title="{$label} - {$title}">
		{block name="frontend_listing_product_box_button_detail_text"}
			<i class="icon--cart"></i>
			<span class="text-node">{$label}</span>
		{/block}
	</a>
{/block}
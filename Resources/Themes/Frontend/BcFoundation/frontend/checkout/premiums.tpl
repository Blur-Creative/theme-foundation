{extends file='parent:frontend/checkout/premiums.tpl'}

{block name='frontend_checkout_premium_info_button_small'}
	<button class="premium--button btn is--primary is--align-center" type="submit">
		<i class="icon--cart"></i>
	</button>
{/block}

{block name='frontend_checkout_premium_info_button'}
	<div class="premium--buy">
		<button class="btn is--primary btn--premium-buy" type="submit">
			<i class="icon--cart"></i>
			<span class="text-node">{s name='PremiumActionAdd' namespace='frontend/checkout/premiums'}{/s}</span>
		</button>
	</div>
{/block}
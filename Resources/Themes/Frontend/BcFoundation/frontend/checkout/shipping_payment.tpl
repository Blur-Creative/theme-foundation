{extends file='parent:frontend/checkout/shipping_payment.tpl'}

{* Reset Block Step box *}
{block name='frontend_index_navigation_categories_top'}

	{if !$theme.checkoutHeader}
		{block name='frontend_index_navigation_main_config'}
			{if $theme.main_navigation_alignment=='center'}
				{$navigation_main_aligment = 'navigation-main-center'}
			{elseif $theme.main_navigation_alignment=='end'}
				{$navigation_main_aligment = 'navigation-main-end'}
			{else}
				{$navigation_main_aligment = 'navigation-main-start'}
			{/if}
		{/block}
	
		<nav class="navigation-main {$navigation_main_aligment}" data-menu-scroller="true" data-listSelector=".navigation--list.container" data-viewPortSelector=".navigation--list-wrapper">
			{block name="frontend_index_navigation_categories_top_include"}
				{include file='frontend/index/main-navigation.tpl'}
			{/block}
		</nav>
	{/if}
{/block}

{* Content top container *}
{block name="frontend_index_content_top"}
	{$smarty.block.parent}
	
	{block name="frontend_index_content_step_box_include"}
		{if !$toAccount}
			{include file="frontend/register/steps.tpl" sStepActive="paymentShipping"}
		{/if}
	{/block}
{/block}
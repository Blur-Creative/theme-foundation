{extends file='parent:frontend/register/index.tpl'}

{* Reset Block Step box *}
{block name='frontend_index_navigation_categories_top'}

	{if !$theme.checkoutHeader or ($theme.checkoutHeader == 1 && $toAccount == 1)}
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
	
	{debug}
{/block}

{* Content top container *}
{block name="frontend_index_content_top"}
	{$smarty.block.parent}
	
	{block name="frontend_index_content_step_box_include"}
		{if !$toAccount}
			{include file="frontend/register/steps.tpl" sStepActive="address"}
		{/if}
	{/block}
{/block}

{block name='frontend_register_index_form_submit'}
	{* Submit button *}
	<div class="panel--footer">
		<ul class="nav register--action">
			<li class="nav-item register--action-item">
				<button type="submit" class="register--submit btn is--success" name="Submit">
					<span class="text-node">
						{if $sTarget == 'checkout'}
							{s name="RegisterIndexNewAccountCheckout" namespace="themes/bcfoundation/frontend/account/index"}{/s}
						{else}
							{s name="RegisterIndexNewAccount" namespace="themes/bcfoundation/frontend/account/index"}{/s}
						{/if}
					</span>
				</button>
			</li>
		</ul>
	</div>
{/block}

{block name='frontend_register_index_advantages'}
{/block}
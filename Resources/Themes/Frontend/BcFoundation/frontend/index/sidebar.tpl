{extends file='parent:frontend/index/sidebar.tpl'}

{* Mobile specific menu actions *}
{block name="frontend_index_left_navigation_smartphone"}

	{* Trigger to close the off canvas menu *}
	{block name="frontend_index_left_categories_close_menu"}
		<a href="#close-categories-menu" title="{s namespace='frontend/index/menu_left' name="IndexActionCloseMenu"}{/s}" class="btn is--dark btn-close-offcanvas">
			<i class="icon--cross"></i>
			<span class="text-node">{s namespace='frontend/index/menu_left' name="IndexActionCloseMenu"}{/s}</span>
		</a>
	{/block}
			
	<div class="navigation--smartphone">

		{* Switches for currency and language on mobile devices *}
		{block name="frontend_index_left_switches"}
			<div class="mobile--switches">
				{action module=widgets controller=index action=shopMenu}
			</div>
		{/block}
	</div>
{/block}
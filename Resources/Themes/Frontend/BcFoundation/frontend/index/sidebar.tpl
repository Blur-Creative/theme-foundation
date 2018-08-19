{extends file='parent:frontend/index/sidebar.tpl'}

{block name="frontend_index_left_inner"}

	{* Mobile specific menu actions *}
	{block name="frontend_index_left_navigation_smartphone"}
	
		{* Trigger to close the off canvas menu *}
		{block name="frontend_index_left_categories_close_menu"}
			<a href="#close-categories-menu" title="{s namespace='frontend/index/menu_left' name="IndexActionCloseMenu"}{/s}" class="btn btn-close-offcanvas close--off-canvas">
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
	
	{* if sCategoryContent is not available use sArticle.categoryID *}
	{if isset($sCategoryContent) && $sCategoryContent.id}
		{$subCategoryId = $sCategoryContent.id}
	{elseif isset($sArticle) && $sArticle.categoryID}
		{$subCategoryId = $sArticle.categoryID}
	{elseif isset($sCustomPage) && $sCustomPage.id}
		{$subCategoryId = $sCustomPage.id}
	{else}
		{$subCategoryId = 0}
	{/if}

	<div class="sidebar--categories-wrapper" data-bc-sidebar-category-nav="true">
		{* Sidebar category tree *}
		{block name='frontend_index_left_categories'}

			{* Categories headline *}
			{block name="frontend_index_left_categories_headline"}
				<div class="categories--headline navigation--headline">
					{s namespace='frontend/index/menu_left' name="IndexSidebarCategoryHeadline"}{/s}
				</div>
			{/block}

			{* Actual include of the categories *}
			{block name='frontend_index_left_categories_inner'}
				<div class="sidebar--categories-navigation">
					{include file='frontend/index/sidebar-categories.tpl'}
				</div>
			{/block}
		{/block}

		{* Static sites *}
		{block name='frontend_index_left_menu'}
			{include file='frontend/index/sites-navigation.tpl'}
		{/block}
	</div>	
	
{/block}
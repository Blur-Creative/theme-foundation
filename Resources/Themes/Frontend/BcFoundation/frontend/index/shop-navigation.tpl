{extends file='parent:frontend/index/shop-navigation.tpl'}

{* Search form *}
{block name='frontend_index_search'}
	<li class="navigation--entry entry--search" role="menuitem">
		<div class="main-search--bar" data-search="true" aria-haspopup="true"{if $theme.focusSearch && {controllerName|lower} == 'index'} data-activeOnStart="true"{/if}>
			<a class="btn entry--link entry--trigger" href="#show-hide--search" title="{"{s namespace='frontend/index/search' name="IndexTitleSearchToggle"}{/s}"|escape}">
				<i class="icon--search"></i>
		
				{block name='frontend_index_search_display'}
					<span class="search--display">{s namespace='frontend/index/search' name="IndexSearchFieldSubmit"}{/s}</span>
				{/block}
			</a>
		
			{* Include of the search form *}
			{block name='frontend_index_search_include'}
				{include file="frontend/index/search.tpl"}
			{/block}
		</div>
	</li>
{/block}
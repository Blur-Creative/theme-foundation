{extends file="parent:frontend/search/ajax.tpl"}

{* Link to show all founded products using the built-in search *}
{block name="search_ajax_all_results"}
	<li class="entry--all-results block-group result--item">

		{* Link to the built-in search *}
		{block name="search_ajax_all_results_link"}
			<a href="{url controller="search"}?sSearch={$sSearchRequest.sSearch|urlencode}" class="search-result--link entry--all-results-link block">
				<i class="icon--search"></i>
				<span class="text-node">{s name="SearchAjaxLinkAllResults"}{/s}</span>
				
				{* Result of all founded products *}
				{block name="search_ajax_all_results_number"}
					<span class="entry--all-results-number block">
						{$sSearchResults.sArticlesCount} {s name='SearchAjaxInfoResults'}{/s}
					</span>
				{/block}
			</a>
		{/block}
	</li>
{/block}
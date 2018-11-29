{* Maincategories left *}
{function name=categories level=0}
    <ul class="sidebar--navigation categories--navigation navigation--list{if $level == 0} is--level{$level}{else} categories--sublevel{/if}{if $level > 1} navigation--level-high{/if}" role="menu">
        {* @deprecated The block "frontend_index_categories_left_ul" will be removed in further versions, please use "frontend_index_categories_left_before" *}
        {block name="frontend_index_categories_left_ul"}{/block}

        {block name="frontend_index_categories_left_before"}{/block}
        {foreach $categories as $category}
			{block name="frontend_index_categories_left_entry"}
				<li class="navigation--entry{if $category.flag} is--active{/if}{if $category.subcategories} has--sub-categories{/if}{if $category.childrenCount} has--sub-children{/if}" role="menuitem">
					<div class="navigation--item{if $category.flag} is--active{if $category.id === $sCategoryContent.id} is--lastchild-active{/if}{/if}{if $category.subcategories} has--sub-categories{/if}">
						<a class="btn is--link navigation--link"
							href="{$category.link}"
							title="{$category.description|escape}"
							{if $category.external && $category.externalTarget}target="{$category.externalTarget}"{/if}>
							{$category.description}
						</a>
						{if $category.childrenCount}
							<span class="subcategory--indicator link--go-forward is--icon-right"
							data-categoryId="{$category.id}"
							data-fetchUrl="{url module=widgets controller=listing action=getCategory categoryId={$category.id}}">
								<i class="{if $category.flag}icon--arrow-up{else}icon--arrow-down{/if}"></i>
							</span>
						{/if}
					</div>
					{block name="frontend_index_categories_left_entry_subcategories"}
						{if $category.subcategories}
							{call name=categories categories=$category.subcategories level=$level+1}
						{/if}
					{/block}
				</li>
			{/block}
        {/foreach}
        {block name="frontend_index_categories_left_after"}{/block}
    </ul>
{/function}

{if $sCategories}
    {call name=categories categories=$sCategories}
{elseif $sMainCategories}
    {call name=categories categories=$sMainCategories}
{/if}

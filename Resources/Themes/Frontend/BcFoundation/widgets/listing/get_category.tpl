{extends file="parent:widgets/listing/get_category.tpl"}

{namespace name="frontend/listing/get_category"}

{block name="widgets_listing_get_category"}

        {block name="widgets_listing_get_category_mainmenu"}
			{block name="widgets_listing_get_category_mainmenu_link"}
			{/block}
        {/block}

        {block name="widgets_listing_get_category_name"}
			{block name="widgets_listing_get_category_name_link"}
			{/block}
        {/block}

        {block name="widgets_listing_get_category_categories"}
            <ul class="sidebar--navigation categories--navigation navigation--list categories--sublevel" role="menu">

                {* Go back button *}
                {block name="widgets_listing_get_category_categories_back"}
                        {block name="widgets_listing_get_category_categories_back_link"}
                                {block name="widgets_listing_get_category_categories_back_link_arrow_left"}
                                {/block}

                                {block name="widgets_listing_get_category_categories_back_link_name"}
                                {/block}
                        {/block}
                {/block}

                {* Show this category button *}
                {block name="widgets_listing_get_category_categories_show"}
                        {block name="widgets_listing_get_category_categories_show_link"}
                                {block name="widgets_listing_get_category_categories_show_link_name"}
                                {/block}
                        {/block}
                {/block}

                {* sub categories *}
                {foreach $category.children as $children}
                    {block name="widgets_listing_get_category_categories_item"}
                        {if $children.active}
                            <li class="navigation--entry" role="menuitem">
								<div class="navigation--item{if $children.flag} is--active{/if}{if $children.childrenCount} link--go-forward{/if}">
									{block name="widgets_listing_get_category_categories_item_link"}
										<a href="{$children.link}" title="{$children.name|escape}"
										   class="btn is--link navigation--link{if $children.childrenCount} link--go-forward{/if}"
										   data-category-id="{$children.id}"
										   data-fetchUrl="{url module=widgets controller=listing action=getCategory categoryId={$children.id}}">

											{block name="widgets_listing_get_category_categories_item_link_name"}
												{$children.name}
											{/block}

											{*block name="widgets_listing_get_category_categories_item_link_children"}
												{if $children.childrenCount}
													<span class="is--icon-right">
														<i class="icon--arrow-right"></i>
													</span>
												{/if}
											{/block*}
										</a>
										
										{block name="widgets_listing_get_category_categories_item_link_children"}
											{if $children.childrenCount}
												<span class="subcategory--indicator  is--icon-right"
												   data-categoryId="{$children.id}"
												   data-fetchUrl="{url module=widgets controller=listing action=getCategory categoryId={$children.id}}">
													<i class="{if $children.flag}icon--arrow-up{else}icon--arrow-down{/if}"></i>
												</span>
											{/if}
										{/block}
									{/block}
								</div>
                            </li>
                        {/if}
                    {/block}
                {/foreach}
            </ul>
        {/block}
{/block}
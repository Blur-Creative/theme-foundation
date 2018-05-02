{extends file='parent:widgets/index/menu.tpl'}

{block name='widgets_index_menu'}
    {if $sMenu[$sGroup]}
		<div class="dropdown--menu">
			<ul class="service--list dropdown--menu-list no--space" role="menu">
				{foreach $sMenu[$sGroup] as $item}
					<li class="service--entry dropdown--menu-item" role="menuitem">
						<a class="service--link dropdown--menu-link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}" {if $item.target}target="{$item.target}"{/if}>
							{$item.description}
						</a>
					</li>
				{/foreach}
			</ul>
		</div>
    {/if}
{/block}
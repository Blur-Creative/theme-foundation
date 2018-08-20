{extends file='parent:widgets/emotion/index.tpl'}

{* Config block for overriding configuration variables of the shopping world *}
{block name="widgets/emotion/index/config"}
	{$smarty.block.parent}

	{$baseWidth = 1260}
	
	{if $Controller == 'listing' && $theme.displaySidebar}
		{$baseWidth = 960}
	{/if}
{/block}
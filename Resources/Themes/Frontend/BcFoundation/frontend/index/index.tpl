{extends file="parent:frontend/index/index.tpl"}

{block name="frontend_index_header_javascript_jquery_lib"}
	{$smarty.block.parent}
	
	{block name="frontend_index_foundation_google_fonts_tag"}
		{if $theme.google_fonts_tag}
			{$theme.google_fonts_tag}
		{/if}
	{/block}
{/block}
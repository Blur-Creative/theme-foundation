{extends file="parent:frontend/index/topbar-navigation.tpl"}

{* Service / Support drop down *}
{block name="frontend_index_checkout_actions_service_menu"}
	<div class="navigation--entry entry--service has--drop-down" role="menuitem" aria-haspopup="true" data-drop-down-menu="true">
		<button type="button" class="link--entry dropdown--menu-button">
			<i class="icon--service"></i>
			{s namespace='frontend/index/checkout_actions' name='IndexLinkService'}{/s}
		</button>
		{* Include of the widget *}
		{block name="frontend_index_checkout_actions_service_menu_include"}
			{include file="widgets/index/menu.tpl" sGroup=gLeft}
		{/block}
	</div>
{/block}
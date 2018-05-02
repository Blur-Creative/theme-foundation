{extends file='parent:frontend/account/sidebar.tpl'}
{namespace name='frontend/account/sidebar'}

{* Sidebar navigation headline *}
{block name="frontend_account_menu_title"}
	{if $inHeader==true}
		<div class="dropdown--menu-header">
			{s name="AccountHeaderNavigation"}{/s}
		</div>
	{elseif {config name=useSltCookie} && $userInfo}
		<h2 class="navigation--headline">
			{block name="frontend_account_menu_greeting"}
				{s name="AccountGreetingBefore"}{/s}
				{$userInfo['firstname']}
				{s name="AccountGreetingAfter"}{/s}
			{/block}
		</h2>
	{else}
		<h2 class="navigation--headline">
			{s name="AccountHeaderNavigation"}{/s}
		</h2>
	{/if}
	
	{if {config name=useSltCookie} && !$userInfo && $inHeader}
		<ul class="dropdown--menu-list">
			<li class="dropdown--menu-item">
				<span class="navigation--signin">
					<a href="{url module='frontend' controller='account'}#hide-registration"
					   class="btn is--primary navigation--signin-btn{if $register} registration--menu-entry entry--close-off-canvas{/if}"
					   data-collapseTarget="#registration"
					   data-action="close">
						{s name="AccountLogin"}{/s}
					</a>
					<span class="navigation--register">
						{s name="AccountOr"}{/s}
						<a href="{url module='frontend' controller='account'}#show-registration"
						   class="blocked--link{if $register} registration--menu-entry entry--close-off-canvas{/if}"
						   data-collapseTarget="#registration"
						   data-action="open">
							{s name="AccountRegister"}{/s}
						</a>
					</span>
				</span>
			</li>
		</ul>
	{/if}
{/block}

{* Link to the account overview page *}
{block name="frontend_account_menu_link_overview"}
	<li class="navigation--entry">
		<a href="{url module='frontend' controller='account'}" title="{s name="AccountLinkOverview"}{/s}" class="navigation--link{if {controllerName|lower} == 'account' && $sAction == 'index'} is--active{/if}" rel="nofollow">
			{s name="AccountLinkOverview"}{/s}
		</a>
	</li>
{/block}
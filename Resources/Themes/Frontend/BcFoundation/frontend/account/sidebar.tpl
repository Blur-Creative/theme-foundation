{extends file='parent:frontend/account/sidebar.tpl'}
{namespace name='frontend/account/sidebar'}

{* Sidebar navigation headline *}
{block name="frontend_account_menu_title"}
	{if $inHeader or $inSidebar}
	{elseif {config name=useSltCookie} && $userInfo}
		<div class="navigation--headline">
			{block name="frontend_account_menu_greeting"}
				{s name="AccountGreetingBefore"}{/s}
				{$userInfo['firstname']}
				{s name="AccountGreetingAfter"}{/s}
			{/block}
		</div>
	{else}
		<div class="navigation--headline">
			{s name="AccountHeaderNavigation"}{/s}
		</div>
	{/if}
	
	{if {config name=useSltCookie} && !$isUserLoggedIn && $inHeader}
		<ul class="account--menu-signin">
			<li class="dropdown--menu-item">
				
				<form name="sLogin" method="post" action="{url controller=account action=login}" class="account-signin-form">
					<input name="sTarget" type="hidden" value="account" />
					
					<div class="form-group form-group-email">
						<input name="email" type="email" placeholder="{s namespace='frontend/account/login' name='LoginLabelMail'}{/s}<" autocomplete="email" tabindex="1" value="{$sFormData.email|escape}" class="form-control is--small {if $sErrorFlag.email}instyle_error{/if}" />
					</div>
				
					<div class="form-group form-group-password">
						<div class="input-group">
							<input name="password" type="password" placeholder="{s namespace='frontend/account/login' name="LoginLabelPassword"}{/s}" autocomplete="current-password" tabindex="2" class="form-control is--small {if $sErrorFlag.password}instyle_error{/if}" />
							<div class="input-group-append">
								<button class="btn is--primary is--small" type="submit" name="submit">{s namespace='frontend/account/login' name='LoginLinkLogon'}{/s}</button>
							</div>
						</div>
					</div>

					{*
					<div class="password">
						<a href="{url action=password}" title="{"{s name='LoginLinkLostPassword'}{/s}"|escape}">
							{s namespace='frontend/account/login' name="LoginLinkLostPassword"}{/s}
						</a>
					</div>
					*}
				</form>
				
				<a href="{url module='frontend' controller='account'}#show-registration"
				   class="btn is--link is--center is--block{if $register} registration--menu-entry entry--close-off-canvas{/if}"
				   data-collapseTarget="#registration"
				   data-action="open">
					{s namespace="themes/bcfoundation/frontend/account/index" name="AccountRegisterNew"}{/s}
				</a>
				
				{*
				<span class="navigation--signin nav">
					<div class="nav-item">
						<a href="{url module='frontend' controller='account'}#hide-registration"
						   class="btn is--primary-outline navigation--signin-btn{if $register} registration--menu-entry entry--close-off-canvas{/if}"
						   data-collapseTarget="#registration"
						   data-action="close">
							{s name="AccountLogin"}{/s}
						</a>
					</div>
					<span class="navigation--register nav-item">

					</span>
				</span>
				*}
			</li>
		</ul>
	{/if}
{/block}

{block name="frontend_account_menu_container"}

	{if $isUserLoggedIn}
		{* Sidebar navigation *}
		<ul class="{strip}navigation--list account--menu-list
				{if ($inHeader or $inSiderbar) and $isUserLoggedIn} sidebar--navigation account--menu-list{if $inHeader} in--header {/if}show--active-items
				{else} account--sidebar{/if}
			{/strip}">
	
			{block name="frontend_account_menu_list"}
			
				{* Link to the account overview page *}
				{block name="frontend_account_menu_link_overview"}
					<li class="navigation--entry entry--overview">
						<a href="{url module='frontend' controller='account'}" title="{s name="AccountLinkOverview"}{/s}" class="navigation--link{if {controllerName|lower} == 'account' && $sAction == 'index'} is--active{/if}" rel="nofollow">
							<i class="icon--layout"></i>
							<span class="text-node">{s name="AccountLinkOverview"}{/s}</span>
						</a>
					</li>
				{/block}
	
				{* Link to the account profile page *}
				{block name="frontend_account_menu_link_profile"}
					<li class="navigation--entry entry--profile">
						<a href="{url module='frontend' controller='account' action=profile}" title="{s name="AccountLinkProfile"}{/s}" class="navigation--link{if {controllerName|lower} == 'account' && $sAction == 'profile'} is--active{/if}" rel="nofollow">
							<i class="icon--account"></i>
							<span class="text-node">{s name="AccountLinkProfile"}{/s}</span>
						</a>
					</li>
				{/block}
	
				{* Link to the user addresses *}
				{block name="frontend_account_menu_link_addresses"}
					{if $inHeader}
						<li class="navigation--entry entry--addresses">
							<a href="{url module='frontend' controller='address' action='index' sidebar=''}" title="{s name="AccountLinkAddresses"}{/s}" class="navigation--link{if {controllerName} == 'address'} is--active{/if}" rel="nofollow">
								<i class="icon--location"></i>
								<span class="text-node">{s name="AccountLinkAddresses"}{/s}</span>
							</a>
						</li>
					{else}
						<li class="navigation--entry entry--addresses">
							<a href="{url module='frontend' controller='address' action='index'}" title="{s name="AccountLinkAddresses"}My addresses{/s}" class="navigation--link{if {controllerName} == 'address'} is--active{/if}" rel="nofollow">
								<i class="icon--location"></i>
								<span class="text-node">{s name="AccountLinkAddresses"}My addresses{/s}</span>
							</a>
						</li>
					{/if}
				{/block}
	
				{* Link to the user payment method settings *}
				{block name="frontend_account_menu_link_payment"}
					<li class="navigation--entry entry--payment">
						<a href="{url module='frontend' controller='account' action='payment'}" title="{s name="AccountLinkPayment"}{/s}" class="navigation--link{if $sAction == 'payment'} is--active{/if}" rel="nofollow">
							<i class="icon--creditcard"></i>
							<span class="text-node">{s name="AccountLinkPayment"}{/s}</span>
						</a>
					</li>
				{/block}
	
				{* Link to the user orders *}
				{block name="frontend_account_menu_link_orders"}
					<li class="navigation--entry entry--orders">
						<a href="{url module='frontend' controller='account' action='orders'}" title="{s name="AccountLinkPreviousOrders"}{/s}" class="navigation--link{if $sAction == 'orders'} is--active{/if}" rel="nofollow">
							<i class="icon--archive"></i>
							<span class="text-node">{s name="AccountLinkPreviousOrders"}{/s}</span>
						</a>
					</li>
				{/block}
	
				{* Link to the user downloads *}
				{block name="frontend_account_menu_link_downloads"}
					{if {config name=showEsd}}
						<li class="navigation--entry entry--downloads">
							<a href="{url module='frontend' controller='account' action='downloads'}" title="{s name="AccountLinkDownloads"}{/s}" class="navigation--link{if $sAction == 'downloads'} is--active{/if}" rel="nofollow">
								<i class="icon--download"></i>
								<span class="text-node">{s name="AccountLinkDownloads"}{/s}</span>
							</a>
						</li>
					{/if}
				{/block}
	
				{* Link to the user product notes *}
				{block name="frontend_account_menu_link_notes"}
					<li class="navigation--entry entry--favorites">
						<a href="{url module='frontend' controller='note'}" title="{s name="AccountLinkNotepad"}{/s}" class="navigation--link{if {controllerName} == 'note'} is--active{/if}" rel="nofollow">
							<i class="icon--heart"></i>
							<span class="text-node">{s name="AccountLinkNotepad"}{/s}</span>
						</a>
					</li>
				{/block}
	
				{* Link to the partner statistics *}
				{block name="frontend_account_menu_link_partner_statistics"}
					{if $sUserLoggedIn && !$sOneTimeAccount && !$inHeader}
						{action module='frontend' controller="account" action="partnerStatisticMenuItem"}
					{/if}
				{/block}
	
				{* Logout action *}
				{block name="frontend_account_menu_link_logout"}
					{if {config name=useSltCookie} && $userInfo}
						<li class="navigation--entry entry--logout">
							{block name="frontend_account_menu_logout_personalized_link"}
								<a href="{url controller='account' action='logout'}" title="{s name="AccountLogout"}{/s}"
								   class="btn is--danger-outline link--logout navigation--personalized">
									{block name="frontend_account_menu_logout_personalized"}
									
										<i class="icon--lock"></i>
	
										{block name="frontend_account_menu_logout_personalized_link_user_info"}
											<span class="text-node navigation--logout-personalized blocked--link">
		
												{block name="frontend_account_menu_logout_personalized_link_not_user"}
													<span class="logout--not-user blocked--link">{s name="AccountNot"}{/s}</span>
												{/block}
	
												{block name="frontend_account_menu_logout_personalized_link_user_name"}
													<span class="logout--user-name blocked--link">{$userInfo['firstname']}?</span>
												{/block}
												
												{block name="frontend_account_menu_logout_personalized_logout_text"}
													<span class="navigation--logout blocked--link">{s name="AccountLogout"}{/s}</span>
												{/block}
											</span>
										{/block}
									{/block}
								</a>
							{/block}
						</li>
					{elseif $sUserLoggedIn && !$sOneTimeAccount}
						{block name="frontend_account_menu_link_logout_standard"}
							<li class="navigation--entry">
								{block name="frontend_account_menu_link_logout_standard_link"}
									<a href="{url module='frontend' controller='account' action='logout'}" title="{s name="AccountLinkLogout2"}{/s}" class="navigation--link link--logout" rel="nofollow">
										{block name="frontend_account_menu_link_logout_standard_link_icon"}
											<i class="icon--logout"></i>
										{/block}
	
										{block name="frontend_account_menu_link_logout_standard_link_text"}
											<span class="navigation--logout logout--label">{s name="AccountLinkLogout2"}{/s}</span>
										{/block}
									</a>
								{/block}
							</li>
						{/block}
					{/if}
				{/block}
			{/block}
		</ul>
	{/if}
{/block}
{extends file='parent:widgets/checkout/info.tpl'}

{* My account entry *}
{block name="frontend_index_checkout_actions_my_options"}
    <li class="navigation--entry entry--account{if {config name=useSltCookie}} with-slt{/if} has--drop-down"
		aria-haspopup="true"
		data-drop-down-menu="true"
        role="menuitem">
        {block name="frontend_index_checkout_actions_account"}
            <a href="{url controller='account'}"
               title="{"{if $userInfo}{s name="AccountGreetingBefore" namespace="frontend/account/sidebar"}{/s}{$userInfo['firstname']}{s name="AccountGreetingAfter" namespace="frontend/account/sidebar"}{/s} - {/if}{s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}"|escape}"
               class="btn is--icon-left entry--link account--link{if $userInfo} account--user-loggedin{/if}">
                <i class="icon--account"></i>
                {if $userInfo}
                    <span class="account--display navigation--personalized">
                        <span class="account--display-greeting">
                            {s name="AccountGreetingBefore" namespace="frontend/account/sidebar"}{/s}
                            {$userInfo['firstname']}
                            {s name="AccountGreetingAfter" namespace="frontend/account/sidebar"}{/s}
                        </span>
                        {s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}
                    </span>
                {else}
                    <span class="account--display">
                        {s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}
                    </span>
                {/if}
            </a>
        {/block}

        {if {config name=useSltCookie}}
            {block name="frontend_index_checkout_actions_account_navigation"}
				<div class="dropdown--menu">
					<div class="account--dropdown-navigation">
	
						{block name="frontend_index_checkout_actions_account_navigation_smartphone"}
						{/block}
	
						{block name="frontend_index_checkout_actions_account_menu"}
							{include file="frontend/account/sidebar.tpl" showSidebar=true inHeader=true}
						{/block}
					</div>
				</div>
            {/block}
        {/if}
    </li>
{/block}
{extends file='parent:frontend/account/payment.tpl'}

{* Payment headline *}
{block name="frontend_account_payment_headline"}
	<div class="panel account--welcome">
		<h1 class="panel--title">{s name="PaymentHeadline"}{/s}</h1>
	</div>
{/block}

{* Payment actions *}
{block name="frontend_account_payment_action_buttons"}
    <div class="account--actions panel--footer">
        <ul class="nav account--panel-nav">
            {block name="frontend_account_payment_action_button_back"}
                {if $sTarget}
                    <li class="nav-item account--panel-nav-item">
                        <a class="btn account--panel-nav-action is--secondary payment--action-back-link" href="{url controller=$sTarget action=$sTargetAction|default:"index"}" title="{"{s name='PaymentLinkBack'}{/s}"|escape}">
                            {s name="PaymentLinkBack"}{/s}
                        </a>
                    </li>
                {/if}
            {/block}
            {block name="frontend_account_payment_action_button_send"}
                <li class="nav-item account--panel-nav-item item--save-payment">
                    <input type="submit" value="{s name='PaymentLinkSend'}{/s}" class="btn account--panel-nav-action is--primary register--submit" />
                </li>
            {/block}
        </ul>
    </div>
{/block}

{extends file='parent:frontend/checkout/confirm.tpl'}

{* Reset Block Step box *}
{block name='frontend_index_navigation_categories_top'}

	{block name='frontend_index_navigation_main_config'}
		{if $theme.main_navigation_alignment=='center'}
			{$navigation_main_aligment = 'navigation-main-center'}
		{elseif $theme.main_navigation_alignment=='end'}
			{$navigation_main_aligment = 'navigation-main-end'}
		{else}
			{$navigation_main_aligment = 'navigation-main-start'}
		{/if}
	{/block}

	<nav class="navigation-main {$navigation_main_aligment}" data-menu-scroller="true" data-listSelector=".navigation--list.container" data-viewPortSelector=".navigation--list-wrapper">
		{block name="frontend_index_navigation_categories_top_include"}
			{include file='frontend/index/main-navigation.tpl'}
		{/block}
	</nav>
{/block}

{* Content top container *}
{block name="frontend_index_content_top"}
	{$smarty.block.parent}
	
	{block name="frontend_index_content_step_box_include"}
		{if !$toAccount}
			{include file="frontend/register/steps.tpl" sStepActive="finished"}
		{/if}
	{/block}
{/block}

{* Terms of service *}
{block name='frontend_checkout_confirm_agb'}
	<li class="block-group row--tos">
		
		<div class="terms-of-service--confirm{if !{config name='IgnoreAGB'}} custom-control custom-checkbox{/if}">
			{* Terms of service checkbox *}
			{block name='frontend_checkout_confirm_agb_checkbox'}
				{if !{config name='IgnoreAGB'}}
					<input type="checkbox"
						   required="required"
						   aria-required="true"
						   id="sAGB"
						   class="custom-control-input"
						   name="sAGB"{if $sAGBChecked} checked="checked"{/if} />
				{/if}
			{/block}
			
			{* AGB label *}
			{block name='frontend_checkout_confirm_agb_label'}
				<label for="sAGB" class="custom-control-label{if $sAGBError} has--error{/if}" data-modalbox="true" data-targetSelector="a" data-mode="ajax" data-height="500" data-width="750">
					{s name="ConfirmTerms"}{/s}
				</label>
			{/block}
		</div>
		
	</li>
{/block}

{block name='frontend_checkout_confirm_information_addresses_equal_panel_actions'}
	<div class="panel--actions panel--footer">
		{block name="frontend_checkout_confirm_information_addresses_equal_panel_actions_change"}
			<div class="address--actions-change">
				{block name='frontend_checkout_confirm_information_addresses_equal_panel_shipping_change_address'}
					<a href="{url controller=address action=edit id=$activeBillingAddressId sTarget=checkout sTargetAction=confirm}"
					   data-address-editor="true"
					   data-id="{$activeBillingAddressId}"
					   data-sessionKey="checkoutBillingAddressId,checkoutShippingAddressId"
					   data-title="{s name="ConfirmAddressSelectButton"}Change address{/s}"
					   title="{s name="ConfirmAddressSelectButton"}Change address{/s}"
					   class="btn">
						{s name="ConfirmAddressSelectButton"}Change address{/s}
					</a>
				{/block}

				{block name='frontend_checkout_confirm_information_addresses_equal_panel_shipping_add_address'}
					<a href="{url controller=address}"
					   class="btn choose-different-address"
					   data-address-selection="true"
					   data-sessionKey="checkoutShippingAddressId"
					   data-id="{$activeShippingAddressId}"
					   title="{s name="ConfirmAddressChooseDifferentShippingAddress"}{/s}">
						{s name="ConfirmAddressChooseDifferentShippingAddress"}{/s}
					</a>
				{/block}
			</div>
		{/block}
		{block name="frontend_checkout_confirm_information_addresses_equal_panel_actions_select_address"}
			<a href="{url controller=address}"
			   title="{s name="ConfirmAddressSelectLink"}{/s}"
			   data-address-selection="true"
			   data-sessionKey="checkoutBillingAddressId,checkoutShippingAddressId"
			   data-id="{$activeBillingAddressId}">
				{s name="ConfirmAddressSelectLink"}{/s}
			</a>
		{/block}
	</div>
{/block}

{* Action buttons *}
{block name="frontend_checkout_confirm_information_addresses_billing_panel_actions"}
	<div class="panel--actions panel--footer">
		<ul class="nav confirm--panel-nav">
			{block name="frontend_checkout_confirm_information_addresses_billing_panel_actions_change"}
				<li class="nav-item confirm--panel-nav-item address--actions-change">
					{block name="frontend_checkout_confirm_information_addresses_billing_panel_actions_change_address"}
						<a href="{url controller=address action=edit id=$activeBillingAddressId sTarget=checkout sTargetAction=confirm}"
						   data-address-editor="true"
						   data-sessionKey="checkoutBillingAddressId"
						   data-id="{$activeBillingAddressId}"
						   data-title="{s name="ConfirmAddressSelectButton"}Change address{/s}"
						   title="{s name="ConfirmAddressSelectButton"}Change address{/s}"
						   class="confirm--panel-nav-action btn is--secondary btn--billing-address-change">
							{s name="ConfirmAddressSelectButton"}Change address{/s}
						</a>
					{/block}
				</li>
			{/block}
			{block name="frontend_checkout_confirm_information_addresses_billing_panel_actions_select_address"}
				<li class="nav-item confirm--panel-nav-item address--actions-select">
					<a href="{url controller=address}"
					   data-address-selection="true"
					   data-sessionKey="checkoutBillingAddressId"
					   data-id="{$activeBillingAddressId}"
					   title="{s name="ConfirmAddressSelectLink"}{/s}"
					   class="confirm--panel-nav-action btn is--link btn--billing-address-select">
						{s name="ConfirmAddressSelectLink"}{/s}
					</a>
				</li>
			{/block}
		</ul>
	</div>
{/block}

{* Action buttons *}
{block name="frontend_checkout_confirm_information_addresses_shipping_panel_actions"}
	<div class="panel--actions panel--footer">
		<ul class="nav confirm--panel-nav">
			{block name="frontend_checkout_confirm_information_addresses_shipping_panel_actions_change"}
				<li class="nav-item confirm--panel-nav-item address--actions-change">
					{block name="frontend_checkout_confirm_information_addresses_shipping_panel_actions_change_address"}
						<a href="{url controller=address action=edit id=$activeShippingAddressId sTarget=checkout sTargetAction=confirm}"
						   title="{s name="ConfirmAddressSelectButton"}Change address{/s}"
						   data-title="{s name="ConfirmAddressSelectButton"}Change address{/s}"
						   data-address-editor="true"
						   data-id="{$activeShippingAddressId}"
						   data-sessionKey="checkoutShippingAddressId"
						   class="confirm--panel-nav-action btn is--secondary btn--shipping-address-change">
							{s name="ConfirmAddressSelectButton"}Change address{/s}
						</a>
					{/block}
				</li>
			{/block}
			{block name="frontend_checkout_confirm_information_addresses_shipping_panel_actions_select_address"}
			<li class="nav-item confirm--panel-nav-item address--actions-select">
				<a href="{url controller=address}"
				   data-address-selection="true"
				   data-sessionKey="checkoutShippingAddressId"
				   data-id="{$activeShippingAddressId}"
				   title="{s name="ConfirmAddressSelectLink"}{/s}"
				   class="confirm--panel-nav-action btn is--link btn--shipping-address-select">
					{s name="ConfirmAddressSelectLink"}{/s}
				</a>
			</li>
			{/block}
		</ul>
	</div>
{/block}

{block name='frontend_checkout_confirm_left_payment_method'}
	<div class="payment--method-info">
		<label class="payment--title">{s name="ConfirmInfoPaymentMethod" namespace="frontend/checkout/confirm"}{/s}</label>
		<div class="payment--description">{$sUserData.additional.payment.description}</div>
		
		{if $sUserData.additional.payment.additionaldescription}
			<div class="payment--additional-description">
				{$sUserData.additional.payment.additionaldescription}
			</div>
		{/if}
	</div>

	{if !$sUserData.additional.payment.esdactive && {config name="showEsd"}}
		<div class="payment--confirm-esd">{s name="ConfirmInfoInstantDownload" namespace="frontend/checkout/confirm"}{/s}</div>
	{/if}
{/block}

{block name='frontend_checkout_confirm_left_shipping_method'}
	<div class="shipping--method-info">
		<label class="shipping--title">{s name="ConfirmHeadDispatch"}{/s}</label>
		<div class="shipping--description" title="{$sDispatch.name}">{$sDispatch.name|truncate:25:"...":true}</div>
	
		{if $sDispatch.description}
			<div class="shipping--additional-description">
				{$sDispatch.description}
			</div>
		{/if}
	</div>
	{debug}
{/block}

{block name='frontend_checkout_confirm_left_payment_method_actions'}
	<div class="panel--actions panel--footer">
		<ul class="nav confirm--panel-nav">
			<li class="nav-item confirm--panel-nav-item change--payment-shipping">
				{* Action buttons *}
				<a href="{url controller=checkout action=shippingPayment sTarget=checkout}" class="confirm--panel-nav-action btn is--secondary btn--change-payment">
					{s name="ConfirmLinkChangePayment" namespace="frontend/checkout/confirm"}{/s}
				</a>
			</li>
		</ul>
	</div>
{/block}

{block name="frontend_checkout_confirm_product_table_content"}
	<div class="panel products--overview has--border">
		<div class="panel--table">

			{* Product table header *}
			{block name='frontend_checkout_confirm_confirm_head'}
				{include file="frontend/checkout/confirm_header.tpl"}
			{/block}

			{block name='frontend_checkout_confirm_item_before'}{/block}

			{* Basket items *}
			{block name='frontend_checkout_confirm_item_outer'}
				{foreach $sBasket.content as $sBasketItem}
					{block name='frontend_checkout_confirm_item'}
						{include file='frontend/checkout/confirm_item.tpl' isLast=$sBasketItem@last}
					{/block}
				{/foreach}
			{/block}

			{block name='frontend_checkout_confirm_item_after'}{/block}

			{* Table footer *}
			{block name='frontend_checkout_confirm_confirm_footer'}
				{include file="frontend/checkout/confirm_footer.tpl"}
			{/block}
		</div>
	</div>
{/block}

{block name='frontend_checkout_confirm_submit'}
	<div class="checkout--action action--checkout-confirm">
		{* Submit order button *}
		{if $sPayment.embediframe || $sPayment.action}
			<button type="submit" class="btn is--success btn--checkout-confirm" form="confirm--form" data-preloader-button="true">
				<i class="icon--check"></i>
				<span class="text-node">{s name='ConfirmDoPayment'}{/s}</span>
			</button>
		{else}
			<button type="submit" class="btn is--success btn--checkout-confirm" form="confirm--form" data-preloader-button="true">
				<i class="icon--check"></i>
				<span class="text-node">{s name='ConfirmActionSubmit'}{/s}</span>
			</button>
		{/if}
	</div>
{/block}
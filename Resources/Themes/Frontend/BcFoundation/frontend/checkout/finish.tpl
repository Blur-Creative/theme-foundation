{extends file='parent:frontend/checkout/finish.tpl'}

{block name='frontend_checkout_finish_teaser_content'}
	<div class="panel--body is--wide is--align-center teaser--content">
		{if $confirmMailDeliveryFailed}
			{include file="frontend/_includes/messages.tpl" type="error" content="{s name="FinishInfoConfirmationMailFailed"}{/s}"}
		{/if}

		<div class="teaser--text">
			{if !$confirmMailDeliveryFailed}
				{s name="FinishInfoConfirmationMail"}{/s}
				<br />
			{/if}

			{s name="FinishInfoPrintOrder"}{/s}
		</div>

		{block name='frontend_checkout_finish_teaser_actions'}
			<ul class="nav teaser--actions">

				{strip}
				<li class="nav-item teaser--actions-item">
					{* Back to the shop button *}
					<a href="{url controller='index'}" class="btn is--secondary teaser--action teaser--btn-back" title="{"{s name='FinishButtonBackToShop'}{/s}"|escape}">
						<i class="icon--arrow-left"></i>
						<span class="text-node">{"{s name="FinishButtonBackToShop"}{/s}"|replace:' ':'&nbsp;'}</span>
					</a>
				</li>

				<li class="nav-item teaser--actions-item">
					{* Print button *}
					<a href="#" class="btn is--primary teaser--action teaser--btn-print" onclick="self.print()" title="{"{s name='FinishLinkPrint'}{/s}"|escape}">
						{s name="FinishLinkPrint"}{/s}
					</a>
				</li>
				{/strip}
			</ul>

			{* Print notice *}
			{block name='frontend_checkout_finish_teaser_print_notice'}
				<div class="print--notice">
					{s name="FinishPrintNotice"}{/s}
				</div>
			{/block}
		{/block}
	</div>
{/block}

{block name='frontend_checkout_finish_left_payment_content'}
	<div class="panel--body is--wide payment--content">

		{* Invoice number *}
		{block name='frontend_checkout_finish_invoice_number'}
			{if $sOrderNumber}
				<div class="finish--details-info">
					<label class="finish--details-title">{s name="FinishInfoId"}{/s}</label>
					<div class="finish--details-content">{$sOrderNumber}</div>
				</div>
			{/if}
		{/block}

		{* Transaction number *}
		{block name='frontend_checkout_finish_transaction_number'}
			{if $sTransactionumber}
				<div class="finish--details-info">
					<label class="finish--details-title">{s name="FinishInfoTransaction"}{/s}</label>
					<div class="finish--details-content">{$sTransactionumber}</div>
				</div>
			{/if}
		{/block}

		{* Payment method *}
		{block name='frontend_checkout_finish_payment_method'}
			{if $sPayment.description}
				<div class="finish--details-info">
					<label class="finish--details-title">{s name="ConfirmHeaderPayment" namespace="frontend/checkout/confirm"}{/s}:</label>
					<div class="finish--details-content">{$sPayment.description}</div>
				</div>
			{/if}
		{/block}

		{* Dispatch method *}
		{block name='frontend_checkout_finish_dispatch_method'}
			{if $sDispatch.name}
			<div class="finish--details-info">
				<label class="finish--details-title">{s name="CheckoutDispatchHeadline" namespace="frontend/checkout/confirm_dispatch"}{/s}:</label>
				<div class="finish--details-content">{$sDispatch.name}</div>
			{/if}
		{/block}

	</div>
{/block}

{block name='frontend_checkout_finish_items'}
	<div class="finish--table product--table">
		<div class="panel has--border">
			<div class="panel--table is--rounded">

				{* Table header *}
				{block name='frontend_checkout_finish_table_header'}
					{include file="frontend/checkout/finish_header.tpl"}
				{/block}

				{* Article items *}
				{foreach $sBasket.content as $key => $sBasketItem}
					{block name='frontend_checkout_finish_item'}
						{include file='frontend/checkout/finish_item.tpl' isLast=$sBasketItem@last}
					{/block}
				{/foreach}

				{* Table footer *}
				{block name='frontend_checkout_finish_table_footer'}
					{include file="frontend/checkout/finish_footer.tpl"}
				{/block}
			</div>
		</div>
	</div>
{/block}
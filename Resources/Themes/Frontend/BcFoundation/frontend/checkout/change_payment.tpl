{extends file='parent:frontend/checkout/change_payment.tpl'}

{block name='frontend_checkout_payment_content'}
	<div class="payment--method-container panel--body is--wide block-group">
		{foreach $sPayments as $payment_mean}
			<div class="payment--method block{if $payment_mean@last} method_last{else} method{/if}{if $payment_mean.id eq $sFormData.payment or (!$sFormData && !$smarty.foreach.register_payment_mean.index)} active{/if}">
				<div class="panel has--border payment--method-panel">
					
					{block name="frontend_checkout_payment_fieldset_input"}
						<div class="panel--title payment--selection-head">
							<div class="custom-control custom-radio">
								{block name='frontend_checkout_payment_fieldset_input_radio'}
									<input type="radio"
										   name="payment"
										   class="custom-control-input payment--selection-input method--input radio auto_submit"
										   value="{$payment_mean.id}"
										   id="payment_mean{$payment_mean.id}"{if $payment_mean.id eq $sFormData.payment or (!$sFormData && !$smarty.foreach.register_payment_mean.index)} checked="checked"{/if} />
								{/block}
								{block name='frontend_checkout_payment_fieldset_input_label'}
									<label for="payment_mean{$payment_mean.id}" class="method--label method--name custom-control-label payment--selection-label">
										{$payment_mean.description}
									</label>
								{/block}
							</div>
						</div>
					{/block}
	
					{* Method Description *}
					{block name='frontend_checkout_payment_fieldset_description'}
						<div class="method--description payment--description is--last">
							{include file="string:{$payment_mean.additionaldescription}"}
						</div>
					{/block}
	
					{* Method Logo *}
					{block name='frontend_checkout_payment_fieldset_template'}
						<div class="payment--method-logo payment_logo_{$payment_mean.name}"></div>
						{if "frontend/plugins/payment/`$payment_mean.template`"|template_exists}
							<div class="method--bankdata{if $payment_mean.id != $form_data.payment} is--hidden{/if}">
								{include file="frontend/plugins/payment/`$payment_mean.template`" form_data=$sFormData error_flags=$sErrorFlag payment_means=$sPayments}
							</div>
						{/if}
					{/block}
				</div>				
			</div>
		{/foreach}
	</div>
{/block}
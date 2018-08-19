{extends file='parent:frontend/checkout/change_shipping.tpl'}

{block name='frontend_checkout_shipping_content'}
	<div class="dispatch--method-container panel--body is--wide block-group">
		{foreach $sDispatches as $dispatch}
			{block name="frontend_checkout_dispatch_container"}
				<div class="dispatch--method{if $dispatch@last} method_last{else} method{/if}{if $dispatch.id eq $sDispatch.id} active{/if} block">
					<div class="panel has--border dispatch--method-panel">
						
						{block name="frontend_checkout_dispatch_shipping_input"}
							<div class="panel--title dispatch--selection-head">
								<div class="custom-control custom-radio">
									{block name='frontend_checkout_dispatch_shipping_input_radio'}
										<input type="radio"
											   id="confirm_dispatch{$dispatch.id}"
											   class="custom-control-input shipping--selection-input method--input radio auto_submit"
											   value="{$dispatch.id}"
											   name="sDispatch"{if $dispatch.id eq $sDispatch.id} checked="checked"{/if} />
									{/block}
									{block name='frontend_checkout_dispatch_shipping_input_label'}
										<label class="method--label method--name custom-control-label shipping--selection-label" for="confirm_dispatch{$dispatch.id}">
											{$dispatch.name}
										</label>
									{/block}
								</div>
							</div>
						{/block}
	
						{* Method Description *}
						{block name='frontend_checkout_shipping_fieldset_description'}
							{if $dispatch.description}
								<div class="method--description">
									{$dispatch.description}
								</div>
							{/if}
						{/block}
					</div>
				</div>
			{/block}
		{/foreach}

		{* Actions *}
		{block name="frontend_checkout_shipping_action_buttons"}
			<input type="hidden" class="agb-checkbox" name="sAGB" value="{if $sAGBChecked}1{else}0{/if}" />
		{/block}
	</div>
{/block}
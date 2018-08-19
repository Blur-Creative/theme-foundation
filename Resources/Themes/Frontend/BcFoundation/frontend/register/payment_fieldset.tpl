{extends file='parent:frontend/register/payment_fieldset.tpl'}

{block name="frontend_register_payment_method"}
    <div class="payment--method panel--tr{if $payment_mean.id eq $form_data.payment or (!$form_data && !$payment_mean@index)} active{/if}">
        
        <div class="panel has--border payment--method-panel">
            {block name="frontend_register_payment_fieldset_input"}
                <div class="panel--title payment--selection-head">
                    <div class="custom-control custom-radio">
                        {block name="frontend_register_payment_fieldset_input_radio"}
                            <input type="radio"
                                   name="register[payment]"
                                   value="{$payment_mean.id}"
                                   id="payment_mean{$payment_mean.id}"{if $payment_mean.id eq $form_data.payment or (!$form_data && !$payment_mean@index)}checked="checked"{/if}
                                   class="custom-control-input payment--selection-input" />
                        {/block}
                        {block name="frontend_register_payment_fieldset_input_label"}
                            <label for="payment_mean{$payment_mean.id}" class="custom-control-label payment--selection-label">
                                {$payment_mean.description}
                            </label>
                        {/block}
                    </div>
                </div>
            {/block}
    
            {block name="frontend_register_payment_fieldset_description"}
                <div class="payment--description panel--td">
                    {include file="string:{$payment_mean.additionaldescription}"}
                </div>
            {/block}
    
            {block name='frontend_register_payment_fieldset_template'}
                <div class="payment_logo_{$payment_mean.name}"></div>
                {if "frontend/plugins/payment/`$payment_mean.template`"|template_exists}
                    <div class="payment--content{if $payment_mean.id != $form_data.payment} is--hidden{/if}">
                        {include file="frontend/plugins/payment/`$payment_mean.template`" checked = ($payment_mean.id == $form_data.payment)}
                    </div>
                {/if}
            {/block}
        </div>
    </div>
{/block}
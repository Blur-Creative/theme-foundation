{extends file='parent:frontend/address/form.tpl'}
{namespace name="frontend/address/index"}

{* Zip + City *}
{block name='frontend_address_form_input_zip_and_city'}
    <div class="address--zip-city">
        {if {config name=showZipBeforeCity}}
            <div class="address--zip">
                <input autocomplete="section-billing billing postal-code"
                       name="{$inputPrefix}[zipcode]"
                       type="text"
                       required="required"
                       aria-required="true"
                       placeholder="{s name='RegisterBillingPlaceholderZipcode' namespace="frontend/register/billing_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}"
                       id="zipcode"
                       value="{$formData.zipcode|escape}"
                       class="address--field address--spacer address--field-zipcode is--required{if $error_flags.zipcode} has--error{/if}"/>
            </div>
            <div class="address--city">
                <input autocomplete="section-billing billing address-level2"
                       name="{$inputPrefix}[city]"
                       type="text"
                       required="required"
                       aria-required="true"
                       placeholder="{s name='RegisterBillingPlaceholderCity' namespace="frontend/register/billing_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}"
                       id="city"
                       value="{$formData.city|escape}"
                       size="25"
                       class="address--field address--field-city is--required{if $error_flags.city} has--error{/if}"/>
            </div>
        {else}
            <div class="address--city">
                <input autocomplete="section-billing billing address-level2"
                       name="{$inputPrefix}[city]"
                       type="text"
                       required="required"
                       aria-required="true"
                       placeholder="{s name='RegisterBillingPlaceholderCity' namespace="frontend/register/billing_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}"
                       id="city"
                       value="{$formData.city|escape}"
                       size="25"
                       class="address--field address--spacer address--field-city is--required{if $error_flags.city} has--error{/if}"/>
            </div>
            <div class="address--zip">
                <input autocomplete="section-billing billing postal-code"
                       name="{$inputPrefix}[zipcode]"
                       type="text"
                       required="required"
                       aria-required="true"
                       placeholder="{s name='RegisterBillingPlaceholderZipcode' namespace="frontend/register/billing_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}"
                       id="zipcode"
                       value="{$formData.zipcode|escape}"
                       class="address--field address--field-zipcode is--required{if $error_flags.zipcode} has--error{/if}"/>
            </div>
        {/if}
    </div>
{/block}

{block name='frontend_address_form_input_set_default_shipping'}
    {if !$formData.id || $sUserData.additional.user.default_shipping_address_id != $formData.id}
        <div class="address--default-shipping">
            <div class="custom-control custom-checkbox">
                <input type="checkbox"
                       id="set_default_shipping"
                       name="{$inputPrefix}[additional][setDefaultShippingAddress]"
                       value="1"
                       class="custom-control-input" />
                <label for="set_default_shipping" class="custom-control-label">{s name="AddressesSetAsDefaultShippingAction"}{/s}</label>
            </div>
        </div>
    {/if}
{/block}

{block name='frontend_address_form_input_set_default_billing'}
    {if !$formData.id || $sUserData.additional.user.default_billing_address_id != $formData.id}
        <div class="address--default-billing">
            <div class="custom-control custom-checkbox">
                <input type="checkbox"
                       id="set_default_billing"
                       name="{$inputPrefix}[additional][setDefaultBillingAddress]"
                       value="1"
                       class="custom-control-input" />
                <label for="set_default_billing" class="custom-control-label">{s name="AddressesSetAsDefaultBillingAction"}{/s}</label>
            </div>
        </div>
    {/if}
{/block}

{* Billing actions *}
{block name="frontend_address_action_buttons"}
    <div class="panel--actions address--form-actions panel--footer">
        <ul class="nav account--panel-nav">
            <li class="nav-item account--panel-nav-item">
                {block name="frontend_address_action_button_send"}
                    <input type="submit" value="{s name="AddressesActionButtonSend"}Save address{/s}" class="btn is--success address--form-submit"/>
                {/block}
            </li>
        </ul>
    </div>
{/block}
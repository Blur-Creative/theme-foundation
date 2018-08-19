{extends file='parent:frontend/account/index.tpl'}

{* General user informations *}
{block name="frontend_account_index_info"}
    <div class="account--info account--box">
        
        <div class="panel has--border is--rounded">

            {block name="frontend_account_index_info_headline"}
                <h2 class="panel--title is--underline">{s name="AccountHeaderBasic"}{/s}</h2>
            {/block}

            {block name="frontend_account_index_info_content"}
                <div class="panel--body is--wide">
                    <p>
                        {$sUserData.additional.user.salutation|salutation}
                        {if {config name="displayprofiletitle"}}
                            {$sUserData.additional.user.title|escapeHtml}<br/>
                        {/if}
                        {$sUserData.additional.user.firstname|escapeHtml} {$sUserData.additional.user.lastname|escapeHtml}<br />
                        {if $sUserData.additional.user.birthday}
                            {$sUserData.additional.user.birthday|date:'dd.MM.y'}<br />
                        {/if}
                        {$sUserData.additional.user.email|escapeHtml}
                    </p>
                </div>
            {/block}

            {block name="frontend_account_index_info_actions"}
                <div class="panel--actions panel--footer">
                    <ul class="nav account--panel-nav">
                        <li class="nav-item account--panel-nav-item">
                            <a href="{url controller=account action=profile}" title="{s name='AccountLinkChangeProfile'}{/s}" class="btn is--secondary">
                                {s name='AccountLinkChangeProfile'}{/s}
                            </a>
                        </li>
                    </ul>
                </div>
            {/block}
        </div>
    </div>
{/block}

{* Payment information *}
{block name="frontend_account_index_payment_method"}
    <div class="account--payment account--box">
        
        <div class="panel has--border is--rounded">
            {block name="frontend_account_index_payment_method_headline"}
                <h2 class="panel--title is--underline">{s name="AccountHeaderPayment"}{/s}</h2>
            {/block}
    
            {block name="frontend_account_index_payment_method_content"}
                <div class="panel--body is--wide">
                    <p>
                        <strong>{$sUserData.additional.payment.description}</strong><br />
    
                        {if !$sUserData.additional.payment.esdactive && {config name="showEsd"}}
                            {s name="AccountInfoInstantDownloads"}{/s}
                        {/if}
                    </p>
                </div>
            {/block}
    
            {block name="frontend_account_index_payment_method_actions"}
                {$paymentMethodTitle = {"{s name='AccountLinkChangePayment'}{/s}"|escape}}
                
                <div class="panel--actions panel--footer">
                    <ul class="nav account--panel-nav">
                        <li class="nav-item account--panel-nav-item">
                            <a href="{url controller='account' action='payment'}"
                               title="{$paymentMethodTitle|escape}"
                               class="btn is--secondary">
                                {s name='AccountLinkChangePayment'}{/s}
                            </a>
                        </li>
                    </ul>
                </div>
            {/block}
        </div>
    </div>
{/block}

{* Billing addresses *}
{block name="frontend_account_index_primary_billing"}
    <div class="account--billing account--box">

        <div class="panel has--border is--rounded">
            {block name="frontend_account_index_primary_billing_headline"}
                <h2 class="panel--title is--underline">{s name="AccountHeaderPrimaryBilling"}{/s}</h2>
            {/block}

            {block name="frontend_account_index_primary_billing_content"}
                <div class="panel--body is--wide">
                    {if $sUserData.billingaddress.company}
                        <p>
                            <span class="address--company">{$sUserData.billingaddress.company|escapeHtml}</span>{if $sUserData.billingaddress.department} - <span class="address--department">{$sUserData.billingaddress.department|escapeHtml}</span>{/if}
                        </p>
                    {/if}
                    <p>
                        <span class="address--salutation">{$sUserData.billingaddress.salutation|salutation|escapeHtml}</span>
                        {if {config name="displayprofiletitle"}}
                            <span class="address--title">{$sUserData.billingaddress.title|escapeHtml}</span><br/>
                        {/if}
                        <span class="address--firstname">{$sUserData.billingaddress.firstname|escapeHtml}</span> <span class="address--lastname">{$sUserData.billingaddress.lastname|escapeHtml}</span><br />
                        <span class="address--street">{$sUserData.billingaddress.street|escapeHtml}</span><br />
                        {if $sUserData.billingaddress.additional_address_line1}<span class="address--additional-one">{$sUserData.billingaddress.additional_address_line1|escapeHtml}</span><br />{/if}
                        {if $sUserData.billingaddress.additional_address_line2}<span class="address--additional-two">{$sUserData.billingaddress.additional_address_line2|escapeHtml}</span><br />{/if}
                        {if {config name=showZipBeforeCity}}
                            <span class="address--zipcode">{$sUserData.billingaddress.zipcode|escapeHtml}</span> <span class="address--city">{$sUserData.billingaddress.city|escapeHtml}</span>
                        {else}
                            <span class="address--city">{$sUserData.billingaddress.city|escapeHtml}</span> <span class="address--zipcode">{$sUserData.billingaddress.zipcode|escapeHtml}</span>
                        {/if}<br />
                        {if $sUserData.additional.state.statename}<span class="address--statename">{$sUserData.additional.state.statename|escapeHtml}</span><br />{/if}
                        <span class="address--countryname">{$sUserData.additional.country.countryname|escapeHtml}</span>
                    </p>
                </div>
            {/block}

            {block name="frontend_account_index_primary_billing_actions"}
                <div class="panel--actions panel--footer">
                    <ul class="nav account--panel-nav">
                        <li class="nav-item account--panel-nav-item">
                            <a href="{url controller=address action=edit id=$sUserData.additional.user.default_billing_address_id sTarget=account}"
                               title="{s name='AccountLinkChangeBilling'}{/s}"
                               class="btn is--secondary">
                                {s name="AccountLinkChangeBilling" namespace="themes/bcfoundation/frontend/account/index"}{/s}
                            </a>
                        </li>
                        <li class="nav-item account--panel-nav-item">
                            <a href="{url controller=address}"
                               data-address-selection="true"
                               data-setDefaultBillingAddress="1"
                               data-id="{$sUserData.additional.user.default_billing_address_id}"
                               title="{s name='AccountLinkChangeBilling'}{/s}"
                               class="btn is--link">
                                {s name="AccountLinkSelectBilling" namespace="themes/bcfoundation/frontend/account/index"}{/s}
                            </a>
                        </li>
                    </ul>
                </div>
            {/block}
        </div>
    </div>
{/block}

{* Shipping addresses *}
{block name="frontend_account_index_primary_shipping"}
    <div class="account--shipping account--box">
        
        <div class="panel has--border is--rounded">
            {block name="frontend_account_index_primary_shipping_headline"}
                <h2 class="panel--title is--underline">{s name="AccountHeaderPrimaryShipping"}{/s}</h2>
            {/block}
    
            {block name="frontend_account_index_primary_shipping_content"}
                <div class="panel--body is--wide">
                    {if $activeBillingAddressId == $activeShippingAddressId}
                        {block name="frontend_account_index_primary_shipping_content_equality_notice"}
                            <div class="shipping--equal-info">
                                {s name="AccountAddressEqualsBilling"}Equal to the billing address{/s}
                            </div>
                        {/block}
                    {else}
                        {block name="frontend_account_index_primary_shipping_content_address"}
                            {if $sUserData.shippingaddress.company}
                                <p>
                                    <span class="address--company">{$sUserData.shippingaddress.company|escapeHtml}</span>{if $sUserData.shippingaddress.department} - <span class="address--department">{$sUserData.shippingaddress.department|escapeHtml}</span>{/if}
                                </p>
                            {/if}
                            <p>
                                <span class="address--salutation">{$sUserData.shippingaddress.salutation|salutation}</span>
                                {if {config name="displayprofiletitle"}}
                                    <span class="address--title">{$sUserData.shippingaddress.title|escapeHtml}</span><br/>
                                {/if}
                                <span class="address--firstname">{$sUserData.shippingaddress.firstname|escapeHtml}</span> <span class="address--lastname">{$sUserData.shippingaddress.lastname|escapeHtml}</span><br />
                                <span class="address--street">{$sUserData.shippingaddress.street|escapeHtml}</span><br />
                                {if $sUserData.shippingaddress.additional_address_line1}<span class="address--additional-one">{$sUserData.shippingaddress.additional_address_line1|escapeHtml}</span><br />{/if}
                                {if $sUserData.shippingaddress.additional_address_line2}<span class="address--additional-two">{$sUserData.shippingaddress.additional_address_line2|escapeHtml}</span><br />{/if}
                                {if {config name=showZipBeforeCity}}
                                    <span class="address--zipcode">{$sUserData.shippingaddress.zipcode|escapeHtml}</span> <span class="address--city">{$sUserData.shippingaddress.city|escapeHtml}</span>
                                {else}
                                    <span class="address--city">{$sUserData.shippingaddress.city|escapeHtml}</span> <span class="address--zipcode">{$sUserData.shippingaddress.zipcode|escapeHtml}</span>
                                {/if}<br />
                                {if $sUserData.additional.stateShipping.statename}<span class="address--statename">{$sUserData.additional.stateShipping.statename|escapeHtml}</span><br />{/if}
                                <span class="address--countryname">{$sUserData.additional.countryShipping.countryname|escapeHtml}</span>
                            </p>
                        {/block}
                    {/if}
                </div>
            {/block}
    
            {block name="frontend_account_index_primary_shipping_actions"}
                <div class="panel--actions panel--footer">
                    <ul class="nav account--panel-nav">
                        {if $activeBillingAddressId == $activeShippingAddressId}
                            {block name="frontend_account_index_primary_shipping_choose_seperate_address"}
                                <li class="nav-item account--panel-nav-item">
                                    <a href="{url controller=address}"
                                       class="btn is--secondary choose-different-address"
                                       data-address-selection="true"
                                       data-setDefaultShippingAddress="1"
                                       data-id="{$sUserData.additional.user.default_shipping_address_id}"
                                       title="{s name="ConfirmAddressChooseDifferentShippingAddress" namespace="frontend/checkout/confirm"}{/s}">
                                        {s name="ConfirmAddressChooseDifferentShippingAddress" namespace="frontend/checkout/confirm"}{/s}
                                    </a>
                                </li>
                            {/block}
                        {else}
                            {block name="frontend_account_index_primary_shipping_add_select_address"}
                                <li class="nav-item account--panel-nav-item">
                                    <a href="{url controller=address action=edit id=$sUserData.additional.user.default_shipping_address_id sTarget=account}"
                                       title="{s name='AccountLinkChangeShipping'}{/s}"
                                       class="btn is--secondary">
                                        {s name="AccountLinkChangeShipping"}{/s}
                                    </a>
                                </li>
                                <li class="nav-item account--panel-nav-item">
                                    <a href="{url controller=address}"
                                       data-address-selection="true"
                                       data-setDefaultShippingAddress="1"
                                       data-id="{$sUserData.additional.user.default_shipping_address_id}"
                                       title="{s name='AccountLinkSelectShipping'}{/s}"
                                       class="btn is--link">
                                        {s name="AccountLinkSelectShipping"}{/s}
                                    </a>
                                </li>
                            {/block}
                        {/if}
                    </ul>
                </div>
            {/block}
        </div>
    </div>
{/block}

{block name="frontend_account_index_newsletter_settings_content"}
    <div class="panel--body is--wide">
        <form name="frmRegister" method="post" action="{url action=saveNewsletter}">
            <fieldset>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox"
                           name="newsletter"
                           value="1" id="newsletter"
                           data-auto-submit="true" {if $sUserData.additional.user.newsletter}checked="checked"{/if}
                           class="custom-control-input" />
                    <label for="newsletter" class="custom-control-label">
                        {s name="AccountLabelWantNewsletter"}{/s}
                    </label>
                </div>
            </fieldset>
        </form>
    </div>
{/block}
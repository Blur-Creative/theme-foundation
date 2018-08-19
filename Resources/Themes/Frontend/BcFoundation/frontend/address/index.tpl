{extends file='parent:frontend/address/index.tpl'}

{block name="frontend_address_item_content"}
    <div class="address--item-content address--box">
        <div class="panel has--border is--rounded block">
            {block name="frontend_address_item_content_title"}
                {if $sUserData.additional.user.default_shipping_address_id == $address.id || $sUserData.additional.user.default_billing_address_id == $address.id}
                    <div class="panel--title is--underline">
                        {if $sUserData.additional.user.default_shipping_address_id == $address.id}
                            <div>{s name="AddressesTitleDefaultShippingAddress"}Default shipping address{/s}</div>
                        {/if}
                        {if $sUserData.additional.user.default_billing_address_id == $address.id}
                            <div>{s name="AddressesTitleDefaultBillingAddress"}Default billing address{/s}</div>
                        {/if}
                    </div>
                {/if}
            {/block}
            <div class="panel--body is--wide">
                {block name="frontend_address_item_content_body"}
                    <div class="address--item-body">
                        {block name="frontend_address_item_content_inner"}
                            {if $address.company}
                                <p><span class="address--company">{$address.company|escapeHtml}</span>{if $address.department} - <span class="address--department">{$address.department|escapeHtml}</span>{/if}</p>
                            {/if}
                            <span class="address--salutation">{$address.salutation|salutation}</span>
                            {if {config name="displayprofiletitle"}}
                                <span class="address--title">{$address.title|escapeHtml}</span><br/>
                            {/if}
                            <span class="address--firstname">{$address.firstname|escapeHtml}</span> <span class="address--lastname">{$address.lastname|escapeHtml}</span><br />
                            <span class="address--street">{$address.street|escapeHtml}</span><br />
                            {if $address.additionalAddressLine1}<span class="address--additional-one">{$address.additionalAddressLine1|escapeHtml}</span><br />{/if}
                            {if $address.additionalAddressLine2}<span class="address--additional-two">{$address.additionalAddressLine2|escapeHtml}</span><br />{/if}
                            {if {config name=showZipBeforeCity}}
                                <span class="address--zipcode">{$address.zipcode|escapeHtml}</span> <span class="address--city">{$address.city|escapeHtml}</span>
                            {else}
                                <span class="address--city">{$address.city|escapeHtml}</span> <span class="address--zipcode">{$address.zipcode|escapeHtml}</span>
                            {/if}<br />
                            {if $address.state.name}<span class="address--statename">{$address.state.name|escapeHtml}</span><br />{/if}
                            <span class="address--countryname">{$address.country.name|escapeHtml}</span>
                        {/block}
                    </div>
                {/block}
            </div>

            {block name="frontend_address_item_content_actions"}
                <div class="address--item-actions panel--actions panel--footer">

                    <ul class="nav account--panel-nav">
                        
                        {block name="frontend_address_item_content_actions_change"}
                            <li class="nav-item account--panel-nav-item">
                                <a href="{url controller=address action=edit id=$address.id}" title="{s name="AddressesContentItemActionEdit"}Change{/s}" class="btn is--info btn--address-edit">
                                    {s name="AddressesContentItemActionEdit"}Change{/s}
                                </a>
                            </li>
                        {/block}
    
                        {block name="frontend_address_item_content_actions_delete"}
                            {if $sUserData.additional.user.default_shipping_address_id != $address.id && $sUserData.additional.user.default_billing_address_id != $address.id}
                                <li class="nav-item account--panel-nav-item">
                                    <a href="{url controller=address action=delete id=$address.id}" title="{s name="AddressesContentItemActionDelete"}Delete{/s}" class="btn is--danger btn--address-delete">
                                        {s name="AddressesContentItemActionDelete"}Delete{/s}
                                    </a>
                                </li>
                            {/if}
                        {/block}
                        
                        {block name="frontend_address_item_content_set_default"}
                            <li class="nav-item account--panel-nav-item address--actions-set-defaults">
    
                                {block name="frontend_address_item_content_set_default_shipping"}
                                    {if $sUserData.additional.user.default_shipping_address_id != $address.id}
                                        <form action="{url controller="address" action="setDefaultShippingAddress"}" method="post">
                                            <input type="hidden" name="addressId" value="{$address.id}" />
                                            <button type="submit" class="btn is--link btn--set-default-address">{s name="AddressesSetAsDefaultShippingAction"}{/s}</button>
                                        </form>
                                    {/if}
                                {/block}
    
                                {block name="frontend_address_item_content_set_default_billing"}
                                    {if $sUserData.additional.user.default_billing_address_id != $address.id}
                                        <form action="{url controller="address" action="setDefaultBillingAddress"}" method="post">
                                            <input type="hidden" name="addressId" value="{$address.id}" />
                                            <button type="submit" class="btn is--link btn--set-default-address">{s name="AddressesSetAsDefaultBillingAction"}{/s}</button>
                                        </form>
                                    {/if}
                                {/block}
    
                            </li>
                        {/block}
                    </ul>
                </div>
            {/block}

        </div>
    </div>
{/block}

{block name="frontend_address_item_content_create"}
    <div class="address--item-content address--item-create block">
        <a href="{url controller=address action=create}" title="{s name="AddressesContentItemActionCreate"}Create new address +{/s}" class="btn is--large is--primary">
            <i class="icon--plus3"></i>
            <span class="text-node">{s name="AddressesContentItemActionCreate"}Create new address{/s}</span>
        </a>
    </div>
{/block}